import 'package:flutter/material.dart';

import '../utils/config.dart';

class AppointmentCard extends StatefulWidget {
  // AppointmentCard({Key? key, required this.doctor, required this.color})
  //     : super(key: key);

  // final Map<String, dynamic> doctor;
  // final Color color;

  @override
  State<AppointmentCard> createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<AppointmentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Config.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              //insert Row here
              Row(
                children: [
                  CircleAvatar(
                      backgroundImage: AssetImage('assets/doctor_1.jpg')
                      // NetworkImage(
                      //     "http://127.0.0.1:8000${widget.doctor['doctor_profile']}"), //insert doctor profile
                      ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Dr JohnDoy',
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        'Dental',
                        style: const TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ],
              ),
              Config.spaceSmall,
              // Schedule info here
              ScheduleCard(backgroundColor: Colors.grey, textColor: Colors.white
                  // appointment: widget.doctor['appointments'],
                  ),
              Config.spaceSmall,
              //action button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () {
                        // showDialog(
                        //     context: context,
                        //     builder: (context) {
                        //       return RatingDialog(
                        //           initialRating: 1.0,
                        //           title: const Text(
                        //             'Rate the Doctor',
                        //             textAlign: TextAlign.center,
                        //             style: TextStyle(
                        //               fontSize: 25,
                        //               fontWeight: FontWeight.bold,
                        //             ),
                        //           ),
                        //           message: const Text(
                        //             'Please help us to rate our Doctor',
                        //             textAlign: TextAlign.center,
                        //             style: TextStyle(
                        //               fontSize: 15,
                        //             ),
                        //           ),
                        //           image: const FlutterLogo(
                        //             size: 100,
                        //           ),
                        //           submitButtonText: 'Submit',
                        //           commentHint: 'Your Reviews',
                        //           onSubmitted: (response) async {
                        //             final SharedPreferences prefs =
                        //                 await SharedPreferences.getInstance();
                        //             final token =
                        //                 prefs.getString('token') ?? '';

                        //             final rating = await DioProvider()
                        //                 .storeReviews(
                        //                     response.comment,
                        //                     response.rating,
                        //                     widget.doctor['appointments']
                        //                         ['id'], //this is appointment id
                        //                     widget.doctor[
                        //                         'doc_id'], //this is doctor id
                        //                     token);

                        //             //if successful, then refresh
                        //             if (rating == 200 && rating != '') {
                        //               MyApp.navigatorKey.currentState!
                        //                   .pushNamed('main');
                        //             }
                        //           });
                        //     });
                      },
                      child: const Text(
                        'Completed',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  // const ScheduleCard({Key? key, required this.appointment}) : super(key: key);
  // final Map<String, dynamic> appointment;
  final Color backgroundColor;
  final Color textColor;
  const ScheduleCard({required this.backgroundColor, required this.textColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.calendar_today,
            color: textColor,
            size: 15,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            // '${appointment['day']}, ${appointment['date']}',
            'Saturday, 5/6/2001',
            style: TextStyle(
              color: textColor,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Icon(
            Icons.access_alarm,
            color: textColor,
            size: 17,
          ),
          const SizedBox(
            width: 5,
          ),
          Flexible(
              child: Text(
            // appointment['time'],
            "4:00 PM",
            style: TextStyle(
              color: textColor,
            ),
          ))
        ],
      ),
    );
  }
}
