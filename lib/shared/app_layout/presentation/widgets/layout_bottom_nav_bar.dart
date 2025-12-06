import 'package:flutter/material.dart';

import '../../../../core/utils/theme/app_colors.dart';
import '../../../model/bottom_nav_model.dart';
import 'bottom_nav_bar_item.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
    this.cancelCenterBottomItem = false,
    required this.bottomNavList,
  });

  final int selectedIndex;
  final void Function(int) onTap;
  final List<BottomNavModel> bottomNavList;
  final bool cancelCenterBottomItem;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      shadowColor: AppColors.white,
      padding: const EdgeInsets.all(0.0),
      color: AppColors.white,
      // padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(bottomNavList.length, (index) {
            return Expanded(
              flex: 3,
              child: InkWell(
                onTap: () {
                  onTap(index);
                },
                child: BottomNavItem(
                  assetFilledName: bottomNavList[index].activeAssetName,
                  assetName: bottomNavList[index].assetName,
                  label: bottomNavList[index].label,
                  isActive: index == selectedIndex,
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
