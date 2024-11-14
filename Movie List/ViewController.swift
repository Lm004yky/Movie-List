import UIKit
import SDWebImage

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    private var tableView = UITableView()
    private var searchBar = UISearchBar()
    private var movies: [Movie] = []
    private var filteredMovies: [Movie] = []
    private var isSearching = false

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupSearchBar()
        fetchMovies()
    }

    private func setupTableView() {
        tableView.register(MovieCell.self, forCellReuseIdentifier: MovieCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.frame = view.bounds
        tableView.rowHeight = 160
        tableView.separatorStyle = .none
        view.addSubview(tableView)
    }

    private func setupSearchBar() {
        searchBar.delegate = self
        searchBar.placeholder = "Search movies"
        searchBar.sizeToFit()
        tableView.tableHeaderView = searchBar
    }

    private func fetchMovies() {
        Task {
            do {
                movies = try await NetworkManager.shared.fetchTrendingMovies()
                filteredMovies = movies
                DispatchQueue.main.async { [weak self] in
                    self?.tableView.reloadData()
                }
            } catch {
                print("Error fetching movies: \(error)")
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearching ? filteredMovies.count : movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.identifier, for: indexPath) as? MovieCell else {
            return UITableViewCell()
        }
        let movie = isSearching ? filteredMovies[indexPath.row] : movies[indexPath.row]
        cell.configure(with: movie)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = isSearching ? filteredMovies[indexPath.row] : movies[indexPath.row]
        let detailVC = DetailViewController()
        detailVC.movie = movie
        navigationController?.pushViewController(detailVC, animated: true)
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        isSearching = !searchText.isEmpty
        filteredMovies = movies.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        tableView.reloadData()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        searchBar.text = ""
        tableView.reloadData()
    }
}
