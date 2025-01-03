import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:diu_student/core/constants&variables/constants.dart';
import 'package:diu_student/features/home/presentation/pages/homePage.dart';
import 'package:diu_student/features/login%20system/presentation/pages/login.dart';
import 'package:diu_student/features/login%20system/presentation/widgets/textStyle.dart';
import 'package:diu_student/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart';
import 'package:lottie/lottie.dart';
import 'core/MainKamla/get_main_kamla_info.dart';
import 'core/resources/information_repository.dart';
import 'features/home/data/data_sources/local/local_routine.dart';
import 'features/home/data/data_sources/local/local_user_info.dart';
import 'firebase_options.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (_) async {
      final _checkConnection = await Connectivity().checkConnectivity();
      Online = _checkConnection.contains(ConnectivityResult.mobile) || _checkConnection.contains(ConnectivityResult.wifi);
    });
    _initializeApp();
  }

  Future<void> _initializeApp() async{

    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    await Hive.initFlutter();
    var box = await Hive.openBox("routine_box");



    User? pre_user = FirebaseAuth.instance.currentUser;
    bool hasUser = pre_user != null;

    android_info = await DeviceInfoPlugin().androidInfo;



    if(Online && !hasUser){
       get(Uri.parse(routine_api));
    }



    if(hasUser){
      User user = FirebaseAuth.instance.currentUser!;
      var _userInfo = Hive.box("routine_box").get("UserInfo");

      if(_userInfo==null || _userInfo["verified"]==false ){
        hasUser = false;
      }
    }


    if(hasUser){
      Box _box = Hive.box("routine_box");
      Map _info = _box.get("UserInfo");

      await getApiLink(); // Updates API link from backend
      await getUserInfo(); // Gets User information



      //sets user
      UserRole = _info["user"];

      // Gets routine according user information
      if(_info["user"] == "Student"){
        await getRoutineLocally(_info["department"] , "${_info["batch"]}${_info["section"]}", true);
      }
      else{
        await getRoutineLocally(_info["department"] , _info["ti"], false);
      }
    }

    hasUser ?
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context)=> homePage()))
        :
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context)=> loginScreen()));
  }


  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;


    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: h*.02,
        children: [
          // Padding(
          //   padding: EdgeInsets.only(left: w*.1),
          //   child: Container(
          //     height: h>w? h*.3 : w*.3,
          //     child: Image.asset("assets/images/logo.png"),
          //   ),
          // ),


          Lottie.asset("assets/lottie/Loading1.json",height: h*.3),

          SizedBox(width: w,),
          Text(
            "DAILY DIU",
            style: TextTittleStyle,
          )
        ],
      ),
    );
  }
}
