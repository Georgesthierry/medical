import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medical/common/widgets/app_style.dart';
import 'package:provider/provider.dart';

import '../../../common/utils/kcolors.dart';
import '../../../common/widgets/reusable_text.dart';
import '../controlleur/doctor_controller.dart';

class DoctorsList extends StatelessWidget {
  const DoctorsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DoctorNotifier>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return Center(child: CircularProgressIndicator());
        }

        if (provider.doctors.isEmpty) {
          return Center(child: Text("Aucun médecin trouvé."));
        }
        return ListView.builder(
          itemCount: provider.doctors.length,
          itemBuilder: (context, index) {
            final doctor = provider.doctors[index];
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              height: 131.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.blue.shade50,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset("assets/images/doctor_image.png", height: 107, width: 107),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(doctor.fullName, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.blue)),
                        Text(doctor.function, style: TextStyle(fontSize: 15, color: Colors.black54)),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => context.go("/doctor/${doctor.id}"),
                              child: Container(
                                height: 22,
                                width: 46,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  color: Colors.blue,
                                ),
                                child: Center(child: Text("Info", style: TextStyle(fontSize: 15, color: Colors.white))),
                              ),
                            ),
                            SizedBox(width: 5),
                            Icon(Icons.calendar_month_outlined, color: Kolors.kPrimary, size: 20),
                            SizedBox(width: 5),
                            Icon(Icons.info_outline, color: Kolors.kPrimary, size: 20),
                            SizedBox(width: 5),
                            Icon(Icons.question_mark, color: Kolors.kPrimary, size: 20),
                            SizedBox(width: 5),
                            Icon(
                              doctor.isFavorite ? Icons.favorite : Icons.favorite_border,
                              color: Kolors.kPrimary,
                              size: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
