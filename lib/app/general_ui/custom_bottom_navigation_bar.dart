import 'package:flutter/material.dart';

class MyCustomBottomNavigationBar extends StatefulWidget {
  const MyCustomBottomNavigationBar({super.key});

  @override
  MyCustomBottomNavigationBarState createState() => MyCustomBottomNavigationBarState();
}

class MyCustomBottomNavigationBarState extends State<MyCustomBottomNavigationBar> {
  var currentIndex = 0;
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
          onTap: () => setState(() => currentIndex = index),
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
