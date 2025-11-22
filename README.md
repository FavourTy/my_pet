# My Pet - Virtual Pet Game 🐾

A Flutter-based virtual pet game with AI-powered features, bilingual support (English/Japanese), and time-based gameplay mechanics.

## 🌟 Features

### Phase 1: Localization ✅
- **English/Japanese Support**: Fully localized UI with automatic language detection
- **Flexible Architecture**: Easy to add more languages using ARB files

### Phase 2: Core Mechanics ✅
- **Room & Pet Engine**: 
  - Interactive rooms with draggable furniture
  - Multiple room support with quota system
  - Pet display with HP, mood, and age tracking
  
- **Time-Based Gameplay**:
  - Plants wither after 24 hours without water
  - Pets get hungry after 4+ hours
  - Dynamic day/night sky gradient
  - Automatic time-based updates

### Phase 3: AI Features ✅
- **AI Pet Creation** (Paid Members):
  - Generate unique pet descriptions with Google Gemini AI
  - Create image prompts for DALL-E/Midjourney
  - Customizable appearance and personality
  
- **Educational AI**:
  - Expert pet care advice
  - Personalized training video recommendations
  - Behavior analysis and insights

## 📚 Documentation

- **[QUICK_START.md](QUICK_START.md)** - Get up and running quickly with setup instructions and feature guides
- **[IMPLEMENTATION.md](IMPLEMENTATION.md)** - Detailed technical documentation and architecture overview

## 🚀 Quick Start

### Prerequisites
- Flutter SDK 3.9.2+
- Dart SDK
- Google Gemini API key (optional, for AI features)

### Installation

```bash
# Install dependencies
flutter pub get

# Generate localization files
flutter gen-l10n

# Run the app
flutter run
```

### Getting a Gemini API Key (for AI features)
1. Visit [Google AI Studio](https://ai.google.dev)
2. Sign in and create/select a project
3. Get your API key
4. Enter it in-app when prompted

## 🎮 How to Play

1. **Home Screen**: View your pet, check HP, and access features via side menu
2. **Rooms**: Create and customize rooms, add furniture, water plants
3. **AI Pet Creation**: Generate unique AI pets (paid members)
4. **Educational AI**: Get expert advice, training videos, and behavior insights

## 🏗️ Project Structure

```
lib/
├── l10n/              # Localization (English/Japanese)
├── models/            # Data models (Pet, Room, User, etc.)
├── services/          # Business logic (AI, Time)
├── screens/           # UI screens
├── providers/         # State management
└── widgets/           # Reusable UI components
```

## 🛠️ Tech Stack

- **Framework**: Flutter 3.9.2
- **State Management**: Provider
- **Navigation**: GoRouter
- **AI**: Google Generative AI (Gemini)
- **Localization**: flutter_localizations
- **Animations**: flutter_animate

## 📱 Features in Detail

### Localization
- Automatic language detection based on device settings
- Support for English and Japanese
- Easily extensible to more languages

### Time-Based Mechanics
- Real-time updates every minute
- Plant care system with water levels
- Pet mood system based on care
- Dynamic day/night cycle

### AI Integration
- Google Gemini AI for pet generation
- Educational advice with expert persona
- Training recommendations
- Behavior analysis

### Room System
- Create multiple rooms (quota-based)
- Drag-and-drop furniture placement
- Plant management with visual feedback
- Time-synchronized sky gradient

## 🔮 Future Enhancements

- DALL-E integration for actual image generation
- Training video library with content
- Social features (friends, messaging)
- Subscription/payment integration
- More pet types and customization
- Mini-games and interactions
- Pet clothing system
- Community plaza features

## 📄 License

This is a demo project for educational purposes.

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Google for Gemini AI API
- Design inspiration from Figma: [View Design](https://www.figma.com/design/IIMeB0bTUTL69r3swKKYJ4/Untitled?node-id=1-2)

---

**For detailed setup and usage instructions, see [QUICK_START.md](QUICK_START.md)**

**For technical implementation details, see [IMPLEMENTATION.md](IMPLEMENTATION.md)**
