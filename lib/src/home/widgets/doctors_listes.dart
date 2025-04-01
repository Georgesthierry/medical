import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:medical/common/utils/kcolors.dart';
import 'package:medical/common/widgets/app_style.dart';
import 'package:medical/common/widgets/reusable_text.dart';
import 'package:medical/src/doctors/controlleur/doctor_controller.dart';
import 'package:medical/src/doctors/models/doctor_models.dart';
import 'package:medical/src/doctors/views/doctor_info.dart';
import 'package:medical/src/favorites/controleur/favorite_notifier.dart';
import 'package:provider/provider.dart';

class DoctorsListes extends StatefulWidget {
  const DoctorsListes({super.key});

  @override
  State<DoctorsListes> createState() => _DoctorsListesState();
}

class _DoctorsListesState extends State<DoctorsListes> {
  void initState() {
    super.initState();
    // Chargement initial des docteurs et des favoris
    Future.microtask(() {
      final doctorNotifier = Provider.of<DoctorNotifier>(context, listen: false);
      final favoritesNotifier =
      Provider.of<FavoritesNotifier>(context, listen: false);

      doctorNotifier.fetchDoctors(context);
      favoritesNotifier.fetchFavoriteDoctors(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final doctorNotifier = Provider.of<DoctorNotifier>(context);
    final favoritesNotifier = Provider.of<FavoritesNotifier>(context);
    return SingleChildScrollView(
        child: Container(
      height: 375.h,
      width: 370.w,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: doctorNotifier.isLoading
            ? const Center(child: CircularProgressIndicator())
            : doctorNotifier.doctors.isEmpty
                ? const Center(child: Text("Aucun doctors disponible."))
                : ListView.builder(
                    itemCount: doctorNotifier.doctors.length,
                    itemBuilder: (context, index) {
                      DoctorModel? doctor = doctorNotifier.doctors[index];
                      final isFavorite =
                      favoritesNotifier.isFavorite(doctor.id!);
                      return Padding(
                        padding: const EdgeInsets.only(
                            right: 20.0, left: 20, bottom: 10),
                        child: Container(
                          height: 80.h,
                          width: 300.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17),
                              color: Kolors.kPrimaryLight),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: doctor.photo != null &&
                                          doctor.photo!.isNotEmpty
                                      ? Image.network(
                                          doctor.photo!,
                                          height: 57.h,
                                          width: 57.w,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Image.asset(
                                              'assets/images/doctor_image.png',
                                              // Image par défaut
                                              height: 57.h,
                                              width: 57.w,
                                              fit: BoxFit.cover,
                                            );
                                          },
                                        )
                                      : Image.asset(
                                          'assets/images/doctor_image.png',
                                          // Image par défaut
                                          height: 57.h,
                                          width: 57.w,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 211.w,
                                      height: 39.h,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(13),
                                          color: Kolors.kWhite),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              context
                                                  .push('/doctor/${doctor.id}');
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: ReusableText(
                                                  text: doctor.fullName,
                                                  style: appStyle(
                                                      14,
                                                      Kolors.kPrimary,
                                                      FontWeight.w700)),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: ReusableText(
                                                text: doctor.function,
                                                style: appStyle(
                                                    12,
                                                    Kolors.kDark,
                                                    FontWeight.normal)),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 215.w,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Container(
                                                height: 18.h,
                                                width: 43.w,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            13),
                                                    color: Kolors.kWhite),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Icon(
                                                      Icons.star_border,
                                                      size: 15,
                                                      color: Kolors.kPrimary,
                                                    ),
                                                    ReusableText(
                                                        text: "5",
                                                        style: appStyle(
                                                            10,
                                                            Kolors.kPrimary,
                                                            FontWeight.normal))
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                context.push('/message/${Uri.encodeComponent(doctor.fullName)}');

                                              },
                                              child: Container(
                                                height: 18.h,
                                                width: 43.w,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            13),
                                                    color: Kolors.kWhite),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Icon(
                                                      AntDesign.message1,
                                                      size: 12,
                                                      color: Kolors.kPrimary,
                                                    ),
                                                    ReusableText(
                                                        text: "12",
                                                        style: appStyle(
                                                            10,
                                                            Kolors.kPrimary,
                                                            FontWeight.normal))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              height: 19.h,
                                              width: 19.w,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(13),
                                                  color: Kolors.kWhite),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.question_mark,
                                                    size: 15,
                                                    color: Kolors.kPrimary,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Container(
                                              height: 19,
                                              width: 19,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(13),
                                                  color: Kolors.kWhite),
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    if (isFavorite) {
                                                      favoritesNotifier
                                                          .removeFromFavorites(
                                                          doctor.id!);
                                                    } else {
                                                      favoritesNotifier
                                                          .addToFavorites(
                                                          doctor.id!);
                                                    }

                                                  });
                                                },
                                                child: Icon(
                                                  isFavorite
                                                      ? Icons.favorite
                                                      : Icons.favorite_border,
                                                  size: 12,
                                                  color: Kolors.kPrimary,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }),
      ),
    ));
  }
}
