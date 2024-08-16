import 'package:berita_flutter/home.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  gotoMain() async {
    await Future.delayed(Duration(seconds: 3));{
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    }
}

@override
  void initState() {
    gotoMain();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRicpdzrWwLONLomdudqLmFzFywWzU7OulMug&s",
                width: 100,
                height: 120,
              ),
              CircularProgressIndicator(),
            ]),
      ),
    );
  }
}
