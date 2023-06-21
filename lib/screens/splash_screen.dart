import 'dart:developer';

//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wechat/screens/auth/login_screen.dart';
import 'package:wechat/screens/home_screen.dart';
//import 'package:wechat/api/apis.dart';
//import 'package:wechat/screens/home_screen.dart';

import '../../main.dart';
import '../api/apis.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 2000), () {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
      if (APIs.auth.currentUser!= null) {
     
        log('\nUser:${APIs.auth.currentUser}');
        //log('\nUserAdditionalInfo:${FirebaseAuth.instance.currentUser.additionalUserInfo}');
                Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const HomeScreen()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const LoginScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      //mq = MediaQuery.of(context).size;
      appBar: AppBar(
        title: const Text('We Chat'),
      ),
      body: Stack(children: [
        Positioned(
            top: mq.height * .15,
            right: mq.width * .25,
            //left: mq.width * .25,
            width: mq.width * .5,
            //duration: const Duration(seconds: 1),
            child: Image.asset('images/chat (1).png')),
        Positioned(
            bottom: mq.height * .15,
            //left: mq.width * .25,
            width: mq.width,
            child: const Text('Connect with the world ❤️❤️',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16, color: Colors.black, letterSpacing: .5))),
      ]),
    );
  }
}
