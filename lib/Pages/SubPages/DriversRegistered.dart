import 'package:shiftus_admin/BusinessLogic/Firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DriversRegistered extends StatefulWidget {
  const DriversRegistered({super.key});

  @override
  State<DriversRegistered> createState() => _DriversRegisteredState();
}

class _DriversRegisteredState extends State<DriversRegistered> {

  List<List<dynamic>> listingsData = [];
  bool listingsLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    listingsData = await FirestoreManager.getAllUsersData();
    setState(() {
      listingsLoaded = true;
    });
  }

  String formatTimestamp(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();
    String formattedDate = DateFormat('dd-MM-yyyy hh:mm:ss a').format(dateTime);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return listingsLoaded ? ListView.builder(
      itemCount: listingsData.length,
      itemBuilder: (context, index) {
        var listing = listingsData[index];
        return Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Text("ID: ", style: TextStyle(color: Colors.black, fontSize: 16)),
                      Text(listing[1].toString(), style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                SizedBox(width: 10,),
                VerticalDivider(width: 1),
                SizedBox(width: 10,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text("Name: ", style: TextStyle(color: Colors.grey, fontSize: 16)),
                          Flexible(child: Text(listing[2].toString(), style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 16))),
                        ],
                      ),
                      Row(
                        children: [
                          Text("CNIC: ", style: TextStyle(color: Colors.grey, fontSize: 16)),
                          Flexible(child: Text(listing[3].toString(), style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 16))),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Phone: ", style: TextStyle(color: Colors.grey, fontSize: 16)),
                          Flexible(child: Text(listing[5].toString(), style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 16))),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10,),
                VerticalDivider(width: 1),
                SizedBox(width: 10,),
                Expanded(
                  child: FutureBuilder<List<dynamic>>(
                    future: FirestoreManager.getDriverData(listing[1].toString()),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text("Loading...", style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 24, fontWeight: FontWeight.bold));
                      } else if (snapshot.hasError) {
                        return Text("Error", style: TextStyle(color: Colors.red, fontSize: 24, fontWeight: FontWeight.bold));
                      } else {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text("License: ", style: TextStyle(color: Colors.grey, fontSize: 16)),
                                Flexible(child: Text(snapshot.data![0].toString(), style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 16))),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Truck Type: ", style: TextStyle(color: Colors.grey, fontSize: 16)),
                                Flexible(child: Text(snapshot.data![1].toString(), style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 16))),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Truck Number: ", style: TextStyle(color: Colors.grey, fontSize: 16)),
                                Flexible(child: Text(snapshot.data![2].toString(), style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 16))),
                              ],
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ) : Center(
      child: CircularProgressIndicator(),
    );
  }
}