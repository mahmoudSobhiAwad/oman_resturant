import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
// import 'package:huda_yousef/core/animation/page_slide_transition.dart';
// import 'package:huda_yousef/core/animation/scale_transition_animation.dart';
// import 'package:huda_yousef/core/utils/theme/app_font_styles.dart';
import 'package:video_player/video_player.dart';

import '../../core/animation/fade_transition_animation.dart';
import '../../core/animation/slide_transition_animation.dart';
import '../../core/routing/routes.dart';
import '../../core/utils/theme/app_colors.dart';
import '../../core/utils/theme/app_images.dart';
import '../../core/utils/theme/custom_app_font_styles.dart';
import '../widgets/custom_push_container_button.dart';

class VideoSplashScreen extends StatefulWidget {
  const VideoSplashScreen({super.key});

  @override
  State<VideoSplashScreen> createState() => _VideoSplashScreenState();
}

class _VideoSplashScreenState extends State<VideoSplashScreen> {
  late VideoPlayerController _controller;
  bool enableImage = false;
  bool enableTexts = false;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset('assets/videos/splash.mp4')
      ..initialize()
          .then((_) {
            setState(() {});
            _controller.play();
            _controller.setLooping(true);
            FlutterNativeSplash.remove();
            Future.delayed(const Duration(milliseconds: 2000), () {
              setState(() {
                enableImage = true;
              });
              // if (currentContext.mounted) {
              //   currentContext.go(Routes.appLayout);
              // }
            });
            Future.delayed(const Duration(milliseconds: 3000), () {
              setState(() {
                enableTexts = true;
              });
              // if (currentContext.mounted) {
              //   currentContext.go(Routes.appLayout);
              // }
            });
          })
          .catchError((error) {
            // if (currentContext.mounted) {
            //   currentContext.go(Routes.appLayout);
            // }
          });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:
          _controller.value.isInitialized
              ? Stack(
                //alignment: Alignment.bottomCenter,
                children: [
                  Center(
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: _controller.value.size.width,
                        height: _controller.value.size.height,
                        child: VideoPlayer(_controller),
                      ),
                    ),
                  ),
                  if (enableImage)
                    Align(
                      alignment: Alignment.center,
                      child: FadeTransitionAnimation(
                        duration: Durations.extralong1,
                        child: Image.asset(AppImages.logoBGRemoved),
                      ),
                    ),
                  if (enableTexts)
                    Positioned(
                      bottom: 60,
                      left: 0,
                      right: 0,
                      child: SlideTransitionAnimation(
                        begin: const Offset(0, 1),
                        end: const Offset(0, 0),
                        duration: Durations.extralong1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            spacing: 8,
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(height: 70),
                              Text(
                                "splash_title".tr(),
                                style: CustomAppFontStyle.semiBold24.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "splash_subtitle".tr(),
                                style: CustomAppFontStyle.regular14.copyWith(
                                  color: AppColors.grayD4,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 4),
                              CustomPushButton(
                                onTap: () {
                                  context.go(AppRouter.signUp);
                                },
                                backgroundColor: AppColors.white,
                                child: Center(
                                  child: Text(
                                    "splash_button".tr(),
                                    style: CustomAppFontStyle.medium16.copyWith(
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text.rich(
                                TextSpan(
                                  text: "have_acc?".tr(),
                                  style: CustomAppFontStyle.regular12.copyWith(
                                    color: AppColors.grayAA,
                                  ),
                                  children: [
                                    WidgetSpan(
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 4,
                                            vertical: 0,
                                          ),
                                          minimumSize: const Size(0, 0),
                                          tapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                        ),
                                        onPressed: () {
                                          context.go(AppRouter.login);
                                        },
                                        child: Text(
                                          "login".tr(),
                                          style: CustomAppFontStyle.semiBold12
                                              .copyWith(color: AppColors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              )
              : const ColoredBox(
                color: Colors.black,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Center(child: SizedBox())],
                ),
              ),
    );
  }
}
