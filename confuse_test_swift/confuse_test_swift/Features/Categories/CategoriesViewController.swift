//
//  CategoriesViewController.swift
//  confuse_test_swift
//

import UIKit

final class CategoriesViewController: UIViewController {

    private let viewModel = CategoriesViewModel()

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.rowHeight = 96
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "CategoryCell", bundle: nil),
                           forCellReuseIdentifier: CategoryCell.reuseIdentifier)
        return tableView
    }()

    private let activityIndicator = UIActivityIndicatorView(style: .medium)

    override func viewDidLoad() {
        super.viewDidLoad()
        title = L("categories.title")
        view.backgroundColor = Theme.background

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "shuffle"),
            style: .plain,
            target: self,
            action: #selector(showRandomMeal))

        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        tableView.refreshControl = refreshControl

        view.addSubview(tableView)
        view.addSubview(activityIndicator)
        bind()

        activityIndicator.startAnimating()
        _ = LoadingAnimation.spinnerData() // warm the bundled loading animation
        viewModel.load()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        activityIndicator.center = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
    }

    private func bind() {
        viewModel.onChange = { [weak self] in
            guard let self = self else { return }
            self.activityIndicator.stopAnimating()
            self.tableView.refreshControl?.endRefreshing()
            self.tableView.reloadData()
        }
        viewModel.onError = { [weak self] message in
            guard let self = self else { return }
            self.activityIndicator.stopAnimating()
            self.tableView.refreshControl?.endRefreshing()
            self.presentError(message)
        }
    }

    @objc private func handleRefresh() {
        viewModel.load()
    }

    /// "Surprise me" — fetches a random meal via the `async`/`await` API and
    /// pushes its detail. Exercises Swift concurrency (`Task` / `await`).
    @objc private func showRandomMeal() {
        Task { [weak self] in
            do {
                let response: MealDetailResponse = try await APIClient.shared.value(for: .random)
                guard let meal = response.meals?.first else { return }
                let summary = MealSummary(id: meal.id, name: meal.name, thumbnailURL: meal.thumbnailURL)
                let detail = MealDetailViewController(mealID: meal.id, summary: summary)
                self?.navigationController?.pushViewController(detail, animated: true)
            } catch {
                self?.presentError(String(describing: error))
            }
        }
    }

    private func presentError(_ message: String) {
        let alert = UIAlertController(title: L("error.title"), message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: L("action.ok"), style: .default))
        present(alert, animated: true)
    }
}

extension CategoriesViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryCell.reuseIdentifier, for: indexPath)
        if let cell = cell as? CategoryCell, let category = viewModel.category(at: indexPath.row) {
            cell.configure(with: category)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let category = viewModel.category(at: indexPath.row) else { return }
        let listController = MealListViewController(category: category.name)
        navigationController?.pushViewController(listController, animated: true)
    }
}
