import 'package:clima/src/api/weather_api_client.dart';
import 'package:clima/src/model/weather.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';



class SendDataToFirestrore {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  WeatherApiClient weatherApiClient;
  List<dynamic> cityName = [];

 locationFunc() async{
  await FirebaseFirestore.instance
        .collection("users")
        .doc(_auth.currentUser.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        final Map <String, dynamic> doc = documentSnapshot.data();
        cityName = List.castFrom(doc["City Name"]).toList();
        }
        else{
          FirebaseFirestore.instance.collection("users").doc(_auth.currentUser.uid).set({
            "City Name": cityName,
          });
        }
    });
 }

  createRecord(String location) async{
    locationFunc();
    cityName.add(location);
     await FirebaseFirestore.instance.collection("users").doc(_auth.currentUser.uid).set({
      'City Name': cityName,
    });
    
  }

 

}