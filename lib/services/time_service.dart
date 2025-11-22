import 'dart:async';
import '../models/room.dart';

class TimeService {
  Timer? _timer;

  void startTimeBasedUpdates({
    required Function onHourChange,
    required Function onDayChange,
  }) {
    _timer?.cancel();
    
    _timer = Timer.periodic(Duration(minutes: 1), (timer) {
      final now = DateTime.now();
      
      // Check for hour changes
      if (now.minute == 0) {
        onHourChange();
      }
      
      // Check for day changes
      if (now.hour == 0 && now.minute == 0) {
        onDayChange();
      }
    });
  }

  void stopTimeBasedUpdates() {
    _timer?.cancel();
  }

  /// Get sky darkness level based on time (0 = day, 1 = night)
  double getSkyDarkness() {
    final hour = DateTime.now().hour;
    
    if (hour >= 6 && hour < 18) {
      // Daytime (6 AM - 6 PM)
      return 0.0;
    } else if (hour >= 18 && hour < 20) {
      // Sunset (6 PM - 8 PM)
      return (hour - 18) / 2; // Gradual darkening
    } else if (hour >= 20 || hour < 4) {
      // Night (8 PM - 4 AM)
      return 1.0;
    } else {
      // Sunrise (4 AM - 6 AM)
      return 1.0 - ((hour - 4) / 2); // Gradual brightening
    }
  }

  /// Get time of day display text
  String getTimeOfDayText() {
    final hour = DateTime.now().hour;
    
    if (hour >= 5 && hour < 12) {
      return 'Morning';
    } else if (hour >= 12 && hour < 17) {
      return 'Afternoon';
    } else if (hour >= 17 && hour < 21) {
      return 'Evening';
    } else {
      return 'Night';
    }
  }

  /// Update all plants in rooms based on time passed
  void updatePlantsWaterLevel(List<Room> rooms) {
    for (var room in rooms) {
      room.updatePlants();
    }
  }

  /// Calculate time until next event
  Duration timeUntilNextHour() {
    final now = DateTime.now();
    final nextHour = DateTime(now.year, now.month, now.day, now.hour + 1);
    return nextHour.difference(now);
  }
}
