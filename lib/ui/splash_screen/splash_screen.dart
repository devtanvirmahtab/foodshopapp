import 'package:flutter/material.dart';
import 'package:foodshopapp/ui/auth_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) { 
      Future.delayed(Duration(seconds: 2)).then((value) =>
        Navigator.push(context, MaterialPageRoute(builder: (context)=> LogInScreen()))
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/backsplash.png",),fit: BoxFit.cover),
          color: Colors.white
        ),
        child: Center(child: Text("Food Shop",style: TextStyle(fontSize: 32,fontWeight: FontWeight.w700),)),
      ),
    );
  }
}
