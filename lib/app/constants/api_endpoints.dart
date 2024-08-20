class ApiEndpoints{
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  // static const String baseUrl = "http://10.0.2.2:5500/api/";
  static const String imageBaseUrl ="http://192.168.1.82:5500/";
  static const String baseUrl = "http://192.168.1.82:5500/api/";
  //
  //static const String baseUrl = "http://localhost:3000/api/v1/";
  //static const String baseUrl = "http://192.168.4.4:3000/api/v1/";

  // ====================== Auth Routes ======================
  static const String login = "user/login";
  static const String register = "user/create";
  static const String forgotpassword ='user/forgot_password';
  static const String verifyOtp = 'user/verify_otp';
  static const String updateUser ='user/update-user';
  static const String currentUser = "user/getUser";
  static const String listings = "pets/pagination";
  static const String petDetail = 'pets/get_single_listing';
  static const String application ='user/application';
  static const String getUserApplication = 'user/profile';
  static const String deleteApplication ='user/delete_application/{id}';
  static const String updateApplication = 'user/update-application/{id}';
  static const String search = 'pets/searchpets';
  static const String meet= 'user/meet';
  static const String getApplication = 'user/get_application_with_pet';

  static const limitPage = 4;
}