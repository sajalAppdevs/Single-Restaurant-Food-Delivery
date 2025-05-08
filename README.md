# Single Restaurant Food Delivery App UI Template for Flutter

<p align="center">
  <img src='https://res.cloudinary.com/dqwntkvge/image/upload/v1675029962/ss_food_single_flutter.png'/>
</p>

## Overview

This is a comprehensive Flutter UI template designed specifically for single restaurant food delivery applications. The template provides a complete set of pre-built UI components and screens that can be easily customized to create a stunning food delivery app.

## Features

- **Modern UI Design**: Clean and intuitive user interface following Material Design principles
- **Responsive Layout**: Adapts seamlessly to different screen sizes and orientations
- **State Management**: Implements BLoC pattern using flutter_bloc for efficient state management
- **Mock Data Integration**: Includes mock data source and services for immediate testing
- **Dark Mode Support**: Native splash screen with dark mode compatibility
- **Localization Ready**: Built-in support for multiple languages

### Key Components

- Home page with food menu showcase
- Detailed food item pages with customization options
- Shopping basket functionality
- User account management
- Favorites system
- Category-based navigation
- Rating system integration

## Technical Specifications

### Dependencies

- Flutter SDK: >=2.18.6 <3.0.0
- flutter_bloc: ^8.1.1 (State Management)
- get_it: ^7.2.0 (Dependency Injection)
- flutter_rating_bar: ^4.0.1 (Rating System)
- flutter_native_splash: ^2.2.16 (Splash Screen)
- intl: ^0.17.0 (Internationalization)

## Getting Started

### Prerequisites

- Flutter SDK installed on your development machine
- Basic understanding of Flutter development

### Installation

1. Clone the repository
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run the app:
   ```bash
   flutter run
   ```

## Project Structure

- `lib/`
  - `cubit/` - State management logic
  - `page/` - Main screen implementations
  - `widget/` - Reusable UI components
  - `model/` - Data models
  - `localization/` - Language support files

## Customization

### Splash Screen

The app includes a customizable splash screen with both light and dark mode support. Configure in `flutter_native_splash` section of `pubspec.yaml`:

- Light mode background: #9c27b0
- Dark mode background: #ab47bc
- Custom splash image support

## License

This template is available for purchase on Envato Market. For licensing details and to purchase, visit:
[Food Delivery App Single Restaurant UI Template](https://codecanyon.net/item/food-delivery-app-single-restaurant-ui-template-for-flutter/43301940)

## Support

For support and queries, please refer to the documentation provided with the purchase or contact through the Envato platform.
