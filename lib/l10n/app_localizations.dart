import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ja.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ja'),
  ];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'Pet Game'**
  String get appTitle;

  /// Home screen label
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// Gacha screen label
  ///
  /// In en, this message translates to:
  /// **'Gacha'**
  String get gacha;

  /// Plaza screen label
  ///
  /// In en, this message translates to:
  /// **'Plaza'**
  String get plaza;

  /// Event plaza screen label
  ///
  /// In en, this message translates to:
  /// **'Event Plaza'**
  String get eventPlaza;

  /// Shop screen label
  ///
  /// In en, this message translates to:
  /// **'Shop'**
  String get shop;

  /// Bazaar screen label
  ///
  /// In en, this message translates to:
  /// **'Bazaar'**
  String get bazaar;

  /// Profile screen label
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// Rooms screen label
  ///
  /// In en, this message translates to:
  /// **'Rooms'**
  String get rooms;

  /// Subscription screen label
  ///
  /// In en, this message translates to:
  /// **'Subscription'**
  String get subscription;

  /// Display pet age
  ///
  /// In en, this message translates to:
  /// **'{years} years old'**
  String yearsOld(int years);

  /// Points label
  ///
  /// In en, this message translates to:
  /// **'Points'**
  String get points;

  /// Coins label
  ///
  /// In en, this message translates to:
  /// **'Coins'**
  String get coins;

  /// Feed action
  ///
  /// In en, this message translates to:
  /// **'Feed'**
  String get feed;

  /// Play action
  ///
  /// In en, this message translates to:
  /// **'Play'**
  String get play;

  /// Water plants action
  ///
  /// In en, this message translates to:
  /// **'Water'**
  String get water;

  /// Create new pet button
  ///
  /// In en, this message translates to:
  /// **'Create Pet'**
  String get createPet;

  /// AI pet creation feature title
  ///
  /// In en, this message translates to:
  /// **'AI Pet Creation'**
  String get aiPetCreation;

  /// AI pet creation feature description
  ///
  /// In en, this message translates to:
  /// **'Create a unique pet using AI (Paid members only)'**
  String get aiPetCreationDescription;

  /// Pet name input label
  ///
  /// In en, this message translates to:
  /// **'Pet Name'**
  String get petName;

  /// Pet type selection label
  ///
  /// In en, this message translates to:
  /// **'Pet Type'**
  String get petType;

  /// Dog pet type
  ///
  /// In en, this message translates to:
  /// **'Dog'**
  String get dog;

  /// Cat pet type
  ///
  /// In en, this message translates to:
  /// **'Cat'**
  String get cat;

  /// Other pet type
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// Pet appearance customization
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// Pet personality traits
  ///
  /// In en, this message translates to:
  /// **'Personality'**
  String get personality;

  /// Button to generate pet with AI
  ///
  /// In en, this message translates to:
  /// **'Generate with AI'**
  String get generateWithAI;

  /// Educational advice feature title
  ///
  /// In en, this message translates to:
  /// **'Educational Advice'**
  String get educationalAdvice;

  /// Ask question input label
  ///
  /// In en, this message translates to:
  /// **'Ask a Question'**
  String get askQuestion;

  /// Get advice button
  ///
  /// In en, this message translates to:
  /// **'Get Advice'**
  String get getAdvice;

  /// Training videos section title
  ///
  /// In en, this message translates to:
  /// **'Training Videos'**
  String get trainingVideos;

  /// Free membership tier
  ///
  /// In en, this message translates to:
  /// **'Free Member'**
  String get freeMember;

  /// Paid membership tier
  ///
  /// In en, this message translates to:
  /// **'Paid Member'**
  String get paidMember;

  /// Premium membership tier
  ///
  /// In en, this message translates to:
  /// **'Premium Member'**
  String get premiumMember;

  /// Upgrade to premium button
  ///
  /// In en, this message translates to:
  /// **'Upgrade to Premium'**
  String get upgradeToPremium;

  /// Paid members only label
  ///
  /// In en, this message translates to:
  /// **'Paid Members Only'**
  String get paidMemberOnly;

  /// Room quota display
  ///
  /// In en, this message translates to:
  /// **'Room Quota: {current}/{max}'**
  String roomQuota(int current, int max);

  /// Expand room quota button
  ///
  /// In en, this message translates to:
  /// **'Expand Room Quota'**
  String get expandRoomQuota;

  /// Add new room button
  ///
  /// In en, this message translates to:
  /// **'Add New Room'**
  String get addNewRoom;

  /// Room name input label
  ///
  /// In en, this message translates to:
  /// **'Room Name'**
  String get roomName;

  /// Furniture category
  ///
  /// In en, this message translates to:
  /// **'Furniture'**
  String get furniture;

  /// Decoration category
  ///
  /// In en, this message translates to:
  /// **'Decoration'**
  String get decoration;

  /// Clothes category
  ///
  /// In en, this message translates to:
  /// **'Clothes'**
  String get clothes;

  /// Food category
  ///
  /// In en, this message translates to:
  /// **'Food'**
  String get food;

  /// Plant withered notification
  ///
  /// In en, this message translates to:
  /// **'This plant has withered! Water it to revive.'**
  String get plantWithered;

  /// Pet hungry notification
  ///
  /// In en, this message translates to:
  /// **'Your pet is hungry! Feed them soon.'**
  String get petHungry;

  /// Morning time of day
  ///
  /// In en, this message translates to:
  /// **'Morning'**
  String get timeOfDayMorning;

  /// Afternoon time of day
  ///
  /// In en, this message translates to:
  /// **'Afternoon'**
  String get timeOfDayAfternoon;

  /// Evening time of day
  ///
  /// In en, this message translates to:
  /// **'Evening'**
  String get timeOfDayEvening;

  /// Night time of day
  ///
  /// In en, this message translates to:
  /// **'Night'**
  String get timeOfDayNight;

  /// Happy mood
  ///
  /// In en, this message translates to:
  /// **'Happy'**
  String get moodHappy;

  /// Sad mood
  ///
  /// In en, this message translates to:
  /// **'Sad'**
  String get moodSad;

  /// Hungry mood
  ///
  /// In en, this message translates to:
  /// **'Hungry'**
  String get moodHungry;

  /// Playful mood
  ///
  /// In en, this message translates to:
  /// **'Playful'**
  String get moodPlayful;

  /// Sleepy mood
  ///
  /// In en, this message translates to:
  /// **'Sleepy'**
  String get moodSleepy;

  /// Event label
  ///
  /// In en, this message translates to:
  /// **'Event'**
  String get event;

  /// Limited time label
  ///
  /// In en, this message translates to:
  /// **'Limited Time'**
  String get limitedTime;

  /// Exclusive items label
  ///
  /// In en, this message translates to:
  /// **'Exclusive Items'**
  String get exclusiveItems;

  /// Add friend button
  ///
  /// In en, this message translates to:
  /// **'Add Friend'**
  String get addFriend;

  /// Invite friends button
  ///
  /// In en, this message translates to:
  /// **'Invite Friends'**
  String get inviteFriends;

  /// Daily communication feature
  ///
  /// In en, this message translates to:
  /// **'Daily Communication'**
  String get dailyCommunication;

  /// Direct messages
  ///
  /// In en, this message translates to:
  /// **'DM Messages'**
  String get dmMessages;

  /// Pet loss support community
  ///
  /// In en, this message translates to:
  /// **'Pet Loss Community'**
  String get petLossCommunity;

  /// Pet care guide
  ///
  /// In en, this message translates to:
  /// **'Pet Care Guide'**
  String get petCareGuide;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ja'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ja':
      return AppLocalizationsJa();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
