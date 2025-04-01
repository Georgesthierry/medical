import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical/common/utils/app_routes.dart';
import 'package:medical/common/utils/kcolors.dart';
import 'package:medical/common/widgets/app_style.dart';
import 'package:medical/common/widgets/reusable_text.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<Map<String, dynamic>> notifications = [
    {"title": "Scheduled Appointment", "time": "2 M", "date": "Today"},
    {"title": "Scheduled Change", "time": "2 H", "date": "Today"},
    {"title": "Medical Notes", "time": "3 H", "date": "Today"},
    {"title": "Scheduled Appointment", "time": "1 D", "date": "Yesterday"},
  ];

  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kolors.kWhite,
      appBar: AppBar(
        backgroundColor: Kolors.kWhite,
        automaticallyImplyLeading: true,
        centerTitle: true,
        leading: GestureDetector(
          onTap: (){
            context.go('/entrypoint');
          },
            child: Icon(Icons.arrow_back_ios_new_rounded,color: Kolors.kPrimary,size: 22,)),
        title: ReusableText(text: 'Notification', style: appStyle(24, Kolors.kPrimary, FontWeight.bold)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Container(
              height: 21,
              width: 57,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(23),color: Kolors.kPrimaryLight),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ReusableText(text: "News", style: appStyle(12, Kolors.kDark, FontWeight.normal)),
                ],
              ),
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          bool isSelected = selectedIndex == index;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (index == 0 || notifications[index]["date"] != notifications[index - 1]["date"])
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Container(
                    height: 33,
                    width: 84,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Kolors.kPrimaryLight),
                    child: Center(
                      child: Text(
                        notifications[index]["date"],
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                    ),
                  ),
                ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.blue.withOpacity(0.2) : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Icon(Icons.calendar_today, color: Colors.white),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              notifications[index]["title"],
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit...",
                              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 12),
                      Text(
                        notifications[index]["time"],
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
