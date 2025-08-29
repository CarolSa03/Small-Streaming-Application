# Small-Streaming-Application

This project was developed during my first week as a Technology Summer Intern at Sky to get used to **Swift** and **UIKit**. The challenge was to build a minimal streaming application using modern iOS architecture, keeping the code modular and maintainable.

## Features

- **Tabbed navigation** using a custom floating tab bar (`Home`, `Search`, `Movies`, `TV Shows`)
- **Home screen** with sections for Featured, Movies, and Shows, each using compositional collection views for a modern layout
- **Reusable collection view cells** for regular, featured, and episode layouts
- **Coordinator pattern** for navigation and view controller, and clean separation of concerns
- **MVVM pattern**: Each screen has its own ViewModel for business logic
- **Mock repository/data** for demonstration purposes (no API calls needed)
- **Well-structured Swift models** for Movies, Shows, Seasons, and Episodes
- **UICollectionView with compositional layouts** for flexible, modern sections

## Extending the Project
- Replace data repository with actual network calls.
- Add user authentication and playback features.
- Implement detail screens for movies or shows.

## Acknowledgements

- Thanks to **Sky** for the learning opportunity and project challenge.
- Apple Developer Documentation, UIKit.

*Created by Carolina Sá, Technology Summer Intern*



