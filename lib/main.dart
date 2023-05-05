import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RotatingContainer(
          widgets: [
            StackedModel(
                bottomChild: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        "Girl 1",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "She/Her",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "from Mubmbai",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                img:
                    "https://www.morningpic.com/wp-content/uploads/2022/12/1_Girls-Dp-1024x1024.jpg"),
            StackedModel(
                bottomChild: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        "Girl 2",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "She/Her",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "from Mubmbai",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                img:
                    "https://funylife.in/wp-content/uploads/2022/11/20221105_171626-1024x1024.jpg"),
            StackedModel(
                bottomChild: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        "Girl 3",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "She/Her",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "from Mubmbai",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                img:
                    "https://dp.profilepics.in/profile_pictures/real-desi-girls/desi-girl-dp-pic-16.jpg")
          ],
          onAccept: () {
            print("Accept");
          },
          onReject: () {
            print("Reject");
          },
          onLike: () {
            print("Like");
          },
        ),
      ),
    );
  }
}

class RotatingContainer extends StatefulWidget {
  final VoidCallback onReject;
  final VoidCallback onAccept;
  final VoidCallback onLike;
  final List<StackedModel> widgets;
  const RotatingContainer(
      {super.key,
      required this.widgets,
      required this.onAccept,
      required this.onReject,
      required this.onLike});

  @override
  RotatingContainerState createState() => RotatingContainerState();
}

class RotatingContainerState extends State<RotatingContainer>
    with SingleTickerProviderStateMixin {
  double _translateX = 0.0;
  double _translateY = 0.0;
  int currentIndex = 0;
  double tillShow = 200;
  double tillShowY = 300;
  double containerWidth = 300;
  double containerHeight = 500;
  double angleOfCardRotation = 0.2;
  double rotateCradTill = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onPanUpdate: (details) {
            setState(() {
              if (_translateY <= 0 &&
                  details.delta.dy < 0 &&
                  _translateX == 0) {
                _translateY += details.delta.dy;
              }
              if (_translateY <= 0 &&
                  details.delta.dy > 0 &&
                  _translateX == 0) {
                _translateY += details.delta.dy;
              } else if (_translateX <= 0.0 &&
                  details.delta.dx < 0 &&
                  _translateY == 0) {
                _translateX += details.delta.dx;
              } else if (_translateX >= 0.0 &&
                  details.delta.dx > 0 &&
                  _translateY == 0) {
                _translateX += details.delta.dx;
              } else if (_translateX >= 0.0 &&
                  details.delta.dx < 0 &&
                  _translateY == 0) {
                _translateX += details.delta.dx;
              } else if (_translateX <= 0.0 &&
                  details.delta.dx > 0 &&
                  _translateY == 0) {
                _translateX += details.delta.dx;
              }
            });
          },
          onPanEnd: (details) {
            if (_translateY > -tillShowY && _translateY < 0) {
              setState(() {
                _translateY = 0;
              });
            }
            if (_translateY < -tillShowY && _translateX == 0) {
              setState(() {
                widget.onLike();
                widget.widgets.removeAt(0);
                _translateY = 0;
              });
            }
            _translateY = 0;
            if (_translateX < tillShow && _translateX > 0) {
              setState(() {
                _translateX = 0.0;
              });
            }
            if (_translateX > -tillShow && _translateX < 0) {
              setState(() {
                _translateX = 0;
              });
            }

            if (_translateX < -tillShow && _translateX < 0) {
              setState(() {
                _translateX = -1000;
              });
              Future.delayed(const Duration(microseconds: 1000), () {
                setState(() {
                  widget.widgets.removeAt(0);
                  widget.onReject();
                  _translateX = 0;
                });
              });
            }
            if (_translateX > tillShow && _translateX > 0) {
              setState(() {
                _translateX = 1000;
              });
              Future.delayed(const Duration(microseconds: 5000), () {
                setState(() {
                  widget.widgets.removeAt(0);
                  widget.onAccept();
                  _translateX = 0;
                });
              });
            }
          },
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: <Widget>[
                  if (widget.widgets.length > 1)
                    Positioned(
                      left: ((MediaQuery.of(context).size.width -
                              containerWidth) /
                          2),
                      child: CustomCard(
                        containerWidth: containerWidth,
                        containerHeight: containerHeight,
                        widget: widget.widgets[1],
                      ),
                    ),
                  widget.widgets.isEmpty
                      ? const Text(
                          "No Data",
                          style: TextStyle(color: Colors.black, fontSize: 30),
                        )
                      : Positioned(
                          top: ((MediaQuery.of(context).size.height -
                                      containerHeight) /
                                  2) +
                              _translateY,
                          left: ((MediaQuery.of(context).size.width -
                                      containerWidth) /
                                  2) +
                              _translateX,
                          child: Transform(
                            transform: Matrix4.rotationZ((_translateX < 0
                                ? -angleOfCardRotation *
                                    (-_translateX / rotateCradTill > 1
                                        ? 1
                                        : -_translateX / rotateCradTill)
                                : angleOfCardRotation *
                                    (_translateX / rotateCradTill > 1
                                        ? 1
                                        : _translateX / rotateCradTill))),
                            alignment: Alignment.center,
                            child: CustomCard(
                              containerWidth: containerWidth,
                              containerHeight: containerHeight,
                              widget: widget.widgets[0],
                            ),
                          ),
                        ),
                  if (_translateY < 0)
                    Positioned(
                      top: -_translateY > tillShowY
                          ? tillShowY - 65
                          : (-_translateY - 65),
                      child: Opacity(
                          opacity: -_translateY / tillShow > 1
                              ? 1
                              : -_translateY / tillShow,
                          child: Transform.scale(
                            scale: -_translateY / tillShow > 1
                                ? 1
                                : -_translateY / tillShow,
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.pink, width: 5),
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                width: 130,
                                height: 130,
                                child: Center(
                                  child: const Icon(
                                    Icons.favorite,
                                    size: 100,
                                    color: Colors.pink,
                                  ),
                                )),
                          )),
                    ),
                  if (_translateX > 0)
                    Positioned(
                      right: _translateX > tillShow
                          ? tillShow - 65
                          : (_translateX - 65),
                      child: Opacity(
                          opacity: _translateX / tillShow > 1
                              ? 1
                              : _translateX / tillShow,
                          child: Transform.scale(
                            scale: _translateX / tillShow > 1
                                ? 1
                                : _translateX / tillShow,
                            child: Container(
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                width: 130,
                                height: 130,
                                child: const Icon(
                                  Icons.check_circle_outline_outlined,
                                  size: 130,
                                  color: Colors.yellow,
                                )),
                          )),
                    ),
                  if (_translateX < 0)
                    Positioned(
                      left: _translateX < -tillShow
                          ? tillShow - 65
                          : -_translateX - 65,
                      child: Opacity(
                        opacity: -_translateX / tillShow > 1
                            ? 1
                            : -_translateX / tillShow,
                        child: Transform.scale(
                            scale: -_translateX / tillShow > 1
                                ? 1
                                : -_translateX / tillShow,
                            child: Container(
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                width: 130,
                                height: 130,
                                child: const Icon(
                                  CupertinoIcons.multiply_circle,
                                  size: 130,
                                  color: Colors.black54,
                                ))),
                      ),
                    ),
                ]),
          ),
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.containerWidth,
    required this.containerHeight,
    required this.widget,
  });

  final double containerWidth;
  final double containerHeight;
  final StackedModel widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerWidth,
      height: containerHeight,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.network(widget.img, fit: BoxFit.cover).image),
          borderRadius: BorderRadius.circular(20)),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: widget.bottomChild,
      ),
    );
  }
}

class StackedModel {
  String img;
  Widget bottomChild;
  StackedModel({required this.bottomChild, required this.img});
}
