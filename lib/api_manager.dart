import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'vehicleInfo.dart';
import 'strings.dart';


class API_Manager {
  Future<VehicleModel> getDetails() async {

    final prefs = await SharedPreferences.getInstance();

    final counter = prefs.getString('counter');
    final jwt = prefs.getString('jwt');

    var client = http.Client();
    var vehicleModel = null;

    try {
      var response = await client.get(Uri.https('vehicle.parkplus.io', '/api/v1/vehicle-service/search-vehicle/', { "vehicle_number" : counter }), headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "authorization": jwt,
        "client-secret": Strings.csecret,
        "client-id": Strings.cid
      });
      print(counter);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        vehicleModel = VehicleModel.fromJson(jsonMap);
        print(jsonString);
      }
    } catch (Exception) {
      return vehicleModel;
    }

    return vehicleModel;
  }
}

