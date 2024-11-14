import UIKit
import SDWebImage

class DetailViewController: UIViewController {
    var movie: Movie?

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let starsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let overviewLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Share", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let favoriteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add to Favorites", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let trailerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Watch Trailer", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        overrideUserInterfaceStyle = .light
        setupUI()
        configure()
    }

    private func setupUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        contentView.addSubview(posterImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(ratingLabel)
        contentView.addSubview(starsStackView)
        contentView.addSubview(overviewLabel)
        contentView.addSubview(shareButton)
        contentView.addSubview(favoriteButton)
        contentView.addSubview(trailerButton)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            posterImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            posterImageView.widthAnchor.constraint(equalToConstant: 200),
            posterImageView.heightAnchor.constraint(equalToConstant: 300),

            titleLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            ratingLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            ratingLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            ratingLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            starsStackView.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 8),
            starsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),

            overviewLabel.topAnchor.constraint(equalTo: starsStackView.bottomAnchor, constant: 16),
            overviewLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            overviewLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            shareButton.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: 16),
            shareButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            shareButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            shareButton.heightAnchor.constraint(equalToConstant: 50),

            favoriteButton.topAnchor.constraint(equalTo: shareButton.bottomAnchor, constant: 16),
            favoriteButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            favoriteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            favoriteButton.heightAnchor.constraint(equalToConstant: 50),

            trailerButton.topAnchor.constraint(equalTo: favoriteButton.bottomAnchor, constant: 16),
            trailerButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            trailerButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            trailerButton.heightAnchor.constraint(equalToConstant: 50),
            trailerButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])

        shareButton.addTarget(self, action: #selector(shareMovie), for: .touchUpInside)
        favoriteButton.addTarget(self, action: #selector(toggleFavorite), for: .touchUpInside)
        trailerButton.addTarget(self, action: #selector(openTrailer), for: .touchUpInside)
    }

    private func configure() {
        titleLabel.text = movie?.title
        overviewLabel.text = movie?.overview
        ratingLabel.text = "Rating: \(String(format: "%.2f", movie?.rating ?? 0))/10"

        if let posterPath = movie?.posterPath {
            let posterURL = "https://image.tmdb.org/t/p/w500\(posterPath)"
            posterImageView.sd_setImage(with: URL(string: posterURL), placeholderImage: UIImage(named: "placeholder"))
        }

        if let rating = movie?.rating {
            let stars = Int((rating / 10.0) * 5)
            for _ in 0..<stars {
                let starImageView = UIImageView(image: UIImage(systemName: "star.fill"))
                starImageView.tintColor = .systemYellow
                starsStackView.addArrangedSubview(starImageView)
            }
        }

        if let movie = movie {
            favoriteButton.setTitle(
                FavoriteManager.shared.isFavorite(movie: movie) ? "Remove from Favorites" : "Add to Favorites",
                for: .normal
            )
        }
    }

    @objc private func shareMovie() {
        guard let movieTitle = movie?.title else { return }
        let shareText = "Check out this movie: \(movieTitle)"
        let activityVC = UIActivityViewController(activityItems: [shareText], applicationActivities: nil)
        present(activityVC, animated: true, completion: nil)
    }

    @objc private func toggleFavorite() {
        guard let movie = movie else { return }
        if FavoriteManager.shared.isFavorite(movie: movie) {
            FavoriteManager.shared.removeFromFavorites(movie: movie)
            favoriteButton.setTitle("Add to Favorites", for: .normal)
        } else {
            FavoriteManager.shared.saveToFavorites(movie: movie)
            favoriteButton.setTitle("Remove from Favorites", for: .normal)
        }
    }

    @objc private func openTrailer() {
        guard let movie = movie else { return }
        let trailerURL = "https://www.youtube.com/results?search_query=\(movie.title.replacingOccurrences(of: " ", with: "+"))+trailer"
        if let url = URL(string: trailerURL) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
