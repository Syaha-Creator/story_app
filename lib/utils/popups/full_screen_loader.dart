import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../helpers/helper_function.dart';
import '../loaders/animation_loader.dart';

class SFullScreenLoader {
  static void openLoadingDialog(
      BuildContext context, String text, String animation) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return PopScope(
          canPop: false,
          child: Container(
            color: SHelperFunctions.isDarkMode(context)
                ? SColors.black
                : SColors.white,
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                const SizedBox(height: 250),
                SAnimationLoaderWidget(text: text, animation: animation)
              ],
            ),
          ),
        );
      },
    );
  }

  /// Stop the currently open loading dialog.
  static void stopLoading(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }
}
