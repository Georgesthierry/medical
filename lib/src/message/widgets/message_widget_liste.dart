import 'package:flutter/material.dart';
import 'package:medical/src/message/controleur/message_notifier.dart';
import 'package:medical/src/message/models/message_model.dart';
import 'package:provider/provider.dart';

class MessageWidgetListe extends StatefulWidget {
  const MessageWidgetListe({Key? key}) : super(key: key);

  @override
  State<MessageWidgetListe> createState() => _MessageWidgetListeState();
}

class _MessageWidgetListeState extends State<MessageWidgetListe> {

  @override
  void initState() {
    super.initState();
    // Charger les messages à l'ouverture
    Future.microtask(() => context.read<MessageNotifier>().fetchMessages());
  }

  @override
  Widget build(BuildContext context) {
    final messageNotifier = context.watch<MessageNotifier>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Messagerie'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: messageNotifier.isLoading
          ? const Center(child: CircularProgressIndicator())
          : messageNotifier.messages.isEmpty
          ? const Center(
        child: Text(
          'Aucun message',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      )
          : Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: messageNotifier.messages.length,
          itemBuilder: (context, index) {
            final MessageModel message =
            messageNotifier.messages[index];

            final bool isSentByUser =
                message.senderId == "currentUserId"; // Remplacez "currentUserId" par l'ID de l'utilisateur actuel.

            return Align(
              alignment: isSentByUser
                  ? Alignment.centerRight // Messages envoyés à droite
                  : Alignment.centerLeft, // Messages reçus à gauche
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isSentByUser
                      ? Colors.blue[100] // Bleu clair pour les messages envoyés
                      : Colors.grey[200], // Gris clair pour les messages reçus
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(12),
                    topRight: const Radius.circular(12),
                    bottomLeft: isSentByUser
                        ? const Radius.circular(12)
                        : Radius.zero,
                    bottomRight: isSentByUser
                        ? Radius.zero
                        : const Radius.circular(12),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: isSentByUser
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    Text(
                      message.content,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      _formatTimestamp(message.timestamp),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  /// Formater la date pour l'affichage
  String _formatTimestamp(DateTime timestamp) {
    return "${timestamp.hour}:${timestamp.minute.toString().padLeft(2, '0')}"; // Affiche l'heure au format HH:mm
  }
}
