import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Firebasebatabase {

  final String mainDefaultDB = "https://smartgate-hg-default-rtdb.asia-southeast1.firebasedatabase.app/";


  getallplates() async {
    DataSnapshot data = await FirebaseDatabase(databaseURL: mainDefaultDB)
        .reference()
        .child("plates")
        .once();
    return data.value;
  }

  getjwt() async {
    DataSnapshot data = await FirebaseDatabase(databaseURL: mainDefaultDB)
        .reference()
        .child("jwt")
        .once();
    print(data.value);
    return data.value;
  }

  postblacklisted(String plate) {
    FirebaseDatabase(databaseURL: mainDefaultDB)
        .reference()
        .child("blacklisted/$plate")
        .set({
      "plate": plate,
    });
  }

  saveToken(String token) {
    FirebaseDatabase(databaseURL: mainDefaultDB)
        .reference()
        .child("tokens")
        .set({
      "fcm_token": token,
    });
  }



}
