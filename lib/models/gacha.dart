import 'item.dart';

class GachaBanner {
  String id;
  String name;
  String description;
  int costInCoins;
  List<GachaPool> pools;
  DateTime startDate;
  DateTime endDate;
  String? bannerImageUrl;

  GachaBanner({
    required this.id,
    required this.name,
    required this.description,
    required this.costInCoins,
    required this.pools,
    required this.startDate,
    required this.endDate,
    this.bannerImageUrl,
  });

  bool get isActive {
    final now = DateTime.now();
    return now.isAfter(startDate) && now.isBefore(endDate);
  }
}

class GachaPool {
  ItemRarity rarity;
  double dropRate; // Percentage (0-100)
  List<String> itemIds;

  GachaPool({
    required this.rarity,
    required this.dropRate,
    required this.itemIds,
  });
}

class GachaResult {
  String userId;
  String bannerId;
  String itemId;
  ItemRarity rarity;
  DateTime pulledAt;

  GachaResult({
    required this.userId,
    required this.bannerId,
    required this.itemId,
    required this.rarity,
    DateTime? pulledAt,
  }) : pulledAt = pulledAt ?? DateTime.now();
}
