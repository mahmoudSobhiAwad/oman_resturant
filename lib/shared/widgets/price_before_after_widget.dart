import 'package:app_core/core/utils/extensions/money_format.dart';

import '../../core/utils/theme/app_colors.dart';
import '../../core/utils/theme/custom_app_font_styles.dart';
import 'package:flutter/material.dart';

class CustomPriceAfterAndBefore extends StatelessWidget {
  const CustomPriceAfterAndBefore({
    super.key,
    this.priceStyle,
    this.beforePriceFontSize,
    this.symbolCurrencyStyle,
    this.priceAfter,
    this.priceBefore,
    this.enableDiscount = false,
  });
  final TextStyle? priceStyle;
  final double? beforePriceFontSize;
  final TextStyle? symbolCurrencyStyle;
  final num? priceBefore;
  final num? priceAfter;
  final bool enableDiscount;
  @override
  Widget build(BuildContext context) {
    if (!enableDiscount) {
      return Row(
        children: [
          FittedBox(
            child: Text.rich(
              TextSpan(
                text: (priceAfter?.toDouble() ?? 20000).formatMoney(),
                style:
                    priceStyle ??
                    CustomAppFontStyle.bold14.copyWith(color: AppColors.gray26),
                children: [
                  TextSpan(
                    text: " د.ع",
                    style:
                        symbolCurrencyStyle ??
                        CustomAppFontStyle.light12.copyWith(
                          color: AppColors.gray8C,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }
    return Row(
      children: [
        Text(
          (priceBefore?.toDouble() ?? 405697).formatMoney(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: CustomAppFontStyle.light12.copyWith(
            color: AppColors.gray8C,
            fontSize: beforePriceFontSize,
            decoration: TextDecoration.lineThrough,
            decorationColor: AppColors.gray8C,
          ),
        ),
        const SizedBox(width: 4),
        FittedBox(
          child: Text.rich(
            TextSpan(
              text: (priceAfter?.toDouble() ?? 20000).formatMoney(),
              style:
                  priceStyle ??
                  CustomAppFontStyle.bold14.copyWith(color: AppColors.gray26),
              children: [
                TextSpan(
                  text: " د.ع",
                  style:
                      symbolCurrencyStyle ??
                      CustomAppFontStyle.light12.copyWith(
                        color: AppColors.gray8C,
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
