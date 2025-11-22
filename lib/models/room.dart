class Room {
  String id;
  String name;
  String ownerId;
  List<String> furnitureIds;
  List<String> decorationIds;
  String? wallpaperItemId;
  String? flooringItemId;
  DateTime createdAt;
  DateTime lastModifiedAt;
  List<PlacedItem> placedItems;
  List<Plant> plants;

  Room({
    required this.id,
    required this.name,
    required this.ownerId,
    List<String>? furnitureIds,
    List<String>? decorationIds,
    this.wallpaperItemId,
    this.flooringItemId,
    DateTime? createdAt,
    DateTime? lastModifiedAt,
    List<PlacedItem>? placedItems,
    List<Plant>? plants,
  })  : furnitureIds = furnitureIds ?? [],
        decorationIds = decorationIds ?? [],
        createdAt = createdAt ?? DateTime.now(),
        lastModifiedAt = lastModifiedAt ?? DateTime.now(),
        placedItems = placedItems ?? [],
        plants = plants ?? [];

  void addFurniture(String itemId, double x, double y) {
    furnitureIds.add(itemId);
    placedItems.add(PlacedItem(itemId: itemId, x: x, y: y));
    lastModifiedAt = DateTime.now();
  }

  void removeFurniture(String itemId) {
    furnitureIds.remove(itemId);
    placedItems.removeWhere((item) => item.itemId == itemId);
    lastModifiedAt = DateTime.now();
  }

  void addPlant(Plant plant) {
    plants.add(plant);
    lastModifiedAt = DateTime.now();
  }

  void updatePlants() {
    for (var plant in plants) {
      plant.updateWaterLevel();
    }
  }
}

class PlacedItem {
  String itemId;
  double x;
  double y;
  double rotation;

  PlacedItem({
    required this.itemId,
    required this.x,
    required this.y,
    this.rotation = 0,
  });
}

class Plant {
  String id;
  String plantType;
  double waterLevel;
  DateTime lastWateredAt;
  bool isWithered;

  Plant({
    required this.id,
    required this.plantType,
    this.waterLevel = 100,
    DateTime? lastWateredAt,
    this.isWithered = false,
  }) : lastWateredAt = lastWateredAt ?? DateTime.now();

  void water() {
    waterLevel = 100;
    lastWateredAt = DateTime.now();
    isWithered = false;
  }

  void updateWaterLevel() {
    final hoursSinceWatered = DateTime.now().difference(lastWateredAt).inHours;
    waterLevel = (100 - (hoursSinceWatered * 2)).clamp(0, 100).toDouble();
    
    if (waterLevel <= 0) {
      isWithered = true;
    }
  }
}
