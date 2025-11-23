// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'ペットゲーム';

  @override
  String get home => 'ホーム';

  @override
  String get gacha => 'ガチャ';

  @override
  String get plaza => '広場';

  @override
  String get eventPlaza => 'イベント広場';

  @override
  String get shop => 'ショップ';

  @override
  String get bazaar => 'バザー';

  @override
  String get profile => 'プロフィール';

  @override
  String get rooms => '部屋';

  @override
  String get subscription => 'サブスクリプション';

  @override
  String yearsOld(int years) {
    return '$years歳';
  }

  @override
  String get points => 'ポイント';

  @override
  String get coins => 'コイン';

  @override
  String get feed => 'えさをあげる';

  @override
  String get play => '遊ぶ';

  @override
  String get water => '水をやる';

  @override
  String get createPet => 'ペットを作る';

  @override
  String get aiPetCreation => 'AIペット作成';

  @override
  String get aiPetCreationDescription => 'AIを使って独自のペットを作成（有料会員限定）';

  @override
  String get petName => 'ペットの名前';

  @override
  String get petType => 'ペットの種類';

  @override
  String get dog => '犬';

  @override
  String get cat => '猫';

  @override
  String get other => 'その他';

  @override
  String get appearance => '外見';

  @override
  String get personality => '性格';

  @override
  String get generateWithAI => 'AIで生成';

  @override
  String get educationalAdvice => '教育アドバイス';

  @override
  String get askQuestion => '質問する';

  @override
  String get getAdvice => 'アドバイスを取得';

  @override
  String get trainingVideos => 'トレーニング動画';

  @override
  String get freeMember => '無料会員';

  @override
  String get paidMember => '有料会員';

  @override
  String get premiumMember => 'プレミアム会員';

  @override
  String get upgradeToPremium => 'プレミアムにアップグレード';

  @override
  String get paidMemberOnly => '有料会員限定';

  @override
  String roomQuota(int current, int max) {
    return '部屋の上限: $current/$max';
  }

  @override
  String get expandRoomQuota => '部屋の上限を拡張';

  @override
  String get addNewRoom => '新しい部屋を追加';

  @override
  String get roomName => '部屋の名前';

  @override
  String get furniture => '家具';

  @override
  String get decoration => '装飾';

  @override
  String get clothes => '服';

  @override
  String get food => '食べ物';

  @override
  String get plantWithered => 'この植物は枯れました！水をあげて復活させましょう。';

  @override
  String get petHungry => 'ペットがお腹を空かせています！すぐに餌をあげましょう。';

  @override
  String get timeOfDayMorning => '朝';

  @override
  String get timeOfDayAfternoon => '午後';

  @override
  String get timeOfDayEvening => '夕方';

  @override
  String get timeOfDayNight => '夜';

  @override
  String get moodHappy => '幸せ';

  @override
  String get moodSad => '悲しい';

  @override
  String get moodHungry => 'お腹が空いた';

  @override
  String get moodPlayful => '遊びたい';

  @override
  String get moodSleepy => '眠い';

  @override
  String get event => 'イベント';

  @override
  String get limitedTime => '期間限定';

  @override
  String get exclusiveItems => '限定アイテム';

  @override
  String get addFriend => '友達を追加';

  @override
  String get inviteFriends => '友達を招待';

  @override
  String get dailyCommunication => '日常のコミュニケーション';

  @override
  String get dmMessages => 'DMメッセージ';

  @override
  String get petLossCommunity => 'ペットロスコミュニティ';

  @override
  String get petCareGuide => 'ペットケアガイド';
}
