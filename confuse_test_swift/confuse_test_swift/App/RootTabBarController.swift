//
//  RootTabBarController.swift
//  confuse_test_swift
//

import UIKit

class RootTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Theme.background
        setupChildren()
    }

    private func setupChildren() {
        let categories = UINavigationController(rootViewController: CategoriesViewController())
        categories.tabBarItem = UITabBarItem(title: L("tab.categories"),
                                             image: UIImage(systemName: "square.grid.2x2"),
                                             selectedImage: UIImage(systemName: "square.grid.2x2.fill"))

        let favorites = UINavigationController(rootViewController: FavoritesViewController())
        favorites.tabBarItem = UITabBarItem(title: L("tab.favorites"),
                                            image: UIImage(systemName: "star"),
                                            selectedImage: UIImage(systemName: "star.fill"))

        viewControllers = [categories, favorites]
        tabBar.tintColor = Theme.primary
    }
}
