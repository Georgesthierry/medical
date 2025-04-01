import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:medical/common/services/storage.dart';
import 'package:medical/common/widgets/error_modal.dart';
import 'package:medical/src/message/models/message_model.dart';



class MessageNotifier with ChangeNotifier {
  List<MessageModel> _messages = [];
  bool _isLoading = false;

  // Getters
  List<MessageModel> get messages => _messages;
  bool get isLoading => _isLoading;

  // Modifier l'état de chargement
  void _setLoading(bool value) {
    if (_isLoading != value) {
      _isLoading = value;
      notifyListeners();
    }
  }

  /// Récupérer les messages échangés avec un médecin
  Future<void> fetchMessages(BuildContext context, int doctorId) async {
    _setLoading(true);
    try {
      final token = Storage().getString('accessToken');
      final url = Uri.parse('http://10.0.2.2:8000/api/chat/messages/$doctorId/');
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Token $token',
      });

      if (response.statusCode == 200) {
        _messages = List<MessageModel>.from(
          jsonDecode(response.body).map((x) => MessageModel.fromJson(x)),
        );
        notifyListeners();
      } else {
        _handleError(context, response, "Erreur lors du chargement des messages");
      }
    } catch (e) {
      showErrorPopup(context, "Erreur réseau", e.toString(), null);
    }
    _setLoading(false);
  }

  /// Envoyer un message à un médecin
  Future<void> sendMessage(BuildContext context, int doctorId, String content) async {
    try {
      final token = Storage().getString('accessToken');
      final url = Uri.parse('http://10.0.2.2:8000/api/chat/messages/$doctorId/');
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token $token',
        },
        body: jsonEncode({'content': content}),
      );

      if (response.statusCode == 201) {
        final newMessage = MessageModel.fromJson(jsonDecode(response.body));
        _messages.add(newMessage); // Ajouter le nouveau message localement
        notifyListeners();
      } else {
        _handleError(context, response, "Erreur lors de l'envoi du message");
      }
    } catch (e) {
      showErrorPopup(context, "Erreur réseau", e.toString(), null);
    }
  }

  // Gestion des erreurs
  void _handleError(BuildContext context, http.Response response, String defaultMessage) {
    final errorData = jsonDecode(response.body);
    showErrorPopup(
      context,
      "Erreur",
      errorData['error'] ?? defaultMessage,
      response.statusCode as bool?,
    );
  }
}
