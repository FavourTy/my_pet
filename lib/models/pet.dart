enum PetType {
  dog,
  cat,
  other,
}

enum PetMood {
  happy,
  sad,
  hungry,
  playful,
  sleepy,
}

class Pet {
  String id;
  String name;
  PetType type;
  String? imageUrl;
  int hp;
  int maxHp;
  int happinessPoints;
  int age; // in days
  DateTime birthDate;
  DateTime lastFedAt;
  DateTime lastPlayedAt;
  List<String> wearingOutfits;
  PetMood currentMood;
  bool isAiGenerated;
  String ownerId;

  Pet({
    required this.id,
    required this.name,
    required this.type,
    this.imageUrl,
    this.hp = 100,
    this.maxHp = 1000,
    this.happinessPoints = 0,
    this.age = 0,
    DateTime? birthDate,
    DateTime? lastFedAt,
    DateTime? lastPlayedAt,
    List<String>? wearingOutfits,
    this.currentMood = PetMood.happy,
    this.isAiGenerated = false,
    required this.ownerId,
  })  : birthDate = birthDate ?? DateTime.now(),
        lastFedAt = lastFedAt ?? DateTime.now(),
        lastPlayedAt = lastPlayedAt ?? DateTime.now(),
        wearingOutfits = wearingOutfits ?? [];

  int get yearsOld => (hp / maxHp * 12).floor();

  double get hpPercentage => hp / maxHp;

  void feed(int hpGain) {
    hp = (hp + hpGain).clamp(0, maxHp);
    lastFedAt = DateTime.now();
    updateMood();
  }

  void play(int happinessGain) {
    happinessPoints += happinessGain;
    lastPlayedAt = DateTime.now();
    updateMood();
  }

  void updateAge() {
    final daysSinceBirth = DateTime.now().difference(birthDate).inDays;
    age = daysSinceBirth;
  }

  void updateMood() {
    final hoursSinceFed = DateTime.now().difference(lastFedAt).inHours;
    final hoursSincePlayed = DateTime.now().difference(lastPlayedAt).inHours;

    if (hoursSinceFed > 12) {
      currentMood = PetMood.hungry;
    } else if (hoursSincePlayed > 8) {
      currentMood = PetMood.playful;
    } else if (hp < maxHp * 0.3) {
      currentMood = PetMood.sad;
    } else if (happinessPoints > 1000) {
      currentMood = PetMood.happy;
    } else {
      currentMood = PetMood.sleepy;
    }
  }

  void equipOutfit(String outfitId) {
    if (!wearingOutfits.contains(outfitId)) {
      wearingOutfits.add(outfitId);
    }
  }

  void unequipOutfit(String outfitId) {
    wearingOutfits.remove(outfitId);
  }
}
