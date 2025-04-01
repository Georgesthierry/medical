import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medical/common/utils/kcolors.dart';
import 'package:medical/common/widgets/app_style.dart';
import 'package:medical/common/widgets/custom_button.dart';
import 'package:medical/common/widgets/email_field.dart';
import 'package:medical/common/widgets/reusable_text.dart';
import 'package:medical/src/schedule/widgets/awailabletimewidget.dart';
import 'package:medical/src/schedule/widgets/smallcalendriewidget.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  late final TextEditingController _userfullnameController =
  TextEditingController();
  bool isYourself = true;
  bool isYourgender = true;
  String fullName = '';
  String age = '';
  String problemDescription = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kolors.kWhite,
      appBar: AppBar(
        backgroundColor: Kolors.kWhite,
        leading: GestureDetector(
            onTap: (){
              context.go('/entrypoint');
            },
            child: Icon(Icons.arrow_back_ios_new,color: Kolors.kPrimary,)),
        title: Row(
          children: [
            Container(
              width: 142.w,
              height: 21.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),color: Kolors.kPrimary
              ),
              child: Center(child: ReusableText(text: "Dr. Olivia Turner, M.D.", style: appStyle(12, Kolors.kWhite, FontWeight.normal))),
            ),
            SizedBox(width: 5.w,),
            Container(
              width: 21.w,
              height: 21.h,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                  color: Kolors.kPrimary),
              child: Icon(Icons.call,size: 15,color: Kolors.kWhite,),
            ),
            SizedBox(width: 5.w,),
            Container(
              width: 21.w,
              height: 21.h,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                  color: Kolors.kPrimary),
              child: Icon(Icons.video_camera_front_outlined,size: 15,color: Kolors.kWhite,),
            ),
            SizedBox(width: 5.w,),
            Container(
              width: 21.w,
              height: 21.h,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                  color: Kolors.kPrimary),
              child: Icon(Icons.message,size: 15,color: Kolors.kWhite,),
            ),
          ],
        ),
        actions: [
          SizedBox(width: 5.w,),
          Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: Row(
              children: [
                Container(
                  width: 21.w,
                  height: 21.h,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      color: Kolors.kPrimaryLight),
                  child: Icon(Icons.question_mark,size: 15,color: Kolors.kPrimary,),
                ),
                SizedBox(width: 5.w,),
                Container(
                  width: 21.w,
                  height: 21.h,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      color: Kolors.kPrimaryLight),
                  child: Icon(Icons.favorite,size: 15,color: Kolors.kPrimary,),
                ),

              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SmallCalendrieWidget(),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: ReusableText(text: "Awailable Time", style: appStyle(18, Kolors.kPrimary, FontWeight.w700)),
            ),
            Container(
              height: 140,
                child: TimeSlotGrid()),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: ReusableText(text: "Awailable Time", style: appStyle(18, Kolors.kPrimary, FontWeight.w700)),
            ),
            Padding(
              padding: const EdgeInsets.only(left:30.0),
              child: Row(
                children: [
                  ChoiceChip(
                    label: Text("Yourself", style: TextStyle(color: isYourself ? Colors.white : Kolors.kGray)),
                    selected: isYourself,
                    selectedColor: Kolors.kPrimary,
                    backgroundColor: Kolors.kWhite,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(color: Kolors.kPrimary),
                    ),
                    onSelected: (bool selected) {
                      setState(() {
                        isYourself = true;
                      });
                    },
                  ),
                  SizedBox(width: 10.w),
                  ChoiceChip(
                    label: Text("Another Person", style: TextStyle(color: !isYourself ? Kolors.kWhite : Kolors.kGray)),
                    selected: !isYourself,
                    selectedColor: Kolors.kPrimary,
                    backgroundColor: Kolors.kWhite,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(color: Kolors.kPrimary),
                    ),
                    onSelected: (bool selected) {
                      setState(() {
                        isYourself = false;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: ReusableText(
                          text: "Full name",
                          style: appStyle(18, Kolors.kDark, FontWeight.normal)),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30),
                  child: EmailTextField(
                    radius: 13.r,
                    controller: _userfullnameController,
                    hintText: 'Nom & Prenoms',
                    backgroundColor: Kolors.kPrimaryLight,
                    showBorder: false,
                  ),
                )
              ],
            ),
            SizedBox(height: 5,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: ReusableText(
                          text: "Age",
                          style: appStyle(20, Kolors.kDark, FontWeight.normal)),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30),
                  child: EmailTextField(
                    radius: 13.r,
                    controller: _userfullnameController,
                    hintText: 'Age',
                    backgroundColor: Kolors.kPrimaryLight,
                    showBorder: false,
                  ),
                )
              ],
            ),
            SizedBox(height: 5,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: ReusableText(
                          text: "Genre",
                          style: appStyle(12, Kolors.kDark, FontWeight.normal)),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Row(
                    children: [
                      ChoiceChip(
                        label: Text("Male",style: TextStyle(color: isYourgender ? Kolors.kWhite : Kolors.kGray)),
                        selected: isYourgender,
                        selectedColor: Kolors.kPrimary,
                        backgroundColor: Kolors.kWhite,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(color: Kolors.kPrimary),
                        ),
                        onSelected: (selected) => setState(() => isYourgender = true),
                      ),
                      SizedBox(width: 10),
                      ChoiceChip(
                        label: Text("Female", style: TextStyle(color: !isYourgender ? Kolors.kWhite : Kolors.kGray)),
                        selected: !isYourgender,
                        selectedColor: Kolors.kPrimary,
                        backgroundColor: Kolors.kWhite,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(color: Kolors.kPrimary),
                        ),
                        onSelected: (selected) => setState(() => isYourgender = false),
                      ),
                    ],
                  ),
                )
                  ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text("Decrire ton probleme"),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(left: 30.0,right: 30),
              child: TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: "Enter Your Problem Here...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18), // Bordure arrondie à 18
                    borderSide: BorderSide(color: Colors.blue, width: 2), // Bordure bleue
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide(color: Colors.blue, width: 2.5), // Bordure plus épaisse en focus
                  ),
                ),
                onChanged: (value) => setState(() => problemDescription = value),
              ),
            ),
            SizedBox(height: 5,),
            Center(
              child: CustomButton(text: 'Enregistrer',onTap: (){
              },radius: 30.r,btnWidth: 300.w,btnHieght: 50.h,btnColor: Kolors.kPrimary,textSize:24,borderColor:Kolors.kWhite),
            ),
        
          ],
        ),
      ),
    );
  }
}
