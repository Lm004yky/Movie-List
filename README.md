# Movie App

A simple and elegant iOS application for browsing trending movies, searching for specific titles, and managing a favorites list. The app is designed with UIKit and supports both light and dark modes with a consistent white background.

---

## Features

- **Trending Movies**: Browse the most popular movies fetched from the [TMDb API](https://www.themoviedb.org/documentation/api).
- **Search Functionality**: Quickly find movies by title using the integrated search bar.
- **Favorites Management**: Save and manage your favorite movies in a dedicated tab.
- **Detailed Movie View**: View detailed information about movies, including:
  - Poster
  - Title
  - Rating
  - Overview
  - Watch trailer link
- **Modern Design**: Intuitive and user-friendly interface with consistent white backgrounds for both light and dark modes.

---

## Requirements

- iOS 15.0+
- Xcode 14+
- Swift 5.6+

---

## Setup Instructions

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-username/movie-app.git
   cd movie-app
   ```

2. **Open in Xcode**:
   ```bash
   open MovieApp.xcodeproj
   ```

3. **Add Your API Key**:
   - Open the file `NetworkManager.swift`.
   - Replace `YOUR_API_KEY` with your personal API key from [TMDb API](https://www.themoviedb.org/documentation/api).

4. **Run the App**:
   - Press `Cmd + R` in Xcode or click the Run button.

---

## Dependencies

The app uses the following library for image caching:
- **[SDWebImage](https://github.com/SDWebImage/SDWebImage)**: Efficient loading and caching of movie posters.

To install dependencies, ensure you have `CocoaPods` installed. Run:
```bash
pod install
```

Open the generated `.xcworkspace` file instead of the `.xcodeproj`.

---

## Project Structure

- **`AppDelegate.swift`**: Configures the app’s lifecycle and sets up the tab bar.
- **`MovieListViewController.swift`**: Displays the list of trending movies and allows users to search.
- **`FavoritesViewController.swift`**: Displays movies that the user has added to their favorites.
- **`DetailViewController.swift`**: Provides detailed information about a selected movie.
- **`NetworkManager.swift`**: Handles API calls to fetch data from TMDb.
- **`FavoriteManager.swift`**: Manages saving and retrieving favorite movies using `UserDefaults`.

---

## API Integration

The app uses the [TMDb API](https://www.themoviedb.org/documentation/api) for fetching movie data.

**Endpoints Used**:
1. **Trending Movies**: Fetches the most popular movies.
   ```
   GET https://api.themoviedb.org/3/trending/movie/day
   ```
2. **Search Movies**: Searches for movies by title.
   ```
   GET https://api.themoviedb.org/3/search/movie
   ```

---

## Customization

### UI Design
- The app enforces a consistent **white background** for all screens across both light and dark modes.
- You can customize colors or other UI elements by editing the respective `UIViewController` files and `AppDelegate`.

---

## License

This project is licensed under the [MIT License](LICENSE).

---

## Contributing

Contributions are welcome! Feel free to submit a pull request or report an issue in the repository.

---Screenshots
<img width="344" alt="Снимок экрана 2024-11-14 в 16 36 06" src="https://github.com/user-attachments/assets/4757d539-77e3-4d00-b142-8a5ebb28aadb">
<img width="341" alt="Снимок экрана 2024-11-14 в 16 35 36" src="https://github.com/user-attachments/assets/4bda20a5-0c22-418d-b8fe-bacbeac31449">
<img width="339" alt="Снимок экрана 2024-11-14 в 16 35 18" src="https://github.com/user-attachments/assets/9feee3c3-bdec-4930-810b-5ce5b28719fc">
<img width="341" alt="Снимок экрана 2024-11-14 в 16 35 05 1" src="https://github.com/user-attachments/assets/bf369d9e-c8ec-40b2-a36c-1c5fe27d65b5">
<img width="341" alt="Снимок экрана 2024-11-14 в 16 35 05" src="https://github.com/user-attachments/assets/a09cc7c8-2ffc-4f86-8cd6-14a70e629bf6">
<img width="334" alt="Снимок экрана 2024-11-14 в 16 34 48" src="https://github.com/user-attachments/assets/ec113ecc-90e6-4bba-8d9f-73e5567ebdfa">
<img width="333" alt="Снимок экрана 2024-11-14 в 16 34 33" src="https://github.com/user-attachments/assets/ab593ca9-5e1b-432f-b41d-b60f62b3ab17">
<img width="332" alt="Снимок экрана 2024-11-14 в 16 34 12" src="https://github.com/user-attachments/assets/1dd5a040-db74-4010-b93f-7a512f90e0af">


## Contact

For any questions or suggestions, reach out to:
- **Email**: your-email@example.com
- **GitHub**: [your-username](https://github.com/your-username)
```

### Инструкции:
1. Замените `path/to/movies-screen.png`, `path/to/movie-details-screen.png`, и `path/to/favorites-screen.png` на реальные пути к скриншотам вашего приложения.
2. Укажите ваш `GitHub` репозиторий и контактные данные.
3. Обновите лицензию и ссылку на ваш профиль GitHub, если нужно.
