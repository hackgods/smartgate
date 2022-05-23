import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smartgate/screenconfig.dart';
import 'vehicleInfo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api_manager.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' as io;


class VehicleScreen extends StatefulWidget {

  @override
  _VehicleScreenState createState() => _VehicleScreenState();
}

class _VehicleScreenState extends State<VehicleScreen> {
  Future<VehicleModel> _vehicleModel;
  String plateimageurl;

  final myController = TextEditingController();
getData() async {
  _vehicleModel = API_Manager().getDetails();
}

  @override
  void initState() {
    super.initState();
    getData();
    getImage();
  }


  getImage() async {
    final prefs = await SharedPreferences.getInstance();
    plateimageurl = prefs.getString('plateimage');
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black.withOpacity(0.7), //change your color here
          ),
        backgroundColor: Color.fromRGBO(254,240,236,1),
        title: Text("VEHICLE DETAILS", style: TextStyle(fontFamily: 'pSans', fontWeight: FontWeight.w800, fontSize: 24, color: Colors.black.withOpacity(0.7)),)

      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: FutureBuilder<VehicleModel>(
                          future: _vehicleModel,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              var vdata = snapshot.data.data;
                              return Container(
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(7),
                                              border: Border.all(
                                                color: Colors.black54,
                                                width: 1.5,
                                              )),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(vdata.vehicleNumber,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'numberplate',
                                                    fontSize: 26)),
                                          )),
                                    ),
                                    Image.network(
                                        vdata.brandModelMapping.brandIcon,
                                      height: 130,
                                      width: 130,
                                    ),
                                    Text(
                                      "Owner",
                                      style: TextStyle(
                                          fontFamily: 'pSans',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 16.0),
                                      child: Text(
                                          vdata.owner,
                                          style: TextStyle(
                                              fontFamily: 'pSans',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 18)),
                                    ),
                                    Text(
                                      "Model & Make",
                                      style: TextStyle(
                                          fontFamily: 'pSans',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 16.0),
                                      child: Text(
                                        vdata.model,
                                        style: TextStyle(
                                          fontFamily: 'pSans',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),

                                    Text(
                                      "Chassis Number",
                                      style: TextStyle(
                                          fontFamily: 'pSans',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 16.0),
                                      child: Text(
                                        vdata.chassis,
                                        style: TextStyle(
                                          fontFamily: 'pSans',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Text(
                                      "Engine Number",
                                      style: TextStyle(
                                          fontFamily: 'pSans',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 16.0),
                                      child: Text(
                                        vdata.engine,
                                        style: TextStyle(
                                          fontFamily: 'pSans',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Text(
                                      "Vehicle Class",
                                      style: TextStyle(
                                          fontFamily: 'pSans',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 16.0),
                                      child: Text(
                                        vdata.vehicleClass,
                                        style: TextStyle(
                                          fontFamily: 'pSans',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),

                                    Text(
                                      "Registration Date",
                                      style: TextStyle(
                                          fontFamily: 'pSans',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 16.0),
                                      child: Text(
                                        vdata.registrationDate,
                                        style: TextStyle(
                                          fontFamily: 'pSans',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Text(
                                      "Insurance Validity",
                                      style: TextStyle(
                                          fontFamily: 'pSans',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 16.0),
                                      child: Text(
                                        vdata.insuranceDate,
                                        style: TextStyle(
                                          fontFamily: 'pSans',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Text(
                                      "RC Validity",
                                      style: TextStyle(
                                          fontFamily: 'pSans',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 16.0),
                                      child: Text(
                                        vdata.rcStatus,
                                        style: TextStyle(
                                          fontFamily: 'pSans',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),

                                    Text(
                                      "Fuel Type",
                                      style: TextStyle(
                                          fontFamily: 'pSans',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 16.0),
                                      child: Text(
                                        vdata.fuelType,
                                        style: TextStyle(
                                          fontFamily: 'pSans',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Container(
                                        width: 400.0,
                                        height: 200.0,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.cover, image: NetworkImage(plateimageurl)),
                                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            } else
                              return Center(child: CircularProgressIndicator());
                          }),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

