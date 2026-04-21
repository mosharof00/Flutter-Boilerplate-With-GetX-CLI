import '../config/app_config.dart';

class ApiEndpoint {
  ///  Base URL
  static const String domainUrl = AppConfig.domainUrl;
  static const String baseUrl = '$domainUrl/api';

  ///  Auth
  static const String register = '$baseUrl/register'; // post
  static const String login = '$baseUrl/login'; // post
  static const String logOut = '$baseUrl/dashboard/logout'; // post

  /// user profile
  static const String profileDetails = '$baseUrl/profile/details'; // get
  static const String profileUpdate = '$baseUrl/profile/update'; // post

  ///  product
  static const String productList = '$baseUrl/product/list'; // get
  static const String productDetails = '$baseUrl/product/details'; // get

  ///  category
  static const String categoryList = '$baseUrl/category/list'; // get

  /// Brands
  static const String brandList = '$baseUrl/brand/list'; // get

  /// Slider
  static const String slider = '$baseUrl/slider/list';

  ///  wishlist
  static const String wishlistList = '$baseUrl/wishlist/list'; // Get
  static const String wishlistAddWishlist =
      '$baseUrl/wishlist/add/wishlist'; // post
  static const String wishlistRemoveWishlist =
      '$baseUrl/wishlist/remove/wishlist'; // post
  static const String removeAllWishlist =
      '$baseUrl/wishlist/remove/all/wishlist'; // post

  /// Cart
  static const String cartList = '$baseUrl/cart/list'; // GET
  static const String cartAdd = '$baseUrl/cart/addtocart'; // POST
  static const String cartUpdate = '$baseUrl/cart/addtocart/update'; // POST
  static String cartRemove(int cartId) =>
      '$baseUrl/cart/remove/cart/item/$cartId'; // GET

  /// Payment Methods
  static const String paymentTypes = '$baseUrl/payment-type'; // GET

  static const String placeOrder = '$baseUrl/checkout/order'; // POST
  static const String deliveryCities = '$baseUrl/delivary-city'; // GET

  static const String orderList = '$baseUrl/order/list'; // POST
  static const String orderDetails = '$baseUrl/order/details'; // POST
  static const String offerList = '$baseUrl/offer/list'; // GET
  static const String offerDetails = '$baseUrl/offer/details'; // POST

  /// Coupons
  static const String couponList = '$baseUrl/coupon/list?per_page=100'; // GET
  static const String couponApply = '$baseUrl/coupon/apply'; // POST

  static const String shippingAddressList =
      '$baseUrl/shipping-address/list?per_page=12'; // GET
  static const String shippingAddressStore =
      '$baseUrl/shipping-address/store'; // POST
  static String shippingAddressUpdate(int id) =>
      '$baseUrl/shipping-address/update/$id'; // POST
  static String shippingAddressDelete(int id) =>
      '$baseUrl/shipping-address/destroy/$id'; // DELETE

  /// Currency
  static const String currencyList = '$baseUrl/currency/list'; // GET

  /// Alert
  static const String alert = '$baseUrl/alert'; // GET

  /// Notifications
  static const String userNotifications = '$baseUrl/user-notification'; // GET
  static const String markAsSeen = '$baseUrl/make-as-seen'; // GET

  /// Forgot Password
  static const String forgetPasswordSendOtp =
      '$baseUrl/forget-password/send-otp';
  static const String forgetPasswordVerifyOtp =
      '$baseUrl/forget-password/otp-verify';
  static const String forgetPasswordResetPassword =
      '$baseUrl/forget-password/reset-password';

  /// Reviews
  static const String reviewStore = '$baseUrl/review/store';
}
