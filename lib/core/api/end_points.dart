abstract class EndPoints {
  //?======================== BASE URL ========================
  // static String appBaseUrl =
  //     'http://192.168.1.206:5672/'; //! for test production
  static String appBaseUrl =
      'http://192.168.1.23:1116/'; //! for live production
  static String baseUrl = '${appBaseUrl}api/v1/'; //! for local testing
  static String baseImageUrl = "${appBaseUrl}images/";

  // static String baseImgUrl = "${appBaseUrl}image/";

  //?======================== LOGIN & SIGNUP & REFRESH TOKEN ========================
  static String login = 'auth/login';
  static String storeLogin = 'store/login';
  static String sendVerificationCodeForPhone = 'auth/createVerificationCode';
  static String sendVerificationCodeForPhoneStore = 'store/checkPhone/:';
  static String verifyCode = 'auth/verify';
  static String sendVerificationCodeForForgetPassword =
      'auth/createVerificationCodeCheck';
  static String forgetPassword = 'auth/forget-password';
  static String signup = 'auth/signup';
  static String logout = 'auth/logout';
  static String refreshUserToken = 'token';
  static String refreshStoreToken = 'store/refreshToken';
  static String profile = 'users/getMe';
  static String profileUpdate = 'users/updateMe';
  static String userUpdateProfile = 'user/';

  //========================= customer Apis =============================
  static String sliders = 'sliders';
  static String pets = 'pet';
  static String userOrders = 'orders';
  static String getProductPantry = 'getPricePandry';
  static String customerAddresses = 'addresses';
  static String checkCart = '/order/validate-order-with-ids';

  //?======================== Rest of  other Apis ========================
  static String uploadOneImage = 'upload/image';
  static String userProfile = 'users/profile';
  static String changePassword = 'user/changePassword';
  static String products = 'item';
  static String getAllProducts = 'products';
  static String productId = 'item/';
  static String addProducts = 'item/add';

  static String stores = 'store';
  static String categories = 'categories';
  static String notifications = 'note';
  static String productReview = 'reviews/getProductReviews';
  static String reviewCounts = 'reviews/count';
  static String createOrder = 'order';
  static String payment = 'payments';
  static String driverOrderSummary = 'orders/count';
  static String confige = 'configs';
  static String cities = 'cities';
  static String regions = 'regions';
  static String faqs = 'faq';
  static String config = 'contactUs';
  static String scanPetByCode = '/pet/code/';
  static String toggleFav = 'fav/toggle';
  static String getAllFav = 'fav';
  static String examinations = 'examinations';

  //!======================== Merchant ========================
  static String subscription = 'subscription';
  static String createSignUpStore = 'store/register';
  static String merchantReviews = 'reviews';
  static String getAllStorePets = 'pet/all';
  static String storePets = 'pet';
  static String getAllStoreCategories = 'getAllStoreCategories';
  static String storeOrders = 'order';
  static String category = 'category';
  static String storeProducts = 'products/store';
  static String merchantReviewsCount = 'reviews/count';
  static String getNotifications = 'notifications';
  static String seenNotifications = 'notifications/seen';

  //!======================== Services ========================
  static String getAllStoreService = 'service';
  static String getStoreService = 'service/';

  static String getAllStoreSubService = 'sub-service/';
  static String getStoreSubService = '/sub-service';
  static String updateStoreSubService = 'subservice/';
  static String deActivateStoreSubService = 'sub-service/deActivate/';
  static String activateStoreSubService = 'sub-service/active/';
  static String reservation = 'reservation';
  static String historyReservation = 'pet/history';
  static String setVaccinations = '/pet/setVaccinations';
  static String vaccinations = 'vaccination';
  static String storeProfile = 'store/profile';
  static String rate = 'rate';
  static String examination = 'examination';
  static String storeStatistics = 'store/statistics';
  static String relatedStoreToService = 'sub-service/stores/';

  static String sendNotificationToOwner = 'pet/notifyFound';

  //!======================== Influencer ========================
  static String getAllInfluencer = 'users/getInfluencers';
  static String getInfluencer = 'users/getInfluencer/';
  static String createInfluencer = 'influencer';
  static String updateInfluencer = 'influencer/';
  static String deleteInfluencer = 'influencer/';
  static String linkProductsToInfluencer = 'influencer/';

  //!======================== Brand ========================
  static String brands = 'brands';
  static String transactions = 'transaction';

  static String review = 'reviews';
  //!======================== Coupon ========================
  static String checkCouponByCode = 'coupon/couponByCode';
}
