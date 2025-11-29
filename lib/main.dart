import 'package:flutter/material.dart';
import 'package:my_pet/screens/game_mode.dart';
import 'package:my_pet/screens/onboarding/start.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'providers/app_state_provider.dart';
import 'screens/home_screen.dart';
import 'screens/gacha_screen.dart';
import 'screens/plaza_screen.dart';
import 'screens/shop_screen.dart';
import 'screens/event_plaza_screen.dart';
import 'screens/bazaar_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/rooms_screen.dart';
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
  PetGameApp({Key? key}) : super(key: key);

  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => HomeScreen()),
      GoRoute(path: '/gacha', builder: (context, state) => GachaScreen()),
      GoRoute(path: '/plaza', builder: (context, state) => PlazaScreen()),
      GoRoute(
        path: '/event-plaza',
        builder: (context, state) => EventPlazaScreen(),
      ),
      GoRoute(path: '/shop', builder: (context, state) => ShopScreen()),
      GoRoute(path: '/bazaar', builder: (context, state) => BazaarScreen()),
      GoRoute(path: '/profile', builder: (context, state) => ProfileScreen()),
      GoRoute(path: '/rooms', builder: (context, state) => GameRoomScreen()),
      GoRoute(
        path: '/pet/:id',
        builder: (context, state) {
          final petId = state.pathParameters['id']!;
          return PetDetailScreen(petId: petId);
        },
      ),
      GoRoute(
        path: '/subscription',
        builder: (context, state) => SubscriptionScreen(),
      ),
      GoRoute(
        path: '/ai-pet-creation',
        builder: (context, state) => AiPetCreationScreen(),
      ),
      GoRoute(
        path: '/ai-education',
        builder: (context, state) => AiEducationScreen(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StartScreen(),
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
