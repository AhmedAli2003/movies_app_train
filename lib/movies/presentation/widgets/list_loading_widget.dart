import 'package:flutter/material.dart';

class ListLoadingWidget extends StatelessWidget {
  final double width;
  final double height;
  const ListLoadingWidget({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      child: const CircularProgressIndicator(),
    );
  }
}
