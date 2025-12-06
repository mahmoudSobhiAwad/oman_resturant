import 'package:flutter/material.dart';
import '../../../core/network/mony_helper.dart';
import '../../../core/utils/theme/app_colors.dart';
import '../../../core/utils/theme/custom_app_font_styles.dart';
import '../custom_cached_image.dart';
import '../custom_list_tile.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, this.product});
  final dynamic product;

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      spacing: 0,
      padding: const EdgeInsets.all(8),
      leadingIconInstead: CustomCachedImage(
        imagePath: product?.pickedVariant?.image ?? product?.imageCover ?? "",
        width: 64,
        height: 64,
      ),
      backgroundColor: AppColors.white,

      titleTextStyle: CustomAppFontStyle.regular14.copyWith(
        color: AppColors.gray52,
      ),
      expantionWidget: Row(
        spacing: 2,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "${MonyHelper.formatMoney(product?.pickedVariant?.priceAfterDiscount ?? 0)} د.ع",
            style: CustomAppFontStyle.semiBold16.copyWith(
              color: AppColors.black,
            ),
          ),
          if (product?.pickedVariant?.price != null &&
              product?.pickedVariant?.priceAfterDiscount !=
                  product?.pickedVariant?.price)
            Transform.translate(
              offset: const Offset(0, 3),
              child: Text(
                "${MonyHelper.formatMoney(product?.pickedVariant?.price ?? 0)} د.ع",
                textAlign: TextAlign.end,
                style: CustomAppFontStyle.regular13.copyWith(
                  color: AppColors.red16,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: AppColors.red16,
                ),
              ),
            ),
        ],
      ),

      titleInstead: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            product?.brand?.name ?? "",
            style: CustomAppFontStyle.regular14.copyWith(
              color: AppColors.gray52,
            ),
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "الكمية/",
                  style: CustomAppFontStyle.light10.copyWith(
                    color: AppColors.gray88,
                  ),
                ),
                TextSpan(
                  text: " ${product?.pickedVariant?.quantityInCart ?? 0} ",
                  style: CustomAppFontStyle.semiBold16.copyWith(
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      subtitle:
          "${product?.name ?? ""} ${product?.pickedVariant?.size ?? ""} - ${product?.pickedVariant?.color ?? ""}",
      subTitleStyle: CustomAppFontStyle.medium14.copyWith(
        color: AppColors.black,
      ),
      // subtitle: ,
    );
  }
}
