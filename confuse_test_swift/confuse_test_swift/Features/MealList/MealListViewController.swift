//
//  MealListViewController.swift
//  confuse_test_swift
//

import UIKit

final class MealListViewController: UIViewController {

    private let viewModel: MealListViewModel
    private let searchController = UISearchController(searchResultsController: nil)

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.rowHeight = 84
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MealCell.self, forCellReuseIdentifier: MealCell.reuseIdentifier)
        return tableView
    }()

    private let emptyLabel = UILabel()

    init(category: String) {
        self.viewModel = MealListViewModel(category: category)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.category
        view.backgroundColor = Theme.background

        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = L("search.placeholder")
        navigationItem.searchController = searchController

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "line.3.horizontal.decrease.circle"),
            style: .plain,
            target: self,
            action: #selector(showFilterOptions))

        emptyLabel.text = L("list.empty")
        emptyLabel.textColor = Theme.subtitle
        emptyLabel.textAlignment = .center
        emptyLabel.isHidden = true

        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        tableView.refreshControl = refreshControl

        view.addSubview(tableView)
        view.addSubview(emptyLabel)
        bind()

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(favoritesChanged),
                                               name: .favoritesDidChange,
                                               object: nil)
        viewModel.loadCategory()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        emptyLabel.frame = CGRect(x: 0, y: view.bounds.midY - 20, width: view.bounds.width, height: 40)
    }

    private func bind() {
        viewModel.onChange = { [weak self] in
            guard let self = self else { return }
            self.tableView.refreshControl?.endRefreshing()
            self.emptyLabel.isHidden = !self.viewModel.isEmptyState
            self.tableView.reloadData()
        }
        viewModel.onError = { [weak self] message in
            guard let self = self else { return }
            self.tableView.refreshControl?.endRefreshing()
            self.emptyLabel.isHidden = false
            self.tableView.reloadData()
            print("[MealList] error: \(message)")
        }
    }

    @objc private func handleRefresh() {
        viewModel.loadCategory()
    }

    @objc private func favoritesChanged() {
        tableView.reloadData()
    }

    @objc private func showFilterOptions() {
        let sheet = UIAlertController(title: L("sort.title"), message: nil, preferredStyle: .actionSheet)
        for order in MealSortOrder.allCases {
            let prefix = viewModel.sortOrder == order ? "✓ " : ""
            sheet.addAction(UIAlertAction(title: prefix + order.title, style: .default) { [weak self] _ in
                self?.viewModel.setSortOrder(order)
            })
        }
        let favTitle = viewModel.favoritesOnly ? L("filter.showAll") : L("filter.favoritesOnly")
        sheet.addAction(UIAlertAction(title: favTitle, style: .default) { [weak self] _ in
            self?.viewModel.toggleFavoritesOnly()
        })
        sheet.addAction(UIAlertAction(title: L("action.cancel"), style: .cancel))
        sheet.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(sheet, animated: true)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension MealListViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MealCell.reuseIdentifier, for: indexPath)
        if let cell = cell as? MealCell, let meal = viewModel.meal(at: indexPath.row) {
            cell.configure(with: meal)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let meal = viewModel.meal(at: indexPath.row) else { return }
        let detail = MealDetailViewController(mealID: meal.id, summary: meal)
        navigationController?.pushViewController(detail, animated: true)
    }
}

extension MealListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        viewModel.search(searchController.searchBar.text ?? "")
    }
}
