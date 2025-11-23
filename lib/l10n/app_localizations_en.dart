// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Pet Game';

  @override
  String get home => 'Home';

  @override
  String get gacha => 'Gacha';

  @override
  String get plaza => 'Plaza';

  @override
  String get eventPlaza => 'Event Plaza';

  @override
  String get shop => 'Shop';

  @override
  String get bazaar => 'Bazaar';

  @override
  String get profile => 'Profile';

  @override
  String get rooms => 'Rooms';

  @override
  String get subscription => 'Subscription';

  @override
  String yearsOld(int years) {
    return '$years years old';
  }

  @override
  String get points => 'Points';

  @override
  String get coins => 'Coins';

  @override
  String get feed => 'Feed';

  @override
  String get play => 'Play';

  @override
  String get water => 'Water';

  @override
  String get createPet => 'Create Pet';

  @override
  String get aiPetCreation => 'AI Pet Creation';

  @override
  String get aiPetCreationDescription =>
      'Create a unique pet using AI (Paid members only)';

  @override
  String get petName => 'Pet Name';

  @override
  String get petType => 'Pet Type';

  @override
  String get dog => 'Dog';

  @override
  String get cat => 'Cat';

  @override
  String get other => 'Other';

  @override
  String get appearance => 'Appearance';

  @override
  String get personality => 'Personality';

  @override
  String get generateWithAI => 'Generate with AI';

  @override
  String get educationalAdvice => 'Educational Advice';

  @override
  String get askQuestion => 'Ask a Question';

  @override
  String get getAdvice => 'Get Advice';

  @override
  String get trainingVideos => 'Training Videos';

  @override
  String get freeMember => 'Free Member';

  @override
  String get paidMember => 'Paid Member';

  @override
  String get premiumMember => 'Premium Member';

  @override
  String get upgradeToPremium => 'Upgrade to Premium';

  @override
  String get paidMemberOnly => 'Paid Members Only';

  @override
  String roomQuota(int current, int max) {
    return 'Room Quota: $current/$max';
  }

  @override
  String get expandRoomQuota => 'Expand Room Quota';

  @override
  String get addNewRoom => 'Add New Room';

  @override
  String get roomName => 'Room Name';

  @override
  String get furniture => 'Furniture';

  @override
  String get decoration => 'Decoration';

  @override
  String get clothes => 'Clothes';

  @override
  String get food => 'Food';

  @override
  String get plantWithered => 'This plant has withered! Water it to revive.';

  @override
  String get petHungry => 'Your pet is hungry! Feed them soon.';

  @override
  String get timeOfDayMorning => 'Morning';

  @override
  String get timeOfDayAfternoon => 'Afternoon';

  @override
  String get timeOfDayEvening => 'Evening';

  @override
  String get timeOfDayNight => 'Night';

  @override
  String get moodHappy => 'Happy';

  @override
  String get moodSad => 'Sad';

  @override
  String get moodHungry => 'Hungry';

  @override
  String get moodPlayful => 'Playful';

  @override
  String get moodSleepy => 'Sleepy';

  @override
  String get event => 'Event';

  @override
  String get limitedTime => 'Limited Time';

  @override
  String get exclusiveItems => 'Exclusive Items';

  @override
  String get addFriend => 'Add Friend';

  @override
  String get inviteFriends => 'Invite Friends';

  @override
  String get dailyCommunication => 'Daily Communication';

  @override
  String get dmMessages => 'DM Messages';

  @override
  String get petLossCommunity => 'Pet Loss Community';

  @override
  String get petCareGuide => 'Pet Care Guide';
}
