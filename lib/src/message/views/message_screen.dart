import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medical/common/utils/app_routes.dart';
import 'package:medical/common/utils/kcolors.dart';
import 'package:medical/common/widgets/app_style.dart';
import 'package:medical/common/widgets/reusable_text.dart';
import 'package:medical/src/message/widgets/message_widget_liste.dart';

class MessageScreen extends StatefulWidget {
  final String doctorName; // Nom du docteur à afficher dans l'AppBar

  const MessageScreen({Key? key, required this.doctorName}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            context.go('/entrypoint'); // Retour à la page précédente
          },
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Kolors.kWhite,
          ),
        ),
        backgroundColor: Kolors.kPrimary,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: Row(
              children: [
                Container(
                  height: 23,
                  width: 23,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Kolors.kWhite,
                  ),
                  child: Icon(Icons.call, size: 15, color: Kolors.kPrimary),
                ),
                SizedBox(width: 10),
                Container(
                  height: 23,
                  width: 23,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Kolors.kWhite,
                  ),
                  child: Icon(Icons.video_camera_front_outlined,
                      size: 15, color: Kolors.kPrimary),
                ),
              ],
            ),
          )
        ],
        title: ReusableText(
          text: widget.doctorName, // Utilisation du nom du docteur
          style: appStyle(20, Kolors.kWhite, FontWeight.bold),
        ),
      ),
      backgroundColor: Kolors.kWhite,
      body: Column(
        children: [
          Container(
            height: 700,
            color: Kolors.kPrimary,
            child: MessageWidgetListe(),
              ),
        ],
      ));
  }
}