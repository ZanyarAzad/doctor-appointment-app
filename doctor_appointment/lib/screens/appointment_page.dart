import 'package:flutter/material.dart';

import '../utils/config.dart';
import '../widgets/appointment_card.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

enum FilterStatus { upcoming, complete, cancel }

class _AppointmentPageState extends State<AppointmentPage> {
  FilterStatus status = FilterStatus.upcoming;
  Alignment alignment = Alignment.centerLeft;
  List<dynamic> schedules = [
    {
      'doctor_name': 'Dr. Emily Johnson',
      'doctor_profile': 'assets/doctor_4.jpg',
      'category': 'General',
      'status': FilterStatus.upcoming,
    },
    {
      'doctor_name': 'Dr. Michael Davis',
      'doctor_profile': 'assets/doctor_5.jpg',
      'category': 'Medical',
      'status': FilterStatus.upcoming,
    },
    {
      'doctor_name': 'Dr. Sarah Wilson',
      'doctor_profile': 'assets/doctor_6.jpg',
      'category': 'Medical',
      'status': FilterStatus.complete,
    },
    {
      'doctor_name': 'Dr. Eva',
      'doctor_profile': 'assets/doctor_7.jpg',
      'category': 'Medical',
      'status': FilterStatus.cancel,
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<dynamic> filteredSchedules = schedules.where((var schedule) {
      // switch (schedule['status']) {
      //   case 'upcoming':
      //     schedule['status'] = FilterStatus.upcoming;
      //     break;
      //   case 'compleate':
      //     schedule['status'] = FilterStatus.complete;
      //     break;
      //   case 'cancel':
      //     schedule['status'] = FilterStatus.cancel;
      //     break;
      // }
      return schedule['status'] == status;
    }).toList();
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Appointment Schedule',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Config.spaceSmall,
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //this is the filter tabs
                    for (FilterStatus filterStatus in FilterStatus.values)
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (filterStatus == FilterStatus.upcoming) {
                                status = FilterStatus.upcoming;
                                alignment = Alignment.centerLeft;
                              } else if (filterStatus ==
                                  FilterStatus.complete) {
                                status = FilterStatus.complete;
                                alignment = Alignment.center;
                              } else if (filterStatus == FilterStatus.cancel) {
                                status = FilterStatus.cancel;
                                alignment = Alignment.centerRight;
                              }
                            });
                          },
                          child: Center(
                            child: Text(filterStatus.name),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              AnimatedAlign(
                alignment: alignment,
                duration: const Duration(milliseconds: 200),
                child: Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Config.primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      status.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Config.spaceSmall,
          Expanded(
            child: ListView.builder(
              itemCount: filteredSchedules.length,
              itemBuilder: ((context, index) {
                var schedule = filteredSchedules[index];
                bool isLastElement = filteredSchedules.length + 1 == index;
                return Card(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: !isLastElement
                      ? const EdgeInsets.only(bottom: 20)
                      : EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(schedule['doctor_profile'])
                              // NetworkImage(
                              //     "http://127.0.0.1:8000${schedule['doctor_profile']}"),
                          
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  schedule['doctor_name'],
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  schedule['category'],
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ScheduleCard(
                          backgroundColor: Colors.grey.shade200,
                          textColor: Config.primaryColor,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {},
                                child: const Text(
                                  'Cancel',
                                  style: TextStyle(color: Config.primaryColor),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Config.primaryColor,
                                ),
                                onPressed: () {},
                                child: const Text(
                                  'Reschedule',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    ));
  }
}
