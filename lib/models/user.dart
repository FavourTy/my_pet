enum MembershipTier {
  free,
  paid,
}

class User {
  String id;
  String username;
  int points;
  int coins;
  MembershipTier membershipTier;
  DateTime? subscriptionExpiryDate;
  List<String> ownedItems;
  List<String> friendIds;
  int roomQuota;
  DateTime createdAt;
  DateTime lastActiveAt;

  User({
    required this.id,
    required this.username,
    this.points = 0,
    this.coins = 0,
    this.membershipTier = MembershipTier.free,
    this.subscriptionExpiryDate,
    List<String>? ownedItems,
    List<String>? friendIds,
    this.roomQuota = 1,
    DateTime? createdAt,
    DateTime? lastActiveAt,
  })  : ownedItems = ownedItems ?? [],
        friendIds = friendIds ?? [],
        createdAt = createdAt ?? DateTime.now(),
        lastActiveAt = lastActiveAt ?? DateTime.now();

  bool get isPaidMember => membershipTier == MembershipTier.paid &&
      (subscriptionExpiryDate?.isAfter(DateTime.now()) ?? false);

  bool canAccessFeature(String feature) {
    switch (feature) {
      case 'ai_pet_creation':
      case 'qualification_linking':
      case 'event_plaza':
        return isPaidMember;
      case 'basic_play':
      case 'gacha':
        return true;
      default:
        return false;
    }
  }

  void addPoints(int amount) {
    points += amount;
  }

  void deductPoints(int amount) {
    if (points >= amount) {
      points -= amount;
    }
  }

  void addCoins(int amount) {
    coins += amount;
  }

  void deductCoins(int amount) {
    if (coins >= amount) {
      coins -= amount;
    }
  }

  void addOwnedItem(String itemId) {
    if (!ownedItems.contains(itemId)) {
      ownedItems.add(itemId);
    }
  }

  void increaseRoomQuota() {
    roomQuota++;
  }
}
