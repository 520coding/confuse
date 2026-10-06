//
//  APIClient.swift
//  confuse_test_swift
//

import Foundation

enum APIError: Error {
    case invalidURL
    case transport(Error)
    case emptyData
    case decoding(Error)
}

final class APIClient {

    static let shared = APIClient()

    private let session: URLSession
    private let decoder = JSONDecoder()

    init(session: URLSession = .shared) {
        self.session = session
    }

    @discardableResult
    func request<T: Decodable>(_ endpoint: Endpoint,
                               as type: T.Type = T.self,
                               completion: @escaping (Result<T, APIError>) -> Void) -> URLSessionDataTask? {
        guard let url = endpoint.url else {
            completion(.failure(.invalidURL))
            return nil
        }

        log("→ GET \(url.absoluteString)")

        let task = session.dataTask(with: url) { [weak self] data, _, error in
            guard let self = self else { return }

            if let error = error {
                self.finish(.failure(.transport(error)), completion)
                return
            }
            guard let data = data, !data.isEmpty else {
                self.finish(.failure(.emptyData), completion)
                return
            }
            do {
                let value = try self.decoder.decode(T.self, from: data)
                self.finish(.success(value), completion)
            } catch {
                self.finish(.failure(.decoding(error)), completion)
            }
        }
        task.resume()
        return task
    }

    /// `async`/`await` façade over the closure-based `request`. Bridged through a
    /// continuation so it runs on the iOS 13 deployment target (no iOS 15
    /// `URLSession.data(from:)` required) while still exercising Swift concurrency.
    func value<T: Decodable>(for endpoint: Endpoint, as type: T.Type = T.self) async throws -> T {
        return try await withCheckedThrowingContinuation { continuation in
            request(endpoint) { (result: Result<T, APIError>) in
                continuation.resume(with: result)
            }
        }
    }

    private func finish<T>(_ result: Result<T, APIError>,
                           _ completion: @escaping (Result<T, APIError>) -> Void) {
        DispatchQueue.main.async {
            completion(result)
        }
    }

    private func log(_ message: String) {
        guard isVerboseLoggingEnabled else { return }
        print("[APIClient] \(message)")
    }
}
