# E-Style: Smart Wardrobe & Fashion Assistant

E-Style is a modern Flutter app that helps you manage your wardrobe, rent outfits, get AI-powered style advice, and contribute to charity—all in one place. Built with Firebase authentication and a beautiful, brand-consistent UI, E-Style is your all-in-one digital closet and fashion companion.

## Features

- **Firebase Authentication**: Secure login and signup with email/password.
- **Modern, Responsive UI**: Clean, brand-themed design with light/dark mode toggle.
- **Home Dashboard**: 2x2 grid of feature cards for quick access to all main functions.
- **Wardrobe Management**: Add, view, and manage your clothing items.
- **Outfit Rental**: Browse and rent outfits from the community.
- **AI Stylist**: Get personalized outfit recommendations (AI integration ready).
- **Charity Donations**: Donate clothes to charity directly from the app.
- **Smooth Navigation**: Fast, animated transitions between screens.
- **Cross-Platform**: Works on Android, iOS, Web, Windows, Mac, and Linux.

## Screenshots

![Home Screen](assets/estyle_icon.png)

## Getting Started

1. **Clone the repository:**
   ```sh
   git clone https://github.com/ajsike2310/e-style.git
   cd e-style/estyle
   ```
2. **Install dependencies:**
   ```sh
   flutter pub get
   ```
3. **Set up Firebase:**
   - Add your Firebase config to `lib/config/firebase_config.dart` (already scaffolded for you).
   - Make sure your Firebase project allows email/password authentication.
4. **Run the app:**
   ```sh
   flutter run
   ```

## Project Structure

- `lib/screens/` — All main app screens (login, signup, home, wardrobe, rental, etc.)
- `lib/services/` — Firebase authentication logic
- `lib/config/` — Firebase configuration
- `lib/widgets/` — Reusable UI components
- `assets/` — App images and icons

## Theming & Branding

- **Brand Colors:** Green (`#14532d`), Black, White
- **Light/Dark Mode:** Toggle available on all main screens
- **Consistent UI:** All screens follow the same modern, minimal, and accessible design

## Contributing

Pull requests are welcome! For major changes, please open an issue first to discuss what you would like to change.

## License

[MIT](LICENSE)

---

> E-Style: Your smart wardrobe and fashion assistant. Built with Flutter & Firebase.
