import Foundation

class FavoriteManager {
    static let shared = FavoriteManager()

    private let favoritesKey = "favoriteMovies"

    func saveToFavorites(movie: Movie) {
        var favorites = getFavorites()
        if !favorites.contains(where: { $0.id == movie.id }) {
            favorites.append(movie)
            save(favorites: favorites)
        }
    }

    func removeFromFavorites(movie: Movie) {
        var favorites = getFavorites()
        favorites.removeAll(where: { $0.id == movie.id })
        save(favorites: favorites)
    }

    func isFavorite(movie: Movie) -> Bool {
        return getFavorites().contains(where: { $0.id == movie.id })
    }

    private func save(favorites: [Movie]) {
        if let data = try? JSONEncoder().encode(favorites) {
            UserDefaults.standard.set(data, forKey: favoritesKey)
        }
    }

    func getFavorites() -> [Movie] {
        if let data = UserDefaults.standard.data(forKey: favoritesKey),
           let movies = try? JSONDecoder().decode([Movie].self, from: data) {
            return movies
        }
        return []
    }
}
