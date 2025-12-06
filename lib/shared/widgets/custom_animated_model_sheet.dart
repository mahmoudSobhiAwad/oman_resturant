import 'package:flutter/material.dart';

import '../../core/utils/theme/app_colors.dart';

Future<dynamic> showCustomModelAnimatedSheet(
  BuildContext context, {
  required Widget child,
}) {
  return showModalBottomSheet(
    showDragHandle: true,
    useSafeArea: true,
    isDismissible: true,

    isScrollControlled: true,
    enableDrag: false,
    backgroundColor: AppColors.white,
    transitionAnimationController: AnimationController(
      vsync: Navigator.of(context),
      duration: const Duration(milliseconds: 500),
      reverseDuration: const Duration(milliseconds: 300),
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
    ),
    context: context,
    builder: (BuildContext context) {
      return AnimatedContainer(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        child: SlideTransition(
          position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
              .animate(
                CurvedAnimation(
                  parent: ModalRoute.of(context)!.animation!,
                  curve: Curves.easeInOut,
                  reverseCurve: Curves.easeInOut,
                ),
              ),
          child: FadeTransition(
            opacity: CurvedAnimation(
              parent: ModalRoute.of(context)!.animation!,
              curve: Curves.easeInOut,
            ),
            child: child,
          ),
        ),
      );
    },
  );
}
