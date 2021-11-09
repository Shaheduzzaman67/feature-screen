///
/// [Author] Alex (https://github.com/Alex525)
/// [Date] 2020-05-31 21:36
///
import 'dart:async';

import 'package:animatedtransition/home_page.dart';
import 'package:animatedtransition/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_cube/flutter_cube.dart';



class SplashPage extends StatefulWidget {
  const SplashPage();

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {


  late AnimationController animationController;
  late Animation degOneTranslationAnimation,
      degTwoTranslationAnimation,
      degFourTranslationAnimation,
      degThreeTranslationAnimation;
  late Animation rotationAnimation;
  late Object jet;
  late Object shark;

  var isShow = true;

  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  double getRadiansFromDegreeChair(double degree) {
    double unitRadian = 14.295779513;
    return degree / unitRadian;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    shark = Object(fileName: "assets/jet/office-chair.obj");
    shark.rotation.setValues(0, -90, 0);
    shark.updateTransform();

    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1800));

    animationController.forward();

    degOneTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.2), weight: 75.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.2, end: 1.0), weight: 25.0),
    ]).animate(animationController);
    degTwoTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.4), weight: 55.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.4, end: 1.0), weight: 45.0),
    ]).animate(animationController);
    degThreeTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.75), weight: 35.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.75, end: 1.0), weight: 65.0),
    ]).animate(animationController);
    degFourTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.88), weight: 25.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 2.10, end: 1.0), weight: 75.0),
    ]).animate(animationController);
    rotationAnimation = Tween<double>(begin: 180.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));
    super.initState();
    animationController.addListener(() {
      setState(() {});
    });

    startTime();
    /*SchedulerBinding.instance?.addPostFrameCallback(
      (Duration _) {
        Future<void>.delayed(
          const Duration(seconds: 20),
          () {
            Navigator.of(context).pushReplacement(
              PageRouteBuilder<void>(
                pageBuilder: (_, __, ___) =>  HomePage(),
                transitionsBuilder: (
                  _,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  Widget child,
                ) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                transitionDuration: const Duration(seconds: 2),
              ),
            );
          },
        );
      },
    );*/
  }

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }
  void navigationPage() {
    isShow =false;

    //var _duration = new Duration(milliseconds: 500);

    //Timer(_duration, close);

  }
  close(){
    animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          child: Hero(
            tag: 'LOGO',
            child: Stack(
              children: <Widget>[
                Positioned(
                    right: size.width* 0.4,
                    bottom: size.height *0.15,
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: <Widget>[
                        IgnorePointer(
                          child: Container(
                            color: Colors.transparent,
                            height: 300.0,
                            width: 300.0,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset.fromDirection(getRadiansFromDegree(270),
                              degOneTranslationAnimation.value * 160),
                          child: Transform(
                            transform: Matrix4.rotationZ(
                                getRadiansFromDegree(rotationAnimation.value))
                              ..scale(degOneTranslationAnimation.value),
                            alignment: Alignment.center,
                            child: CircularButton(
                              color: Colors.blue,
                              width: 50,
                              height: 50,
                              icon: Icons.add
                            ),
                          ),
                        ),


                        Transform.translate(
                          offset: Offset.fromDirection(getRadiansFromDegree(225),
                              degTwoTranslationAnimation.value * 160),
                          child: Transform(
                            transform: Matrix4.rotationZ(
                                getRadiansFromDegree(rotationAnimation.value))
                              ..scale(degTwoTranslationAnimation.value),
                            alignment: Alignment.center,
                            child: CircularButton(
                              color: Colors.black,
                              width: 50,
                              height: 50,
                              icon: Icons.camera_alt,
                            ),
                          ),
                        ),


                        Transform.translate(
                          offset: Offset.fromDirection(getRadiansFromDegree(180),
                              degThreeTranslationAnimation.value * 160),
                          child: Transform(
                            transform: Matrix4.rotationZ(
                                getRadiansFromDegree(rotationAnimation.value))
                              ..scale(degThreeTranslationAnimation.value),
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: (){
                                animationController.reverse();

                                Future<void>.delayed(
                                  const Duration(seconds: 2),
                                      () {
                                    Navigator.of(context).pushReplacement(
                                      PageRouteBuilder<void>(
                                        pageBuilder: (_, __, ___) =>  HomePage(),
                                        transitionsBuilder: (
                                            _,
                                            Animation<double> animation,
                                            Animation<double> secondaryAnimation,
                                            Widget child,
                                            ) {
                                          return FadeTransition(
                                            opacity: animation,
                                            child: child,
                                          );
                                        },
                                        transitionDuration: const Duration(seconds: 2),
                                      ),
                                    );
                                  },
                                );

                              },
                              child: CircularButton(
                                color: Colors.orangeAccent,
                                width: 50,
                                height: 50,
                                icon: Icons.person,
                              ),
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset.fromDirection(getRadiansFromDegree(310),
                              degThreeTranslationAnimation.value * 160),
                          child: Transform(
                            transform: Matrix4.rotationZ(
                                getRadiansFromDegree(rotationAnimation.value))
                              ..scale(degFourTranslationAnimation.value),
                            alignment: Alignment.center,
                            child: CircularButton(
                              color: Colors.orangeAccent,
                              width: 50,
                              height: 50,
                              icon: Icons.person,
                            ),
                          ),
                        ),
                        Transform(
                            transform: Matrix4.rotationY(
                                getRadiansFromDegreeChair(rotationAnimation.value)),
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: (){
                                if (animationController.isCompleted) {
                                  animationController.reverse();
                                } else {
                                  animationController.forward();
                                }
                              },
                              child: Container(
                                height: 100,
                                width: 100,
                                //decoration: BoxDecoration( shape: BoxShape.circle),
                                child: Cube(
                                  interactive: false,
                                  onSceneCreated: (Scene scene) {
                                    scene.world.add(shark);
                                    scene.camera.zoom = 10;
                                  },
                                ),
                              ),
                            )

                          /*                      CircularButton(
                            color: Colors.red,
                            width: 60,
                            height: 60,
                            icon: Icon(
                              Icons.menu,
                              color: Colors.white,
                            ),
                            onClick: (){
                              if (animationController.isCompleted) {
                                animationController.reverse();
                              } else {
                                animationController.forward();
                              }
                            },
                          ),*/
                        )
                      ],
                    )),

                //Visibility(visible: isShow ,child: Container(color: Colors.transparent, width: size.width, height: size.height,))
              ],
            ),
          ),
        ));
  }
}


class CircularButton extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final IconData icon;


  CircularButton(
      {required this.color, required this.width, required this.height, required this.icon, });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      width: width,
      height: height,
      child: Icon(icon, color: Colors.white,),
    );
  }
}
