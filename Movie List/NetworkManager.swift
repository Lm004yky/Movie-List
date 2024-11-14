import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private let apiKey = "9b3cbe86bb58eb38eff5523154d4ffc1"
    private let baseURL = "https://api.themoviedb.org/3"

    func fetchTrendingMovies() async throws -> [Movie] {
        let urlString = "\(baseURL)/trending/movie/day?api_key=\(apiKey)"
        guard let url = URL(string: urlString) else { throw URLError(.badURL) }
        let (data, _) = try await URLSession.shared.data(from: url)
        let trendingMoviesResponse = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
        return trendingMoviesResponse.results
    }

    func searchMovies(query: String) async throws -> [Movie] {
        let urlString = "\(baseURL)/search/movie?api_key=\(apiKey)&query=\(query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")"
        guard let url = URL(string: urlString) else { throw URLError(.badURL) }
        let (data, _) = try await URLSession.shared.data(from: url)
        let searchResponse = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
        return searchResponse.results
    }
}
