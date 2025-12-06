import 'dart:async';

import 'package:flutter_svg/svg.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/utils/theme/app_colors.dart';
import '../../../../core/utils/theme/app_images.dart' show AppImages;
import '../../../../core/utils/theme/custom_app_font_styles.dart';
import '../../../widgets/custom_push_container_button.dart' show CustomPushButton;
import '../widgets/auth_header.dart';

class CustomOtp extends StatefulWidget {
  const CustomOtp({
    super.key,
    this.onBack,
    this.backTitle,
    required this.phoneNumber,
    this.onProgress,
    this.reSendOtp,
    this.isLoading = false,
    this.isLoadingOtp = false,
    this.enableRecount = false,
  });

  final void Function()? onBack;
  final String? backTitle;
  final void Function(String)? onProgress;
  final void Function()? reSendOtp;
  final bool isLoading;
  final bool isLoadingOtp;
  final bool enableRecount;
  final String phoneNumber;

  @override
  State<CustomOtp> createState() => _CustomOtpState();
}

class _CustomOtpState extends State<CustomOtp> {
  static const int _initialSeconds = 30;
  late int _secondsRemaining;
  Timer? _timer;
  bool _canResend = false;
  late final TextEditingController _controller;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _controller = TextEditingController();
    _formKey = GlobalKey<FormState>();
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    setState(() {
      _secondsRemaining = _initialSeconds;
      _canResend = false;
    });
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 1) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        setState(() {
          _secondsRemaining = 0;
          _canResend = true;
        });
        _timer?.cancel();
      }
    });
  }

  void _onResendPressed() {
    _controller.clear();
    widget.reSendOtp != null ? widget.reSendOtp!() : null;
    widget.enableRecount ? _startCountdown() : null;
  }

  @override
  void dispose() {
    _timer?.cancel();

    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (val, result) {
        widget.onBack != null ? widget.onBack!() : null;
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AuthHeader(
              onBack: widget.onBack,
              backTitle: widget.backTitle ?? 'العودة',
              logoWidget: Center(
                child: SvgPicture.asset(
                  AppImages.passLogo,
                  width: 120,
                  height: 120,
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 28.5,
                  vertical: 32,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "أدخلي رمز التحقق",
                      style: CustomAppFontStyle.semiBold20,
                    ),
                    const SizedBox(height: 4),
                    Text.rich(
                      textDirection: TextDirection.ltr,
                      TextSpan(
                        text:
                            'أرسلنا لكِ رمزًا مكونًا من 6 أرقام على رقم الهاتف: ',
                        style: CustomAppFontStyle.light14.copyWith(
                          color: AppColors.gray88,
                        ),
                        children: [
                          WidgetSpan(
                            child: Directionality(
                              textDirection: TextDirection.ltr,
                              child: Text(
                                '+964 ${'x' * (widget.phoneNumber.length - 1)}${widget.phoneNumber.characters.last}',
                                style: CustomAppFontStyle.light14,
                              ),
                            ),
                          ),
                          const TextSpan(
                            text: ' أدخليه أدناه لإعادة تعيين كلمة المرور',
                            style: CustomAppFontStyle.light14,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.end,
                    ),
                    const SizedBox(height: 32),
                    Center(
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: Pinput(
                          length: 6,
                          controller: _controller,
                          errorPinTheme: getCustomPinTheme(
                            borderColor: AppColors.red,
                            fillColor: AppColors.white,
                          ),
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length < 6) {
                              return '';
                            }
                            return null;
                          },
                          onCompleted: (value) {
                            if (_formKey.currentState?.validate() ?? false) {
                              widget.onProgress != null
                                  ? widget.onProgress!(_controller.text)
                                  : null;
                            }
                          },
                          pinAnimationType: PinAnimationType.rotation,
                          defaultPinTheme: getCustomPinTheme(
                            fillColor: AppColors.grayF4,
                          ),
                          disabledPinTheme: getCustomPinTheme(
                            fillColor: AppColors.grayF4,
                            borderColor: AppColors.grayF0,
                          ),
                          focusedPinTheme: getCustomPinTheme(
                            fillColor: AppColors.grayF4,
                            borderColor: AppColors.primary,
                          ),
                          submittedPinTheme: getCustomPinTheme(
                            fillColor: AppColors.grayF4,
                            borderColor: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                    CustomPushButton(
                      height: 50,
                      isLoading: widget.isLoading,
                      onTap: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          widget.onProgress != null
                              ? widget.onProgress!(_controller.text)
                              : null;
                        }
                      },
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      margin: const EdgeInsets.symmetric(vertical: 24),
                      child: const Center(
                        child: Text(
                          "تحقق من الرمز",
                          style: CustomAppFontStyle.regular16,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'لم يصلك الرمز؟ ',
                          style: CustomAppFontStyle.regular14.copyWith(
                            color: AppColors.gray8C,
                          ),
                        ),
                        if (widget.isLoadingOtp)
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: SizedBox(
                              width: 20,
                              height: 20,
                              child: CupertinoActivityIndicator(
                                radius: 15,
                                color: AppColors.primary,
                              ),
                            ),
                          )
                        else if (_canResend)
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(0),
                            ),
                            onPressed: _onResendPressed,
                            child: Text(
                              'اعادة ارسال الرمز',
                              style: CustomAppFontStyle.regular14.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                          )
                        else
                          Text(
                            'اعادة ارسال الرمز بعد $_secondsRemaining ثانية',
                            style: CustomAppFontStyle.regular14.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

PinTheme getCustomPinTheme({Color? fillColor, Color? borderColor}) {
  return PinTheme(
    height: 48,
    width: 48,
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          blurRadius: 2,
          offset: const Offset(0, 1),
          color: AppColors.black.withValues(alpha: 0.05),
        ),
      ],
      borderRadius: BorderRadius.circular(8),
      color: fillColor ?? AppColors.white,
      border:
          borderColor != null ? Border.all(color: borderColor, width: 2) : null,
    ),
  );
}
