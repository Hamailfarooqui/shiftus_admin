import 'package:shiftus_admin/BusinessLogic/Firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CompletedRides extends StatefulWidget {
  const CompletedRides({super.key});

  @override
  State<CompletedRides> createState() => _OngoingRidesState();
}

class _OngoingRidesState extends State<CompletedRides> {

  List<List<dynamic>> listingsData = [];
  bool listingsLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  Future<String> loadUserName(String driverID) async {
    var rawData = await FirebaseFirestore.instance.collection('users').where('userID', isEqualTo: driverID).get();
    return rawData.docs[0].data()["name"].toString();
  }

  loadData() async {
    listingsData = await FirestoreManager.getCompletedListings();
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
        String driverName = "Loading";
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
            child: Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text("Amount: ", style: TextStyle(color: Colors.black, fontSize: 32)),
                              Text(listing[10].toString(), style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 32, fontWeight: FontWeight.bold)),
                              Text(" PKR", style: TextStyle(color: Colors.black, fontSize: 32)),
                            ],
                          ),
                          Row(
                            children: [
                              Text(formatTimestamp(listing[17]), style: TextStyle(color: Colors.grey[800], fontSize: 16))
                            ],
                          ),
                          Divider(),
                          Row(
                            children: [
                              Text("Driver Name: ", style: TextStyle(color: Colors.black, fontSize: 24)),
                              FutureBuilder<String>(
                                future: loadUserName(listing[14].toString()),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState == ConnectionState.waiting) {
                                    return Text("Loading...", style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 24, fontWeight: FontWeight.bold));
                                  } else if (snapshot.hasError) {
                                    return Text("Error", style: TextStyle(color: Colors.red, fontSize: 24, fontWeight: FontWeight.bold));
                                  } else {
                                    return Text(snapshot.data ?? "Unknown", style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 24, fontWeight: FontWeight.bold));
                                  }
                                },
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text("ID: " + listing[14].toString(), style: TextStyle(color: Colors.grey[800], fontSize: 16)),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Text("Customer Name: ", style: TextStyle(color: Colors.black, fontSize: 24)),
                              Text(listing[1].toString(), style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 24, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Row(
                            children: [
                              Text("ID: " + listing[14].toString(), style: TextStyle(color: Colors.grey[800], fontSize: 16)),
                            ],
                          ),
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
                              Text("Truck Type: ", style: TextStyle(color: Colors.grey, fontSize: 16)),
                              Flexible(child: Text(listing[3].toString(), style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 16))),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Text("Cargo Type: ", style: TextStyle(color: Colors.grey, fontSize: 16)),
                              Flexible(child: Text(listing[4].toString(), style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 16))),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Text("Cargo Cost: ", style: TextStyle(color: Colors.grey, fontSize: 16)),
                              Flexible(child: Text(listing[5].toString(), style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 16))),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Text("Cargo Weight: ", style: TextStyle(color: Colors.grey, fontSize: 16)),
                              Flexible(child: Text(listing[6].toString(), style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 16))),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Text("Additional Information: ", style: TextStyle(color: Colors.grey, fontSize: 16)),
                              Flexible(child: Text(listing[9].toString(), style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 16))),
                            ],
                          ),
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
                              Text("From: ", style: TextStyle(color: Colors.grey, fontSize: 16)),
                              Flexible(child: Text(listing[15].toString(), style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 16))),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Text("From: ", style: TextStyle(color: Colors.grey, fontSize: 16)),
                              Flexible(child: Text(listing[16].toString(), style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 16))),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Divider(),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Text("Ride With Driver: ", style: TextStyle(color: Colors.grey, fontSize: 16)),
                              Flexible(child: Text(listing[13].toString(), style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 16))),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Text("Packer Required: ", style: TextStyle(color: Colors.grey, fontSize: 16)),
                              Flexible(child: Text(listing[11].toString(), style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 16))),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Text("Mover Required: ", style: TextStyle(color: Colors.grey, fontSize: 16)),
                              Flexible(child: Text(listing[12].toString(), style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 16))),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: () {
                        FirebaseFirestore.instance.collection('listings').doc(listing[0]).delete();
                        setState(() {
                          listingsData.removeAt(index);
                        });
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(100)
                        ),
                        child: Center(
                          child: Icon(Icons.delete, color: Colors.white,),
                        ),
                      ),
                    ),
                  ),
                )
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