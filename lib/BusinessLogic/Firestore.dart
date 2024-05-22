import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreManager {

  static Future<List<List<dynamic>>> getCompletedListings() async {
    List<List<dynamic>> listings = [];
    var rawData = await FirebaseFirestore.instance.collection('listings').where('status', isNotEqualTo: 'ongoing').get();

    print(rawData.docs);

    for (int i = 0; i < rawData.docs.length; i++) {
      listings.add([
        rawData.docs[i].id,
        rawData.docs[i].data()["customerName"].toString(),
        rawData.docs[i].data()["customerPhone"].toString(),
        rawData.docs[i].data()["truckType"].toString(),
        rawData.docs[i].data()["cargoType"].toString(),
        rawData.docs[i].data()["cargoCost"].toString(),
        rawData.docs[i].data()["cargoWeight"].toString(),
        rawData.docs[i].data()["pickupLocation"],
        rawData.docs[i].data()["dropoffLocation"],
        rawData.docs[i].data()["additionalInformation"].toString(),
        rawData.docs[i].data()["estimatedFare"].toString(),
        rawData.docs[i].data()["packerRequired"].toString(),
        rawData.docs[i].data()["moverRequired"].toString(),
        rawData.docs[i].data()["rideWithDriver"].toString(),
        rawData.docs[i].data()["driverAssigned"].toString(),
        rawData.docs[i].data()["pickupName"].toString(),
        rawData.docs[i].data()["dropoffName"].toString(),
        rawData.docs[i].data()["timePlaced"],
        rawData.docs[i].data()["timeDue"],
        rawData.docs[i].data()["driverLocation"],
        rawData.docs[i].data()["status"],
      ]
      );
    }
    return listings;
  }

  static Future<List<List<dynamic>>> getActiveListings() async {
    List<List<dynamic>> listings = [];
    var rawData = await FirebaseFirestore.instance.collection('listings').where('status', isEqualTo: 'ongoing').get();
    for (int i = 0; i < rawData.docs.length; i++) {
      listings.add([
        rawData.docs[i].id,
        rawData.docs[i].data()["customerName"].toString(),
        rawData.docs[i].data()["customerPhone"].toString(),
        rawData.docs[i].data()["truckType"].toString(),
        rawData.docs[i].data()["cargoType"].toString(),
        rawData.docs[i].data()["cargoCost"].toString(),
        rawData.docs[i].data()["cargoWeight"].toString(),
        rawData.docs[i].data()["pickupLocation"],
        rawData.docs[i].data()["dropoffLocation"],
        rawData.docs[i].data()["additionalInformation"].toString(),
        rawData.docs[i].data()["estimatedFare"].toString(),
        rawData.docs[i].data()["packerRequired"].toString(),
        rawData.docs[i].data()["moverRequired"].toString(),
        rawData.docs[i].data()["rideWithDriver"].toString(),
        rawData.docs[i].data()["driverAssigned"].toString(),
        rawData.docs[i].data()["pickupName"].toString(),
        rawData.docs[i].data()["dropoffName"].toString(),
        rawData.docs[i].data()["timePlaced"],
        rawData.docs[i].data()["timeDue"],
        rawData.docs[i].data()["driverLocation"],
        rawData.docs[i].data()["status"],
      ]
      );
    }
    return listings;
  }

  static getAllUsersData() async {
    List<List<dynamic>> users = [];
    var rawData = await FirebaseFirestore.instance.collection('users').get();
    for (int i = 0; i < rawData.docs.length; i++) {
      users.add([
        rawData.docs[i].id,
        rawData.docs[i].data()["userID"].toString(),
        rawData.docs[i].data()["name"].toString(),
        rawData.docs[i].data()["CNIC"].toString(),
        rawData.docs[i].data()["location"].toString(),
        rawData.docs[i].data()["phone"].toString(),
        rawData.docs[i].data()["isDriver"].toString(),
      ]
      );
    }
    return users;
  }

  static getAllDriversData() async {
    List<List<dynamic>> users = [];
    var rawData = await FirebaseFirestore.instance.collection('users').where('isDriver', isEqualTo: true).get();
    for (int i = 0; i < rawData.docs.length; i++) {
      users.add([
        rawData.docs[i].id,
        rawData.docs[i].data()["userID"].toString(),
        rawData.docs[i].data()["name"].toString(),
        rawData.docs[i].data()["CNIC"].toString(),
        rawData.docs[i].data()["location"].toString(),
        rawData.docs[i].data()["phone"].toString(),
        rawData.docs[i].data()["isDriver"].toString(),
      ]
      );
    }
    return users;
  }

  static Future<List> getDriverData(String UID) async {
    List<dynamic> driverData = [];
    var rawData = await FirebaseFirestore.instance.collection('drivers').where('userID', isEqualTo: UID).get();
    driverData.add(rawData.docs[0].data()["licence"]);
    driverData.add(rawData.docs[0].data()["truckType"]);
    driverData.add(rawData.docs[0].data()["truckNumber"]);
    return driverData;
  }
}