import 'package:coding_chellange/views/Dashboard.dart';
import 'package:coding_chellange/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';




class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{

  AnimationController? _animationController;
  Animation<double>? _animation;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      // duration: Duration(milliseconds: 1500),
      duration: const Duration(milliseconds: 1300),
    );
    _animation = CurvedAnimation(
      parent: _animationController!,
      curve: Curves.easeOut,
    );
    _animationController!.forward();


    navigateToNextScreen();

  }

  navigateToNextScreen()async{
    await Future.delayed(Duration(milliseconds: 1500));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Dashboard()));
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        bodyWidget: Container(
          child: Center(
            child: AnimatedBuilder(
              animation: _animation!,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0.0, (1 - _animation!.value) * 300),
                  child: child,
                );
              },
              child: Padding(
                padding: EdgeInsets.only(left: 30,right: 30),
                child: Image.asset(
                  'assets/images/logo.png',
                ),
              ),
            ),
          ),
        ), appBarTitle: null);
  }
}
