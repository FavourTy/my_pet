class Message {
  String id;
  String senderId;
  String receiverId;
  String content;
  DateTime sentAt;
  bool isRead;
  String? roomId; // If message is left in a room

  Message({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.content,
    DateTime? sentAt,
    this.isRead = false,
    this.roomId,
  }) : sentAt = sentAt ?? DateTime.now();
}

class PlazaPost {
  String id;
  String authorId;
  String content;
  List<String> imageUrls;
  DateTime postedAt;
  List<String> likedByUserIds;
  List<String> commentIds;
  bool isPetLossSupport; // For pet loss communication

  PlazaPost({
    required this.id,
    required this.authorId,
    required this.content,
    List<String>? imageUrls,
    DateTime? postedAt,
    List<String>? likedByUserIds,
    List<String>? commentIds,
    this.isPetLossSupport = false,
  })  : imageUrls = imageUrls ?? [],
        postedAt = postedAt ?? DateTime.now(),
        likedByUserIds = likedByUserIds ?? [],
        commentIds = commentIds ?? [];

  void like(String userId) {
    if (!likedByUserIds.contains(userId)) {
      likedByUserIds.add(userId);
    }
  }

  void unlike(String userId) {
    likedByUserIds.remove(userId);
  }

  void addComment(String commentId) {
    commentIds.add(commentId);
  }
}

class Comment {
  String id;
  String postId;
  String authorId;
  String content;
  DateTime postedAt;

  Comment({
    required this.id,
    required this.postId,
    required this.authorId,
    required this.content,
    DateTime? postedAt,
  }) : postedAt = postedAt ?? DateTime.now();
}

class FriendRequest {
  String id;
  String senderId;
  String receiverId;
  DateTime sentAt;
  bool isAccepted;
  bool isRejected;

  FriendRequest({
    required this.id,
    required this.senderId,
    required this.receiverId,
    DateTime? sentAt,
    this.isAccepted = false,
    this.isRejected = false,
  }) : sentAt = sentAt ?? DateTime.now();
}
