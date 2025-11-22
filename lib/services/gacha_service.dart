import 'dart:math';
import '../models/gacha.dart';
import '../models/item.dart';

class GachaService {
  final Random _random = Random();

  /// Perform a single gacha pull
  Future<GachaResult> pullGacha(
    String userId,
    GachaBanner banner,
  ) async {
    // Determine rarity based on drop rates
    double roll = _random.nextDouble() * 100;
    double cumulativeRate = 0;

    for (var pool in banner.pools) {
      cumulativeRate += pool.dropRate;
      if (roll <= cumulativeRate) {
        // Select random item from this rarity pool
        final itemId = pool.itemIds[_random.nextInt(pool.itemIds.length)];
        
        return GachaResult(
          userId: userId,
          bannerId: banner.id,
          itemId: itemId,
          rarity: pool.rarity,
        );
      }
    }

    // Fallback to common rarity
    final commonPool = banner.pools.firstWhere(
      (p) => p.rarity == ItemRarity.common,
      orElse: () => banner.pools.first,
    );
    
    final itemId = commonPool.itemIds[_random.nextInt(commonPool.itemIds.length)];
    
    return GachaResult(
      userId: userId,
      bannerId: banner.id,
      itemId: itemId,
      rarity: commonPool.rarity,
    );
  }

  /// Perform multiple gacha pulls (10-pull with guaranteed rare)
  Future<List<GachaResult>> pullMultiGacha(
    String userId,
    GachaBanner banner,
    int count,
  ) async {
    List<GachaResult> results = [];
    
    for (int i = 0; i < count; i++) {
      // Last pull guaranteed rare or better
      if (i == count - 1) {
        results.add(await _pullGuaranteedRare(userId, banner));
      } else {
        results.add(await pullGacha(userId, banner));
      }
    }
    
    return results;
  }

  Future<GachaResult> _pullGuaranteedRare(
    String userId,
    GachaBanner banner,
  ) async {
    // Filter pools for rare or better
    final rarePools = banner.pools.where(
      (p) => p.rarity.index >= ItemRarity.rare.index,
    ).toList();

    if (rarePools.isEmpty) {
      return pullGacha(userId, banner);
    }

    // Redistribute drop rates among rare pools
    double totalRate = rarePools.fold(0, (sum, pool) => sum + pool.dropRate);
    double roll = _random.nextDouble() * totalRate;
    double cumulativeRate = 0;

    for (var pool in rarePools) {
      cumulativeRate += pool.dropRate;
      if (roll <= cumulativeRate) {
        final itemId = pool.itemIds[_random.nextInt(pool.itemIds.length)];
        
        return GachaResult(
          userId: userId,
          bannerId: banner.id,
          itemId: itemId,
          rarity: pool.rarity,
        );
      }
    }

    // Fallback
    final pool = rarePools.first;
    final itemId = pool.itemIds[_random.nextInt(pool.itemIds.length)];
    
    return GachaResult(
      userId: userId,
      bannerId: banner.id,
      itemId: itemId,
      rarity: pool.rarity,
    );
  }
}
