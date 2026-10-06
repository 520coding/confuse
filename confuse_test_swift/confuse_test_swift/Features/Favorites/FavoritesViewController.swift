//
//  FavoritesViewController.swift
//  confuse_test_swift
//

import UIKit

final class FavoritesViewController: UIViewController {

    private var meals: [MealSummary] = []

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.rowHeight = 84
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MealCell.self, forCellReuseIdentifier: MealCell.reuseIdentifier)
        return tableView
    }()

    private let emptyLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = L("tab.favorites")
        view.backgroundColor = Theme.background

        emptyLabel.text = L("favorites.empty")
        emptyLabel.textColor = Theme.subtitle
        emptyLabel.textAlignment = .center
        emptyLabel.numberOfLines = 0

        view.addSubview(tableView)
        view.addSubview(emptyLabel)

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(reload),
                                               name: .favoritesDidChange,
                                               object: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reload()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        emptyLabel.frame = CGRect(x: 32, y: view.bounds.midY - 40,
                                  width: view.bounds.width - 64, height: 80)
    }

    @objc private func reload() {
        meals = FavoritesStore.shared.meals
        emptyLabel.isHidden = !meals.isEmpty
        tableView.reloadData()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension FavoritesViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MealCell.reuseIdentifier, for: indexPath)
        if let cell = cell as? MealCell {
            cell.configure(with: meals[indexPath.row])
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let meal = meals[indexPath.row]
        let detail = MealDetailViewController(mealID: meal.id, summary: meal)
        navigationController?.pushViewController(detail, animated: true)
    }

    // Swipe-to-remove — unfavorites the meal; the favorites notification drives
    // the table refresh.
    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard indexPath.row < meals.count else { return nil }
        let meal = meals[indexPath.row]
        let remove = UIContextualAction(style: .destructive, title: L("action.remove")) { _, _, completion in
            FavoritesStore.shared.toggle(meal)
            completion(true)
        }
        remove.image = UIImage(systemName: "star.slash")
        return UISwipeActionsConfiguration(actions: [remove])
    }
}
