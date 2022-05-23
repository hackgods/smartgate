import 'dart:convert';
import 'package:expansion_card/expansion_card.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_expanded_tile/tileController.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartgate/FadeAnimation.dart';
import 'package:smartgate/FirebaseDatabase.dart';
import 'package:smartgate/alertbox.dart';
import 'package:smartgate/allVehicle.dart';
import 'package:smartgate/strings.dart';
import 'package:smartgate/textfield.dart';
import 'Services.dart';
import 'Users.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'colors.dart';
import 'package:http/http.dart' as http;

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    'This channel is used for important notifications.', // description
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A bg message just showed up :  ${message.messageId}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  runApp(MainApp());
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
}


class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Smart GATE",
      theme: new ThemeData(scaffoldBackgroundColor: AppColors.primaryColor),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final String mainDefaultDB = "https://smartgate-hg-default-rtdb.asia-southeast1.firebasedatabase.app/";
  var searchplate = TextEditingController();

  String jwt;

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channel.description,
                color: AppColors.primaryColor,
                playSound: true,
                icon: '@mipmap/ic_launcher',
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(notification.body)],
                  ),
                ),
              );
            });
      }
    });

    FirebaseMessaging.instance.getToken().then((String token) {
      print("FCM TOKEN");
      Firebasebatabase().saveToken(token);
    });

  }



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Padding(
        padding: const EdgeInsets.all(8.0),
    child: Text("SMART GATE", style: TextStyle(fontFamily: 'pSans', fontWeight: FontWeight.w800, fontSize: 24, color: Colors.black.withOpacity(0.7)),)
    )
    ],
        ),
    ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: FirebaseAnimatedList(
          query: FirebaseDatabase(databaseURL: mainDefaultDB)
              .reference()
              .child("plates"),
          itemBuilder: (context,DataSnapshot snapshot, Animation<double> animation, int index) {
            Map data = snapshot.value;

            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: FadeAnimation(
                0.3, Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.0),
                  ),

                  color: AppColors.accentColor,
                  elevation: 9,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        title: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(data['plate'],style: TextStyle(fontSize: 22, fontFamily: 'pSans', fontWeight: FontWeight.w800, color: Colors.white.withOpacity(0.9)),),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(data['timestamp'].toString(),style: TextStyle(fontSize: 16, fontFamily: 'pSans', fontWeight: FontWeight.w400, color: Colors.white),),
                        ),
                        onTap: () async {
                          Navigator.push(context, new MaterialPageRoute(
                              builder: (context) => VehicleScreen()
                          ));
                          final prefs = await SharedPreferences.getInstance();
                          prefs.setString('counter', data['plate']);
                          prefs.setString('plateimage', data['url']);
                          var client = http.Client();
                          try {
                            /*
                            var jwtResp = await client.get(Uri.http(Strings.myIP, '/generatejwt.php'));
                            if (jwtResp.statusCode == 200) {
                              var resp = jwtResp.body;
                              print(resp);
                              prefs.setString('jwt', resp);
                            }
                             */
                            jwt = await Firebasebatabase().getjwt();
                            prefs.setString('jwt', jwt);
                          } catch (Exception) {

                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.black.withOpacity(0.7),
        splashColor: Colors.black,
        onPressed: (){
          showDialog(
            barrierDismissible: true,
            context: context,
            builder: (_) => AlertBox(
              title: "Enter Blacklist Plate Number",
              subtitle: TextFieldWidget(
                txtController: searchplate,
                text: 'KL01S666',
                maxLength: 10,
                autofocus: true,
              ),
              yes: true,
              no: false,
              yesText: "Search",
              yesFunc: () async {
                Firebasebatabase().postblacklisted(searchplate.text.toUpperCase());
                Navigator.pop(_);
                searchplate.clear();

              },
            ),
          );
        },
      ),

    );
  }
}

