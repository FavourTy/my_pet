enum ItemCategory {
  food,
  furniture,
  clothing,
  decoration,
  training,
  room,
}

enum ItemRarity {
  common,
  rare,
  epic,
  legendary,
}

class GameItem {
  String id;
  String name;
  String description;
  ItemCategory category;
  ItemRarity rarity;
  int priceInCoins;
  int priceInPoints;
  String? imageUrl;
  bool isLimitedEdition;
  bool isPaidMemberOnly;
  bool isTradeable;
  int? hpBoost;
  int? happinessBoost;

  GameItem({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    this.rarity = ItemRarity.common,
    this.priceInCoins = 0,
    this.priceInPoints = 0,
    this.imageUrl,
    this.isLimitedEdition = false,
    this.isPaidMemberOnly = false,
    this.isTradeable = true,
    this.hpBoost,
    this.happinessBoost,
  });

  String get rarityColor {
    switch (rarity) {
      case ItemRarity.legendary:
        return '#A855F7'; // purple
      case ItemRarity.epic:
        return '#6366F1'; // indigo
      case ItemRarity.rare:
        return '#3B82F6'; // blue
      case ItemRarity.common:
      default:
        return '#9CA3AF'; // gray
    }
  }
}

class BazaarListing {
  String id;
  String itemId;
  String sellerId;
  int priceInCoins;
  DateTime listedAt;
  bool isSold;

  BazaarListing({
    required this.id,
    required this.itemId,
    required this.sellerId,
    required this.priceInCoins,
    DateTime? listedAt,
    this.isSold = false,
  }) : listedAt = listedAt ?? DateTime.now();
}
