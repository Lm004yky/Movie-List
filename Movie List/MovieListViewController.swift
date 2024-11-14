import UIKit
import SDWebImage

class MovieListViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate {
    private let searchBar = UISearchBar()
    private let filterButton = UIButton(type: .system)
    private let tableView = UITableView()
    private let viewModel = MovieListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        overrideUserInterfaceStyle = .light
        setupHeader()
        setupTableView()
        fetchMovies()
    }
    
    private func setupHeader() {
        searchBar.delegate = self
        searchBar.placeholder = "Search Movies"
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        filterButton.setTitle("Filters", for: .normal)
        filterButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        filterButton.setTitleColor(.black, for: .normal)
        filterButton.addTarget(self, action: #selector(showFilters), for: .touchUpInside)
        filterButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(searchBar)
        view.addSubview(filterButton)
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            searchBar.trailingAnchor.constraint(equalTo: filterButton.leadingAnchor, constant: -8),
            searchBar.heightAnchor.constraint(equalToConstant: 44),
            
            filterButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            filterButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            filterButton.heightAnchor.constraint(equalToConstant: 44),
            filterButton.widthAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func setupTableView() {
        tableView.register(MovieCell.self, forCellReuseIdentifier: MovieCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 160
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 8),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func fetchMovies() {
        Task {
            do {
                try await viewModel.fetchMovies()
                tableView.reloadData()
            } catch {
                print("Error fetching movies: \(error)")
            }
        }
    }
    
    @objc private func showFilters() {
        let alert = UIAlertController(title: "Filters", message: nil, preferredStyle: .actionSheet)
        
        alert.view.tintColor = .black
        
        alert.addAction(UIAlertAction(title: "All", style: .default, handler: { _ in
            self.viewModel.resetFilters()
            self.tableView.reloadData()
        }))
        
        alert.addAction(UIAlertAction(title: "Top Rated", style: .default, handler: { _ in
            self.viewModel.filterMoviesByRating()
            self.tableView.reloadData()
        }))
        
        alert.addAction(UIAlertAction(title: "Recent", style: .default, handler: { _ in
            self.viewModel.filterMoviesByRecent()
            self.tableView.reloadData()
        }))
        
        alert.addAction(UIAlertAction(title: "Action", style: .default, handler: { _ in
            self.viewModel.filterMoviesByGenre(28)
            self.tableView.reloadData()
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfMovies()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.identifier, for: indexPath) as! MovieCell
        let movie = viewModel.movie(at: indexPath.row)
        cell.configure(with: movie)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.movie = viewModel.movie(at: indexPath.row)
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        Task {
            if searchText.isEmpty {
                viewModel.resetFilters()
            } else {
                try await viewModel.searchMovies(query: searchText)
            }
            tableView.reloadData()
        }
    }
}
