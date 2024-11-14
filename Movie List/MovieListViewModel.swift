import Foundation

class MovieListViewModel {
    private var movies: [Movie] = []
    var filteredMovies: [Movie] = []
    var isSearching: Bool = false

    func fetchMovies() async throws {
        movies = try await NetworkManager.shared.fetchTrendingMovies()
        filteredMovies = movies
    }

    func searchMovies(query: String) async throws {
        filteredMovies = try await NetworkManager.shared.searchMovies(query: query)
        isSearching = true
    }

    func filterMoviesByRating() {
        filteredMovies = movies.sorted { ($0.rating ?? 0) > ($1.rating ?? 0) }
        isSearching = true
    }

    func filterMoviesByRecent() {
        filteredMovies = movies.sorted { ($0.releaseDate ?? "") > ($1.releaseDate ?? "") }
        isSearching = true
    }

    func filterMoviesByGenre(_ genreId: Int) {
        filteredMovies = movies.filter { $0.genreIds.contains(genreId) }
        isSearching = true
    }

    func filterMoviesByYear(_ year: String) {
        filteredMovies = movies.filter { $0.releaseDate?.contains(year) ?? false }
        isSearching = true
    }

    func resetFilters() {
        filteredMovies = movies
        isSearching = false
    }

    func movie(at index: Int) -> Movie {
        return isSearching ? filteredMovies[index] : movies[index]
    }

    func numberOfMovies() -> Int {
        return isSearching ? filteredMovies.count : movies.count
    }
}
