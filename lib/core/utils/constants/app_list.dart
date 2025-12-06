import '../../../shared/model/bottom_nav_model.dart';
import '../theme/app_icons.dart';

const List<String> searchList = ['متاجر', 'منتجات'];

class BookingStatusModel {
  final BookingStatusEnum? keyEn;
  final String nameAr;

  const BookingStatusModel({this.keyEn, required this.nameAr});
}

enum BookingStatusEnum {
  waiting(0),
  shipped(1),
  canceled(2),
  rejected(3),
  completed(4);

  final int valueIndex;
  const BookingStatusEnum(this.valueIndex);
}

const List<BookingStatusModel> orderStatusList = [
  BookingStatusModel(nameAr: 'الكل'),
  BookingStatusModel(keyEn: BookingStatusEnum.waiting, nameAr: 'قيد التجهيز'),
  BookingStatusModel(keyEn: BookingStatusEnum.shipped, nameAr: 'قيد التوصيل'),
  BookingStatusModel(keyEn: BookingStatusEnum.completed, nameAr: 'تم التسليم'),
  BookingStatusModel(keyEn: BookingStatusEnum.rejected, nameAr: 'ملغي'),
];

List<BottomNavModel> customerBottomNavItems = [
  BottomNavModel(
    assetName: AppIcons.homeOutlined,
    label: 'الرئيسية',
    activeAssetName: AppIcons.home,
  ),
  BottomNavModel(
    assetName: AppIcons.categories,
    label: 'الأقسام',
    activeAssetName: AppIcons.categoryFilled,
  ),
  BottomNavModel(
    assetName: AppIcons.brands,
    label: 'البراندات',
    activeAssetName: AppIcons.brandsFilled,
  ),
  BottomNavModel(
    assetName: AppIcons.orderOutlined,
    label: 'الطلبات',
    activeAssetName: AppIcons.order,
  ),
  BottomNavModel(
    assetName: AppIcons.userName,
    label: 'حسابي',
    activeAssetName: AppIcons.userNameFilled,
  ),
];

// final List<OrderInDriverStatus> orderDriverStatusList = [
//   OrderInDriverStatus(name: 'الكل', orderStatus: OrderInDriverStautsEnum.all),
//   OrderInDriverStatus(
//       name: 'انتظار', orderStatus: OrderInDriverStautsEnum.waits),
//   OrderInDriverStatus(
//       name: 'جاري', orderStatus: OrderInDriverStautsEnum.processing),
//   OrderInDriverStatus(
//       name: 'تم الاستلام من المتجر',
//       orderStatus: OrderInDriverStautsEnum.receivedFromStore),
//   OrderInDriverStatus(
//       name: 'مستلم', orderStatus: OrderInDriverStautsEnum.returned),
//   OrderInDriverStatus(
//       name: 'مرتجع', orderStatus: OrderInDriverStautsEnum.delivered),
// ];
