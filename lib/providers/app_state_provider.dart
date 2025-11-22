import 'package:flutter/foundation.dart';
import '../models/user.dart';
import '../models/pet.dart';
import '../models/room.dart';
import '../models/event.dart';
import '../services/time_service.dart';

class AppStateProvider with ChangeNotifier {
  User? _currentUser;
  List<Pet> _userPets = [];
  List<Room> _userRooms = [];
  Pet? _activePet;
  Room? _activeRoom;
  List<GameEvent> _activeEvents = [];
  
  final TimeService _timeService = TimeService();
  
  User? get currentUser => _currentUser;
  List<Pet> get userPets => _userPets;
  List<Room> get userRooms => _userRooms;
  Pet? get activePet => _activePet;
  Room? get activeRoom => _activeRoom;
  List<GameEvent> get activeEvents => _activeEvents;
  
  double get skyDarkness => _timeService.getSkyDarkness();
  String get timeOfDay => _timeService.getTimeOfDayText();

  Future<void> initialize() async {
    // Create seed data for demonstration
    await _createSeedData();
    
    // Start time-based updates
    _timeService.startTimeBasedUpdates(
      onHourChange: _onHourChange,
      onDayChange: _onDayChange,
    );
  }

  Future<void> _createSeedData() async {
    // Create demo user
    _currentUser = User(
      id: 'user_1',
      username: 'PetLover123',
      points: 1000,
      coins: 5000,
      membershipTier: MembershipTier.free,
      roomQuota: 3,
    );

    // Create demo pet
    final pet = Pet(
      id: 'pet_1',
      name: 'Fluffy',
      type: PetType.dog,
      ownerId: _currentUser!.id,
      hp: 850,
      maxHp: 1000,
      happinessPoints: 500,
    );
    
    _userPets.add(pet);
    _activePet = pet;

    // Create demo room
    final room = Room(
      id: 'room_1',
      name: 'Main Room',
      ownerId: _currentUser!.id,
      plants: [
        Plant(
          id: 'plant_1',
          plantType: 'Rose',
          waterLevel: 75,
        ),
      ],
    );
    
    _userRooms.add(room);
    _activeRoom = room;

    // Create demo events
    _activeEvents = [
      GameEvent(
        id: 'event_1',
        title: 'Spring Festival',
        description: 'Limited time spring-themed items!',
        type: EventType.seasonal,
        startDate: DateTime.now().subtract(Duration(days: 5)),
        endDate: DateTime.now().add(Duration(days: 25)),
        exclusiveItemIds: ['item_1', 'item_2', 'item_3'],
        isPaidMemberOnly: true,
      ),
    ];

    notifyListeners();
  }

  void _onHourChange() {
    // Update plant water levels
    if (_userRooms.isNotEmpty) {
      _timeService.updatePlantsWaterLevel(_userRooms);
      notifyListeners();
    }
    
    // Update pet moods
    for (var pet in _userPets) {
      pet.updateMood();
    }
    notifyListeners();
  }

  void _onDayChange() {
    // Update pet ages
    for (var pet in _userPets) {
      pet.updateAge();
    }
    notifyListeners();
  }

  Future<void> setActivePet(Pet pet) async {
    _activePet = pet;
    notifyListeners();
  }

  Future<void> setActiveRoom(Room room) async {
    _activeRoom = room;
    notifyListeners();
  }

  Future<void> feedPet(Pet pet, int hpGain) async {
    pet.feed(hpGain);
    notifyListeners();
  }

  Future<void> playWithPet(Pet pet, int happinessGain) async {
    pet.play(happinessGain);
    notifyListeners();
  }

  Future<void> equipOutfit(Pet pet, String outfitId) async {
    pet.equipOutfit(outfitId);
    notifyListeners();
  }

  Future<void> addPointsToUser(int points) async {
    if (_currentUser != null) {
      _currentUser!.addPoints(points);
      notifyListeners();
    }
  }

  Future<void> deductPointsFromUser(int points) async {
    if (_currentUser != null) {
      _currentUser!.deductPoints(points);
      notifyListeners();
    }
  }

  Future<void> addCoinsToUser(int coins) async {
    if (_currentUser != null) {
      _currentUser!.addCoins(coins);
      notifyListeners();
    }
  }

  Future<void> deductCoinsFromUser(int coins) async {
    if (_currentUser != null) {
      _currentUser!.deductCoins(coins);
      notifyListeners();
    }
  }

  Future<void> createNewRoom(String name) async {
    if (_currentUser != null && _userRooms.length < _currentUser!.roomQuota) {
      final room = Room(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name,
        ownerId: _currentUser!.id,
      );
      
      _userRooms.add(room);
      notifyListeners();
    }
  }

  Future<void> expandRoomQuota() async {
    if (_currentUser != null) {
      _currentUser!.increaseRoomQuota();
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _timeService.stopTimeBasedUpdates();
    super.dispose();
  }
}
