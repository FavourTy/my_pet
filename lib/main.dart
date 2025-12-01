import 'package:flutter/material.dart';
import 'package:my_pet/screens/Thread/thread_screen.dart';
import 'package:my_pet/screens/bulletin_board/bulletin_board.dart';
import 'package:my_pet/screens/bulletin_board/bulletin_screen.dart';
import 'package:my_pet/screens/game_mode.dart';
import 'package:my_pet/screens/onboarding/start.dart';
import 'package:my_pet/screens/onboarding/steps_graph.dart';
import 'package:my_pet/screens/profile/profile.dart';
import 'package:my_pet/screens/profile/social_screen.dart';
import 'package:my_pet/screens/settings/settings_screen.dart';
import 'package:my_pet/screens/wishlist/wish_list_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'providers/app_state_provider.dart';
import 'screens/gacha_screen.dart';
import 'screens/plaza_screen.dart';
import 'screens/shop_screen.dart';
import 'screens/event_plaza_screen.dart';
import 'screens/bazaar_screen.dart';

import 'screens/pet_detail_screen.dart';
import 'screens/subscription_screen.dart';
import 'screens/ai_pet_creation_screen.dart';
import 'screens/ai_education_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appState = AppStateProvider();
  await appState.initialize();

  runApp(ChangeNotifierProvider.value(value: appState, child: PetGameApp()));
}

class PetGameApp extends StatelessWidget {
  PetGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => StartScreen(),
        '/gacha': (context) => GachaScreen(),
        '/plaza': (context) => PlazaScreen(),
        '/event-plaza': (context) => EventPlazaScreen(),
        '/shop': (context) => ShopScreen(),
        '/bazaar': (context) => BazaarScreen(),
        '/profile': (context) => ProfileScreen(),
        '/rooms': (context) => GameRoomScreen(),
        '/subscription': (context) => SubscriptionScreen(),
        '/ai-pet-creation': (context) => AiPetCreationScreen(),
        '/ai-education': (context) => AiEducationScreen(),
        '/wishlist': (context) => WishlistScreen(),
        '/thread': (context) => ThreadScreen(),
        '/social-feed': (context) => SocialFeedScreen(),
        '/board': (context) => BulletinScreen(),
        '/points': (context) => StepsGraphScreen(),
        '/settings': (context) => SettingsScreen(),
      },
      onGenerateRoute: (settings) {
        // If we push '/pet_detail' and pass arguments
        if (settings.name == '/pet_detail') {
          final args = settings.arguments as String; // Getting the ID
          return MaterialPageRoute(
            builder: (context) => PetDetailScreen(petId: args),
          );
        }
        return null; // Let the app handle unknown routes (or 404)
      },
      initialRoute: '/',
      title: 'Pet Game',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''), // English
        Locale('ja', ''), // Japanese
      ],
      theme: ThemeData(
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Noto Sans',
        textTheme: TextTheme(
          displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontSize: 16),
          bodyMedium: TextStyle(fontSize: 14),
        ),
      ),

      // routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}
