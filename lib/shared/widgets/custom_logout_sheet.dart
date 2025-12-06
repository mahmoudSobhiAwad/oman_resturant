import '../../core/utils/theme/app_colors.dart';
import '../../core/utils/theme/app_icons.dart';
import '../../core/utils/theme/custom_app_font_styles.dart';
import '../../shared/widgets/custom_push_container_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CustomLogOutSheet extends StatelessWidget {
  const CustomLogOutSheet({
    super.key,
    required this.onTap,
    this.isLoading = false,
    this.title,
    this.description,
    this.cancelText,
    this.logoutText,
  });

  final void Function() onTap;
  final bool isLoading;
  final String? title, description, cancelText, logoutText;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 4.0,
          horizontal: 16,
        ).copyWith(bottom: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: [
            CircleAvatar(
              radius: 32,
              backgroundColor: AppColors.lightRedF0,
              child: Center(
                child: SvgPicture.asset(AppIcons.logOut, width: 48, height: 48),
              ),
            ),
            const SizedBox(),
            const Text("تسجيل الخروج", style: CustomAppFontStyle.semiBold20),
            Text(
              "هل أنت متأكد أنك تريد تسجيل الخروج من حسابك؟",
              style: CustomAppFontStyle.regular16.copyWith(
                color: AppColors.gray61,
              ),
              textAlign: TextAlign.center,
            ),
            ColoredBox(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Row(
                  spacing: 8,
                  children: [
                    Expanded(
                      child: CustomPushButton(
                        height: 48,
                        onTap: isLoading ? null : () => context.pop(),
                        backgroundColor: AppColors.white,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        radius: 12,
                        border: const BorderSide(
                          color: AppColors.gray92,
                          width: 0.5,
                        ),
                        child: Text(
                          cancelText ?? "إلغاء",
                          style: CustomAppFontStyle.semiBold16.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: CustomPushButton(
                        height: 48,
                        isLoading: isLoading,
                        onTap: onTap,
                        backgroundColor: AppColors.red,
                        padding: const EdgeInsets.symmetric(vertical: 13.5),
                        radius: 12,
                        child: const Text(
                          "تأكيد الخروج",
                          style: CustomAppFontStyle.semiBold16,
                        ),
                      ),
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
