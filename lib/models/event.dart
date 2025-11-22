enum EventType {
  monthly,
  special,
  seasonal,
  limited,
}

class GameEvent {
  String id;
  String title;
  String description;
  EventType type;
  DateTime startDate;
  DateTime endDate;
  List<String> exclusiveItemIds;
  bool isPaidMemberOnly;
  int? ticketRequirement;
  String? imageUrl;

  GameEvent({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.startDate,
    required this.endDate,
    List<String>? exclusiveItemIds,
    this.isPaidMemberOnly = false,
    this.ticketRequirement,
    this.imageUrl,
  }) : exclusiveItemIds = exclusiveItemIds ?? [];

  bool get isActive {
    final now = DateTime.now();
    return now.isAfter(startDate) && now.isBefore(endDate);
  }

  int get daysRemaining {
    final now = DateTime.now();
    if (!isActive) return 0;
    return endDate.difference(now).inDays;
  }
}

class EventTicket {
  String id;
  String eventId;
  String userId;
  DateTime acquiredAt;
  bool isUsed;

  EventTicket({
    required this.id,
    required this.eventId,
    required this.userId,
    DateTime? acquiredAt,
    this.isUsed = false,
  }) : acquiredAt = acquiredAt ?? DateTime.now();
}
