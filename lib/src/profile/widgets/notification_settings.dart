import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical/common/utils/app_routes.dart';
import 'package:medical/common/utils/kcolors.dart';
import 'package:medical/common/widgets/app_style.dart';
import 'package:medical/common/widgets/reusable_text.dart';

class NotificationSettings extends StatefulWidget {
  const NotificationSettings({super.key});

  @override
  State<NotificationSettings> createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  bool generalNotification = false;
  bool sound = false;
  bool soundCall = false;
  bool vibrate = false;
  bool specialOffers = false;
  bool payments = false;
  bool promoDiscount = false;
  bool cashback = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap:(){
              context.go('/entrypoint');
            },
        child: Icon(Icons.arrow_back_ios_new_rounded,color: Kolors.kPrimary,)),
        centerTitle: true,
        backgroundColor: Kolors.kWhite,
      title: ReusableText(text: "Notification Setting", style: appStyle(24, Kolors.kPrimary, FontWeight.bold)),),
      backgroundColor: Kolors.kWhite,
      body: ListView(
        children: [
          buildSwitch("General Notification", generalNotification, (value) {
            setState(() {
              generalNotification = value;
            });
          }),
          buildSwitch("Sound", sound, (value) {
            setState(() {
              sound = value;
            });
          }),
          buildSwitch("Sound Call", soundCall, (value) {
            setState(() {
              soundCall = value;
            });
          }),
          buildSwitch("Vibrate", vibrate, (value) {
            setState(() {
              vibrate = value;
            });
          }),
          buildSwitch("Special Offers", specialOffers, (value) {
            setState(() {
              specialOffers = value;
            });
          }),
          buildSwitch("Payments", payments, (value) {
            setState(() {
              payments = value;
            });
          }),
          buildSwitch("Promo And Discount", promoDiscount, (value) {
            setState(() {
              promoDiscount = value;
            });
          }),
          buildSwitch("Cashback", cashback, (value) {
            setState(() {
              cashback = value;
            });
          }),
        ],
      ),
    );
  }

  Widget buildSwitch(String text, bool value, Function(bool) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.white,
            activeTrackColor: Colors.blue,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.blue[100],
          ),
        ],
      ),
    );
  }
}
