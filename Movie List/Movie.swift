import Foundation

struct TrendingMoviesResponse: Codable {
    let results: [Movie]
}

struct Movie: Codable {
    let id: Int
    let title: String
    let overview: String
    let rating: Double?
    let posterPath: String?
    let releaseDate: String?
    let genreIds: [Int]

    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case rating = "vote_average"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case genreIds = "genre_ids"
    }
}
