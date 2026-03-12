import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oman_resturant/core/utils/extensions/sliver_to_widget.dart';
import 'package:oman_resturant/core/utils/theme/app_colors.dart';
import 'package:oman_resturant/features/app_layout/presentation/cubit/app_layout_cubit.dart';
import 'package:oman_resturant/features/app_layout/presentation/widgets/about_resturant_section.dart';
import 'package:oman_resturant/features/app_layout/presentation/widgets/atmosphere_slider.dart';
import 'package:oman_resturant/features/app_layout/presentation/widgets/food_menu_grid.dart';

class AppLayoutBody extends StatefulWidget {
  const AppLayoutBody({super.key});

  @override
  State<AppLayoutBody> createState() => _AppLayoutBodyState();
}

class _AppLayoutBodyState extends State<AppLayoutBody> {
  late final AppLayoutCubit layoutCubit;
  @override
  void initState() {
    layoutCubit = context.read<AppLayoutCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: AppColors.beigeDark,
      color: AppColors.black,
      onRefresh: () async {
        layoutCubit.loadAllData();
      },
      child: CustomScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        slivers: [
          AboutResturantSection(layoutCubit: layoutCubit),
          const SizedBox(height: 16).toSliver(),
          const AtompsphereSlider().toSliver(),
          const SizedBox(height: 16).toSliver(),

          FoodMenuGrid(layoutCubit: layoutCubit),
          const SizedBox(height: kBottomNavigationBarHeight).toSliver(),
        ],
      ),
    );
  }
}
