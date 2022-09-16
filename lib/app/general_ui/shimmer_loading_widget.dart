import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingWidget extends StatelessWidget {
  const ShimmerLoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      direction: ShimmerDirection.ttb,
      baseColor: Colors.grey[900]!,
      highlightColor: Colors.grey[600]!,
      period: const Duration(milliseconds: 1000),
      child: Container(
        height: 400,
        width: double.infinity,
        color: Colors.grey[900]!,
      ),
    );
  }
}
