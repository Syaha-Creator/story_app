import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constants/colors.dart';
import '../constants/sizes.dart';

class SCircularLoader extends StatelessWidget {
  const SCircularLoader({
    super.key,
    this.foregroundColor = SColors.white,
    this.backgroundColor = SColors.primary,
    this.size = SSizes.lg * 2,
  });

  final Color? foregroundColor;
  final Color? backgroundColor;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(SSizes.lg),
      decoration: BoxDecoration(color: backgroundColor, shape: BoxShape.circle),
      child: Center(
        child: SpinKitFadingCircle(color: foregroundColor, size: size),
      ),
    );
  }
}
