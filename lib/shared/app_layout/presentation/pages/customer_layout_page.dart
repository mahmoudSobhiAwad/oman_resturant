import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/storage/cache_helper.dart';
import '../../../../core/utils/constants/app_constants.dart';
import '../../../../core/utils/constants/app_list.dart';
import '../../../../core/utils/theme/app_colors.dart';
import '../../../../core/utils/theme/app_icons.dart';
import '../../../../core/utils/theme/app_images.dart';
import '../../../cubit/basic_cubit.dart';
import '../../../widgets/custom_app_bar.dart';
import '../widgets/layout_bottom_nav_bar.dart';

class CustomerAppLayout extends StatefulWidget {
  const CustomerAppLayout({super.key, this.initialIndex = 0});

  final int initialIndex;

  @override
  State<CustomerAppLayout> createState() => _CustomerAppLayoutState();
}

class _CustomerAppLayoutState extends State<CustomerAppLayout> {
  int _selectedIndex = 0;
  bool isLogin = false;

  @override
  void initState() {
    context.read<BasicCubit>().checkNonSeenNotification();
    super.initState();
    _selectedIndex = widget.initialIndex;
    isLogin =
        AppSharedPreferences.getString(key: AppConstants.accessToken) != null;
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        systemNavigationBarContrastEnforced: true,
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: BlocListener<BasicCubit, BasicStates>(
        listenWhen: (previous, current) =>
            current is NavigateToOrderState || current is ChangePageIndexState,
        listener: (context, state) {
          if (state is NavigateToOrderState) {
            context.read<BasicCubit>().changeIndex(index: 3);
            setState(() {
              _selectedIndex = 3;
            });
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          // backgroundColor: AppColors.white,
          appBar: MyCustomAppBar(
            titleSpacing: 16,
            centerTitle: isLogin ? false : true,
            enableLeading: false,
            enableButtomDivider: false,
            titleWidget: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Image.asset(AppImages.logoDark, height: 40, width: 82),
            ),
            trailing: isLogin
                ? [
                    InkWell(
                      onTap: () {},
                      child: Badge.count(
                        isLabelVisible:
                            context.watch<BasicCubit>().getTotalCartLength() >
                            0,
                        count: context.watch<BasicCubit>().getTotalCartLength(),
                        alignment: AlignmentDirectional.topStart,
                        smallSize: 10,
                        backgroundColor: AppColors.red16,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: AppColors.grayF2,
                            shape: BoxShape.circle,
                          ),
                          width: 40,
                          height: 40,
                          child: Center(
                            child: SvgPicture.asset(AppIcons.cartIcon),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    BlocBuilder<BasicCubit, BasicStates>(
                      buildWhen: (prev, curr) => curr is CheckNotificationState,
                      builder: (context, state) {
                        if (state is LoadingCheckNotificationState) {
                          return const SizedBox(
                            width: 30,
                            height: 30,
                            child: Center(
                              child: CupertinoActivityIndicator(
                                color: AppColors.primary,
                              ),
                            ),
                          );
                        } else if (state is FailureCheckNotificationState) {
                          return IconButton.filled(
                            color: AppColors.redD600,
                            onPressed: () {
                              context
                                  .read<BasicCubit>()
                                  .checkNonSeenNotification();
                            },
                            icon: const Icon(
                              Icons.refresh,
                              color: Colors.white,
                            ),
                          );
                        }
                        return InkWell(
                          onTap: () {
                            // context.push(AppRouter.customerNotificationPage);
                          },
                          child: Badge(
                            isLabelVisible: context
                                .read<BasicCubit>()
                                .hasNotificationNotSeen,
                            smallSize: 10,
                            backgroundColor: AppColors.red16,
                            alignment: AlignmentDirectional.topStart,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: AppColors.grayF4,
                                shape: BoxShape.circle,
                              ),
                              width: 40,
                              height: 40,
                              child: Center(
                                child: SvgPicture.asset(
                                  AppIcons.notification,
                                  height: 20,
                                  width: 20,
                                  colorFilter: const ColorFilter.mode(
                                    AppColors.primary,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(width: 10),
                  ]
                : null,
          ),
          // floatingActionButtonLocation:
          //     FloatingActionButtonLocation.centerDocked,
          // floatingActionButton: BlocBuilder<BasicCubit, BasicStates>(
          //   buildWhen: (prev, curr) => curr is ChangePageIndexState,
          //   builder: (context, state) {
          //     return LayoutFloatingActionButton(
          //       isActive: _selectedIndex == 2,
          //       onTap: () {
          //         context.read<BasicCubit>().changeIndex(index: 2);
          //       },
          //     );
          //   },
          // ),
          bottomNavigationBar: BlocBuilder<BasicCubit, BasicStates>(
            buildWhen: (prev, curr) => curr is ChangePageIndexState,
            builder: (context, state) {
              if (state is ChangePageIndexState) {
                _selectedIndex = state.index;
              }
              return CustomNavBar(
                cancelCenterBottomItem: true,
                selectedIndex: _selectedIndex,
                onTap: (index) {
                  if (index != _selectedIndex) {
                    context.read<BasicCubit>().changeIndex(index: index);
                  }
                },
                bottomNavList: customerBottomNavItems,
              );
            },
          ),
          body: BlocBuilder<BasicCubit, BasicStates>(
            buildWhen: (prev, curr) => curr is ChangePageIndexState,
            builder: (context, state) {
              if (state is ChangePageIndexState) {
                _selectedIndex = state.index;
              }
              return PopScope(
                canPop: _selectedIndex == 0,
                onPopInvokedWithResult: (value, result) {
                  if (_selectedIndex != 0) {
                    context.read<BasicCubit>().changeIndex(index: 0);
                  } else {
                    context.pop();
                  }
                },
                child: SafeArea(
                  child: [
                    const SizedBox(),
                    const SizedBox(),
                    const SizedBox(),
                    SizedBox(),
                    SizedBox(),
                  ][_selectedIndex],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
