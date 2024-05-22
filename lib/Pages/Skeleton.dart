import 'package:shiftus_admin/Pages/SubPages/CompletedlRides.dart';
import 'package:shiftus_admin/Pages/SubPages/DriversRegistered.dart';
import 'package:shiftus_admin/Pages/SubPages/UsersRegistered.dart';
import 'package:flutter/material.dart';

import 'SubPages/OngoingRides.dart';

class Skeleton extends StatefulWidget {
  const Skeleton({super.key});

  @override
  State<Skeleton> createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton> {

  int _stateIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
        children: [
          Container(
            width: 300,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent,
            ),
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Text("Admin Panel",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28
                  ),
                ),
                SizedBox(height: 20,),
                SideButtons(0, Icons.play_arrow, "Ongoing Rides"),
                SizedBox(height: 10,),
                SideButtons(1, Icons.stop, "Completed Rides"),
                SizedBox(height: 10,),
                SideButtons(2, Icons.person, "Users Registered"),
                SizedBox(height: 10,),
                SideButtons(3, Icons.drive_eta, "Drivers Registered"),
              ],
            ),
          ),
          Expanded(
            child: IndexedStack(index: _stateIndex, children: <Widget>[
              // These are mandatory pages, DO NOT ALTER
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Visibility(visible: _stateIndex == 0,
                    child: OngoingRides()
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Visibility(visible: _stateIndex == 1,
                    child: CompletedRides()
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Visibility(visible: _stateIndex == 2,
                    child: const UsersRegistered()
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Visibility(visible: _stateIndex == 3,
                    child: const DriversRegistered()
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  SideButtons(int index, IconData iconData, String title) {
    return InkWell(
      onTap: () {
        setState(() {
          _stateIndex = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Icon(iconData, color: Colors.white,),
            SizedBox(width: 5,),
            Text(title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
