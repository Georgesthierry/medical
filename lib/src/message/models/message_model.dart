import 'dart:convert';

MessageModel messageModelFromJson(String str) =>
    MessageModel.fromJson(json.decode(str));

String messageModelToJson(MessageModel data) => json.encode(data.toJson());

class MessageModel {
  int? id;
  String senderId;
  String recipientId;
  String content;
  DateTime timestamp;
  bool isRead;

  MessageModel({
    this.id,
    required this.senderId,
    required this.recipientId,
    required this.content,
    required this.timestamp,
    this.isRead = false, // Par défaut, le message n'est pas lu
  });

  /// Convertir un JSON en objet MessageModel
  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
    id: json["id"] ?? 0,
    senderId: json["sender_id"] ?? "",
    recipientId: json["recipient_id"] ?? "",
    content: json["content"] ?? "",
    timestamp: DateTime.parse(json["timestamp"]),
    isRead: json["is_read"] ?? false,
  );

  /// Convertir un objet MessageModel en JSON
  Map<String, dynamic> toJson() => {
    "id": id,
    "sender_id": senderId,
    "recipient_id": recipientId,
    "content": content,
    "timestamp": timestamp.toIso8601String(),
    "is_read": isRead,
  };

  /// Méthode de filtrage et tri des messages
  static List<MessageModel> filterAndSortMessages(
      List<MessageModel> messages, {
        String? senderId,
        String? recipientId,
        bool? onlyUnread,
        DateTime? startDate,
        DateTime? endDate,
        bool sortByTimestamp = true,
        bool ascending = true,
      }) {
    // Filtrage des messages selon les critères
    List<MessageModel> filteredMessages = messages.where((message) {
      final matchesSender = senderId == null || message.senderId == senderId;
      final matchesRecipient =
          recipientId == null || message.recipientId == recipientId;
      final matchesUnread =
          onlyUnread == null || message.isRead != onlyUnread;
      final matchesStartDate =
          startDate == null || message.timestamp.isAfter(startDate);
      final matchesEndDate =
          endDate == null || message.timestamp.isBefore(endDate);

      return matchesSender &&
          matchesRecipient &&
          matchesUnread &&
          matchesStartDate &&
          matchesEndDate;
    }).toList();

    // Tri des messages
    if (sortByTimestamp) {
      filteredMessages.sort((a, b) {
        final comparison = a.timestamp.compareTo(b.timestamp);
        return ascending ? comparison : -comparison;
      });
    }

    return filteredMessages;
  }

  /// Méthode pour marquer un message comme lu
  void markAsRead() {
    isRead = true;
  }

  /// Méthode pour marquer un message comme non lu
  void markAsUnread() {
    isRead = false;
  }

  /// Afficher un aperçu du contenu pour les messages longs
  String previewContent({int length = 30}) {
    return content.length > length ? "${content.substring(0, length)}..." : content;
  }
}
