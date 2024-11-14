import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)

        let movieListVC = UINavigationController(rootViewController: MovieListViewController())
        movieListVC.tabBarItem = UITabBarItem(title: "Movies", image: UIImage(systemName: "film"), tag: 0)

        let favoritesVC = UINavigationController(rootViewController: FavoritesViewController())
        favoritesVC.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "star.fill"), tag: 1)

        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [movieListVC, favoritesVC]
        
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .white
            tabBarController.tabBar.scrollEdgeAppearance = appearance
            tabBarController.tabBar.standardAppearance = appearance
        } else {
            UITabBar.appearance().barTintColor = .white
        }

        window?.overrideUserInterfaceStyle = .light

        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()

        return true
    }
}
