//
//  ImageLoader.swift
//  confuse_test_swift
//
//  Async remote image loading with an in-memory cache — the core component
//  that lets the app show real photos from the network.
//

import UIKit

final class ImageLoader {

    static let shared = ImageLoader()

    private let cache = NSCache<NSURL, UIImage>()
    private let session: URLSession
    private var runningTasks: [UUID: URLSessionDataTask] = [:]
    private let lock = NSLock()

    init(session: URLSession = .shared) {
        self.session = session
        cache.countLimit = 200
    }

    func cachedImage(for url: URL) -> UIImage? {
        return cache.object(forKey: url as NSURL)
    }

    @discardableResult
    func load(_ url: URL, completion: @escaping (UIImage?) -> Void) -> UUID? {
        if let cached = cachedImage(for: url) {
            completion(cached)
            return nil
        }

        let token = UUID()
        let task = session.dataTask(with: url) { [weak self] data, _, _ in
            guard let self = self else { return }
            self.lock.lock()
            self.runningTasks[token] = nil
            self.lock.unlock()

            guard let data = data, let image = UIImage(data: data) else {
                DispatchQueue.main.async { completion(nil) }
                return
            }
            self.cache.setObject(image, forKey: url as NSURL)
            DispatchQueue.main.async { completion(image) }
        }

        lock.lock()
        runningTasks[token] = task
        lock.unlock()
        task.resume()
        return token
    }

    func cancel(_ token: UUID?) {
        guard let token = token else { return }
        lock.lock()
        let task = runningTasks[token]
        runningTasks[token] = nil
        lock.unlock()
        task?.cancel()
    }
}
