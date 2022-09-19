import 'package:flutter/material.dart';

class MyCustomBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  const MyCustomBottomNavigationBar({super.key, required this.currentIndex});

  @override
  MyCustomBottomNavigationBarState createState() => MyCustomBottomNavigationBarState();
}

class MyCustomBottomNavigationBarState extends State<MyCustomBottomNavigationBar> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.width * 0.155,
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.024),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            setState(() => currentIndex = index);
            if (index == 3) {
              Scaffold.of(context).openDrawer();
            }
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: size.width * 0.014),
              Icon(listOfIcons[index], size: size.width * 0.076, color: Colors.white),
              AnimatedContainer(
                duration: const Duration(milliseconds: 1500),
                curve: Curves.fastLinearToSlowEaseIn,
                margin: EdgeInsets.only(
                  top: index == currentIndex ? 0 : size.width * 0.029,
                  right: size.width * 0.0422,
                  left: size.width * 0.0422,
                ),
                width: size.width * 0.153,
                height: index == currentIndex ? size.width * 0.014 : 0,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.favorite_rounded,
    Icons.settings_rounded,
    Icons.menu_rounded,
  ];
}
