

import 'package:flutter/material.dart';
import 'package:medical/src/home/controlleur/schedulecontroller.dart';
import 'package:provider/provider.dart';

class ScheduleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ScheduleProvider>(context);

    return Expanded(
      child: ListView.builder(
        itemCount: provider.scheduledAppointments.length,
        itemBuilder: (context, index) {
          String hour = provider.scheduledAppointments.keys.elementAt(index);
          Appointment? appointment = provider.scheduledAppointments[hour];

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: Container(
              height: 60,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: appointment != null ? Colors.blue.shade100 : Colors.grey.shade300,
              ),
              child: appointment != null
                  ? _buildAppointmentCard(hour, appointment, provider)
                  : _buildEmptySlot(hour, provider),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAppointmentCard(String hour, Appointment appointment, ScheduleProvider provider) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 5),
              child: Text(
                appointment.doctor,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      height: 20,
                      width: 20,
                      color: Colors.white,
                      child: Icon(Icons.check, size: 10, color: Colors.green),
                    ),
                  ),
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: () => provider.cancelAppointment(hour),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        height: 20,
                        width: 20,
                        color: Colors.white,
                        child: Icon(Icons.close, size: 10, color: Colors.red),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            appointment.description,
            style: TextStyle(fontSize: 11, color: Colors.black),
          ),
        ),
      ],
    );
  }

  Widget _buildEmptySlot(String hour, ScheduleProvider provider) {
    return GestureDetector(
      onTap: () => provider.scheduleAppointment(
        hour,
        Appointment(
          doctor: "Dr. Olivia Turner, M.D.",
          description: "Treatment and prevention of skin and photodermatitis.",
        ),
      ),
      child: Center(
        child: Text(
          "---------------",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
      ),
    );
  }
}
