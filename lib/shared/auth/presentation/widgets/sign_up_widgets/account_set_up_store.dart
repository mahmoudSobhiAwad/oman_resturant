// import 'package:huda_yousef/core/extensions/size_helper.dart';
// import 'package:huda_yousef/core/utils/constants/app_strings.dart';
// import 'package:huda_yousef/core/utils/theme/app_colors.dart';
// import 'package:huda_yousef/core/utils/theme/app_font_styles.dart';
// import 'package:huda_yousef/shared/auth/data/models/sign_up/address_model.dart';
// import 'package:huda_yousef/shared/auth/data/models/sign_up/sign_up_params.dart';
// import 'package:huda_yousef/shared/auth/presentation/cubits/sign_up/sign_up_cubit.dart';
// import 'package:huda_yousef/shared/auth/presentation/widgets/auth_header.dart';
// import 'package:huda_yousef/core/routing/routes.dart';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:huda_yousef/core/utils/theme/app_icons.dart';
// import 'package:huda_yousef/core/utils/theme/custom_app_font_styles.dart';
// import 'package:huda_yousef/shared/auth/presentation/widgets/login_widgets/custom_password_field.dart';
// import 'package:huda_yousef/shared/widgets/app_image.dart';
// import 'package:huda_yousef/shared/widgets/custom_push_container_button.dart';
// import 'package:huda_yousef/shared/widgets/customer_form_edit_create_data.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:huda_yousef/shared/widgets/label/circle_avatar.dart';

// class AccountSetUpStore extends StatefulWidget {
//   const AccountSetUpStore({super.key, this.param});

//   final SignUpParams? param;

//   @override
//   State<AccountSetUpStore> createState() => _AccountSetUpStoreState();
// }

// class _AccountSetUpStoreState extends State<AccountSetUpStore> {
//   final formKey = GlobalKey<FormState>();

//   // TextEditingControllers for each field
//   final TextEditingController storeNameController = TextEditingController();
//   final TextEditingController addressController = TextEditingController();
//   final TextEditingController doctorNameController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController daysOfWorkController = TextEditingController();
//   final TextEditingController descriptionController = TextEditingController();

//   final TextEditingController passwordController = TextEditingController();

//   // FocusNodes for each field
//   final FocusNode nameFocus = FocusNode();
//   final FocusNode addressFocus = FocusNode();
//   final FocusNode areaFocus = FocusNode();
//   final FocusNode phoneFocus = FocusNode();
//   final FocusNode passwordFocus = FocusNode();
//   AddressModel? addressModel;

//   // Validation logic for each field

//   String? validatePassword(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'برجاء ادخال كلمة السر';
//     }
//     return null;
//   }

//   @override
//   void initState() {
//     if (widget.param != null) {
//       storeNameController.text = widget.param!.name ?? "";
//       addressController.text = widget.param!.adressModel?.placeName ?? "";
//       doctorNameController.text = widget.param!.address ?? "";
//       phoneController.text = widget.param!.phone ?? "";
//       passwordController.text = widget.param!.password ?? "";
//     }
//     super.initState();
//   }

//   @override
//   void dispose() {
//     storeNameController.dispose();
//     addressController.dispose();
//     doctorNameController.dispose();
//     phoneController.dispose();
//     passwordController.dispose();
//     nameFocus.dispose();
//     addressFocus.dispose();
//     areaFocus.dispose();
//     phoneFocus.dispose();
//     passwordFocus.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: formKey,
//       child: Column(
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   AuthHeader(
//                     backTitle: 'تسجيل دخول',
//                     onBack: () => context.pop(),
//                     enableLogo: false,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: context.setHeight(16.0),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       spacing: context.setHeight(8),
//                       children: [
//                         Text(
//                           AppStrings.enterStoreData,
//                           style: AppFontStyle.medium20(context),
//                         ),
//                         SizedBox(height: context.setHeight(8)),
//                         SizedBox(
//                           width: double.infinity,
//                           child: DottedBorder(
//                             options: RoundedRectDottedBorderOptions(
//                               padding: EdgeInsets.symmetric(
//                                 horizontal: context.setWidth(24),
//                                 vertical: context.setHeight(16),
//                               ),
//                               color: AppColors.grayE4,
//                               strokeWidth: 1,
//                               dashPattern: [10, 5],
//                               radius: Radius.circular(context.setHeight(8.0)),
//                             ),

//                             child: Center(
//                               child: Column(
//                                 spacing: context.setHeight(12),
//                                 children: [
//                                   CustomCircleAvatar(
//                                     radius: context.setMinSize(48.0),

//                                     color: AppColors.grayF2,
//                                     borderWidth: context.setMinSize(8),

//                                     child: AppImage(
//                                       path: AppIcons.addImage,
//                                       height: context.setMinSize(24.0),
//                                       width: context.setMinSize(24.0),
//                                       fit: BoxFit.fill,
//                                       color: AppColors.gray6C,
//                                     ),
//                                   ),
//                                   Text(
//                                     AppStrings.uploadStoreLogo,
//                                     style: AppFontStyle.light16(context),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),

//                         const SizedBox(height: 4),

//                         const Text(
//                           "سجّل دخولك لإدارة متجرك، إضافة منتجاتك وخدماتك، وتتبع طلبات العملاء ومواعيد العيادة.",
//                           style: CustomAppFontStyle.light14,
//                         ),
//                         const SizedBox(height: 24),
//                         CustomUserForm(
//                           phoneController: phoneController,
//                           phoneFocus: phoneFocus,
//                           nameController: storeNameController,
//                           nameFocus: nameFocus,
//                           addressFocus: addressFocus,
//                           addressController: addressController,
//                           areaFocus: areaFocus,
//                           areaController: doctorNameController,
//                           requestLastFocust: (_) {
//                             FocusScope.of(context).requestFocus(phoneFocus);
//                           },
//                         ),

//                         const SizedBox(height: 16),
//                         BlocBuilder<SignUpCubit, SignUpState>(
//                           buildWhen: (prev, curr) {
//                             return curr is ChangeVisibilityState;
//                           },
//                           builder: (context, state) {
//                             bool isHidden = true;
//                             if (state is ChangeVisibilityState) {
//                               isHidden = state.value;
//                             }
//                             return CustomPasswordField(
//                               isHidden: isHidden,
//                               formKey: formKey,
//                               onFiledSumbitted: () {},
//                               changeVisibilty: () {
//                                 context.read<SignUpCubit>().changeVisibility(
//                                   !isHidden,
//                                 );
//                               },
//                               passwordController: passwordController,
//                               passwordFocus: passwordFocus,
//                             );
//                           },
//                         ),
//                         const SizedBox(height: 8),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           BlocBuilder<SignUpCubit, SignUpState>(
//             buildWhen: (prev, curr) => curr is VerifyPhoneState,
//             builder: (context, state) {
//               return SafeArea(
//                 top: false,
//                 bottom: true,
//                 child: CustomPushButton(
//                   radius: 52,
//                   height: 50,
//                   padding: const EdgeInsets.symmetric(vertical: 12),
//                   isLoading: state is LoadingVerifyPhoneState,
//                   margin: const EdgeInsets.symmetric(
//                     horizontal: 16,
//                     vertical: 12,
//                   ).copyWith(bottom: 10),
//                   onTap: () {
//                     if (true) {
//                       context.read<SignUpCubit>().verifySentPhone(
//                         params: SignUpParams(
//                           address: doctorNameController.text,
//                           name: storeNameController.text,
//                           adressModel: addressModel!,
//                           phone: phoneController.text.substring(2),
//                           password: passwordController.text,
//                         ),
//                       );
//                     }
//                   },
//                   child: const Center(
//                     child: Text("متابعة", style: CustomAppFontStyle.regular16),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
