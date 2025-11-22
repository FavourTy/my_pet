# Quick Start Guide - My Pet App

## Overview
This Flutter app implements a virtual pet game with AI features, localization (English/Japanese), time-based mechanics, and room customization.

## Getting Started

### Prerequisites
- Flutter SDK 3.9.2 or higher
- Dart SDK
- Google Gemini API key (for AI features - optional for basic gameplay)

### Installation

1. **Clone and Install Dependencies**
   ```bash
   cd /path/to/my_pet
   flutter pub get
   ```

2. **Generate Localization Files**
   ```bash
   flutter gen-l10n
   ```
   This generates the localization code from `lib/l10n/app_en.arb` and `lib/l10n/app_ja.arb`.

3. **Run the App**
   ```bash
   flutter run
   ```

## Key Features

### 1. Localization (English/Japanese)
- **Files**: `lib/l10n/app_en.arb`, `lib/l10n/app_ja.arb`
- **Auto-detection**: App uses device language setting
- **Testing**: Change device language to see translations

### 2. Time-Based Mechanics
✅ **Already Running Automatically**

The app automatically:
- Updates every minute for time-based changes
- Decreases plant water levels (2% per hour)
- Changes sky gradient based on time of day
- Updates pet moods based on feeding/playing schedule

**Key Timing:**
- Plants wither: 24 hours without water
- Pets get hungry: 4+ hours without food
- Sky darkens: 6 PM - 8 PM (gradual)
- Full night: 8 PM - 4 AM

### 3. Room & Pet Engine

**Navigation**: Side menu → "Rooms" button

**Features**:
- Create multiple rooms (limited by quota)
- Add furniture (drag to reposition)
- Add plants (tap to water)
- Real-time water level indicators
- Time-based sky gradient

**How to Use**:
1. Tap "Rooms" in side navigation
2. Create a new room (+ button)
3. Enter room to customize
4. Add furniture or plants with + button
5. Drag furniture to reposition
6. Tap plants to water them

### 4. AI Pet Creation (Paid Members Only)

**Navigation**: Side menu → "AI Pet" button

**Get Your API Key** (First Time):
1. Visit [Google AI Studio](https://ai.google.dev)
2. Sign in with Google account
3. Click "Get API Key"
4. Create new project or use existing
5. Copy the API key

**Create AI Pet**:
1. Tap "AI Pet" in side navigation
2. Fill in pet details:
   - Pet name (required)
   - Pet type (dog/cat/other)
   - Appearance (optional)
   - Personality (optional)
3. Tap "Generate with AI"
4. On first use, enter your API key when prompted
5. AI generates:
   - Unique pet description
   - Image generation prompt for DALL-E/Midjourney

**Note**: Feature restricted to paid members. Free users see upgrade prompt.

### 5. Educational AI

**Navigation**: Side menu → "Learn" button

**Get Your API Key**: Same as AI Pet Creation (shared service)

**Three Tabs**:

1. **Ask Advice**
   - Enter questions about pet care
   - Get expert trainer advice
   - Personalized to your pet's current state

2. **Training Videos**
   - Get 5 personalized recommendations
   - Based on pet's age, type, and mood
   - Click videos to view (coming soon)

3. **Behavior Analysis**
   - One-click analysis
   - Insights on pet's wellbeing
   - Suggestions for improvement

**How to Use**:
1. Tap "Learn" in side navigation
2. Choose a tab
3. For Advice: Type question → "Get Advice"
4. For Videos: "Get Recommendations"
5. For Analysis: "Analyze Behavior"

## Navigation Map

```
Home Screen (Pet Display)
├── Side Menu (Right)
│   ├── Event → Event Plaza
│   ├── AI Pet → AI Pet Creation ⭐
│   ├── Learn → Educational AI ⭐
│   ├── Feed → (Coming soon)
│   ├── Rooms → Room Management ⭐
│   ├── Status → (Coming soon)
│   └── News → (Coming soon)
└── Bottom Nav
    ├── Shop
    ├── Items
    ├── Pet (Current)
    ├── Going Out
    ├── Board
    └── Settings
```

⭐ = New features implemented

## Testing Checklist

### Localization
- [ ] Change device to Japanese → UI updates
- [ ] Change device to English → UI updates
- [ ] All screens show proper translations

### Time-Based Features
- [ ] Check plant water levels decrease
- [ ] Wait for hour change → plant water updates
- [ ] Check sky gradient at different times:
  - Morning (6 AM - 12 PM): Light
  - Afternoon (12 PM - 6 PM): Light
  - Evening (6 PM - 8 PM): Gradual darkening
  - Night (8 PM - 4 AM): Dark

### AI Features
- [ ] Navigate to AI Pet Creation
- [ ] Enter API key when prompted
- [ ] Generate pet description
- [ ] Verify image prompt generated
- [ ] Check paid member restriction for free users
- [ ] Navigate to Educational AI
- [ ] Ask question → get advice
- [ ] Get training videos
- [ ] Analyze pet behavior

### Room Management
- [ ] Create new room
- [ ] Navigate to room detail
- [ ] Add furniture → drag to reposition
- [ ] Add plant
- [ ] Tap plant to water
- [ ] Verify water level updates
- [ ] Check sky gradient in room

## Troubleshooting

### "AI Service not initialized"
- You need to enter a Gemini API key
- Get free key at https://ai.google.dev
- Enter when prompted in AI screens

### "Paid Members Only" for AI Pet Creation
- This is expected behavior for free users
- Click "Upgrade" to see subscription screen
- (Actual subscription not yet implemented)

### Localization not working
- Run `flutter gen-l10n` to generate localization code
- Restart the app
- Check device language settings

### Plants not withering
- Time-based updates run every minute
- Plant water decreases 2% per hour
- Takes 50 hours to fully wither (24h is threshold for "withered" state)
- Speed up testing by manually adjusting `lastWateredAt` in code

## API Key Security Note

⚠️ **Important**: In this demo, API keys are stored in memory only (session-based).

For production:
- Store API key securely using `flutter_secure_storage`
- Consider backend proxy to hide API keys from client
- Implement proper authentication
- Use environment variables for development

## Architecture Notes

**State Management**: Provider pattern
- `AppStateProvider`: Main app state
- All screens use `Consumer<AppStateProvider>`

**Navigation**: GoRouter
- Declarative routing
- Deep linking ready
- Type-safe navigation

**Services**:
- `TimeService`: Manages time-based updates
- `AiService`: Handles all AI operations

**Models**:
- `Pet`: Pet data with mood, HP, age
- `Room`: Room with furniture and plants
- `User`: User with membership tier

## Next Steps

### Recommended Enhancements
1. Add actual DALL-E integration for image generation
2. Implement video library for training videos
3. Add subscription/payment flow
4. Create more furniture types
5. Add social features (friends, DM)
6. Implement pet clothing system
7. Add more pet types
8. Create mini-games for interaction

### Known Limitations
- Flutter SDK not available in current environment (can't test build)
- AI features require internet connection
- No persistent storage (data resets on app restart)
- Training videos are placeholder (no actual content)

## Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Google Gemini AI](https://ai.google.dev/)
- [Provider Package](https://pub.dev/packages/provider)
- [GoRouter Package](https://pub.dev/packages/go_router)

## Support

For issues or questions:
1. Check IMPLEMENTATION.md for technical details
2. Review code comments in relevant files
3. Consult Flutter documentation

---

**Version**: 1.0.0
**Last Updated**: 2025-11-22
