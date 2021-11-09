///
/// [Author] Alex (https://github.com/Alex525)
/// [Date] 2020-05-31 21:38
///
import 'package:animatedtransition/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cube/flutter_cube.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Object shark;

  final PageController controller = PageController();
  int currentIndex = 0;

  @override
  void initState() {
    shark = Object(fileName: "assets/jet/office-chair.obj");
    shark.rotation.setValues(0, 180, 0);
    shark.updateTransform();
    super.initState();
    controller.addListener(pageControllerListener);
  }

  void selectIndex(int index) {
    if (index == currentIndex) {
      return;
    }
    controller.animateToPage(
      index,
      duration: kThemeAnimationDuration,
      curve: Curves.easeInOut,
    );
  }

  void pageControllerListener() {
    final int? currentPage = controller.page?.round();
    if (currentPage != null && currentPage != currentIndex) {
      currentIndex = currentPage;
      if (mounted) {
        setState(() {});
      }
    }
  }

  Widget get header => Container(
        margin: const EdgeInsetsDirectional.only(top: 10.0),
        height: 90.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.5,
              child: Hero(
                tag: 'LOGO',
                child: Container(
                  child: Cube(
                    onSceneCreated: (Scene scene) {
                      scene.world.add(shark);
                      scene.camera.zoom = 10;
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value:  SystemUiOverlayStyle.light,

      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("This is secound page", style: TextStyle(
                color: Colors.black,
                fontSize: 20
              ),),
              header,
            ],
          ),
        ),
      ),
    );
  }
}
