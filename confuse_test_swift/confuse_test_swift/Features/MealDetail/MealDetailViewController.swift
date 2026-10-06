//
//  MealDetailViewController.swift
//  confuse_test_swift
//

import UIKit

final class MealDetailViewController: UIViewController {

    private enum Section: Int, CaseIterable {
        case ingredients
        case instructions
        case video
    }

    private let viewModel: MealDetailViewModel
    private let headerView = MealHeaderView()

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()

    init(mealID: String, summary: MealSummary?) {
        self.viewModel = MealDetailViewModel(mealID: mealID, summary: summary)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Theme.background
        title = viewModel.title

        headerView.configure(name: viewModel.title, meta: "", tags: "", thumbnailURL: viewModel.thumbnailURL)
        tableView.tableHeaderView = headerView
        view.addSubview(tableView)

        updateNavButtons()
        bind()
        viewModel.load()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        headerView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: MealHeaderView.preferredHeight)
        tableView.tableHeaderView = headerView
    }

    private func bind() {
        viewModel.onChange = { [weak self] in
            guard let self = self else { return }
            self.title = self.viewModel.title
            self.headerView.configure(name: self.viewModel.title,
                                      meta: self.viewModel.metaText,
                                      tags: self.viewModel.tagsText,
                                      thumbnailURL: self.viewModel.thumbnailURL)
            self.tableView.reloadData()
        }
        viewModel.onError = { message in
            print("[MealDetail] error: \(message)")
        }
    }

    private func updateNavButtons() {
        let favName = viewModel.isFavorite ? "star.fill" : "star"
        let favorite = UIBarButtonItem(image: UIImage(systemName: favName),
                                       style: .plain,
                                       target: self,
                                       action: #selector(toggleFavorite))
        let share = UIBarButtonItem(barButtonSystemItem: .action,
                                    target: self,
                                    action: #selector(shareMeal))
        navigationItem.rightBarButtonItems = [favorite, share]
    }

    @objc private func toggleFavorite() {
        viewModel.toggleFavorite()
        updateNavButtons()
    }

    @objc private func shareMeal() {
        let controller = UIActivityViewController(activityItems: [viewModel.shareText],
                                                  applicationActivities: nil)
        controller.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItems?.last
        present(controller, animated: true)
    }
}

extension MealDetailViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.allCases.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Section(rawValue: section) {
        case .ingredients:
            return viewModel.ingredients.count
        case .instructions:
            return viewModel.instructions.isEmpty ? 0 : 1
        case .video:
            return viewModel.hasVideo ? 1 : 0
        case .none:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch Section(rawValue: section) {
        case .ingredients:
            return viewModel.ingredients.isEmpty ? nil : L("detail.ingredients")
        case .instructions:
            return viewModel.instructions.isEmpty ? nil : L("detail.instructions")
        case .video:
            return viewModel.hasVideo ? L("detail.video") : nil
        case .none:
            return nil
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.selectionStyle = .none
        cell.accessoryType = .none
        cell.textLabel?.font = Theme.body
        cell.textLabel?.textColor = Theme.subtitle

        switch Section(rawValue: indexPath.section) {
        case .ingredients:
            let ingredient = viewModel.ingredients[indexPath.row]
            cell.textLabel?.numberOfLines = 1
            cell.textLabel?.text = ingredient.displayText
        case .instructions:
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.text = viewModel.instructions
        case .video:
            cell.selectionStyle = .default
            cell.accessoryType = .disclosureIndicator
            cell.textLabel?.numberOfLines = 1
            cell.textLabel?.textColor = Theme.accent
            cell.textLabel?.text = L("detail.watchVideo")
        case .none:
            cell.textLabel?.text = nil
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard Section(rawValue: indexPath.section) == .video,
              let url = viewModel.youtubeURL else {
            return
        }
        UIApplication.shared.open(url)
    }
}
