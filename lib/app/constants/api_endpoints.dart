class ApiEndpoints{
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  static const String baseUrl = "http://10.0.2.2:5500/api/";
  static const String imageBaseUrl ="http://10.0.2.2:5500/";
  // static const String baseUrl = "http://192.168.1.79:5500/api/";

  //static const String baseUrl = "http://localhost:3000/api/v1/";
  //static const String baseUrl = "http://192.168.4.4:3000/api/v1/";

  // ====================== Auth Routes ======================
  static const String login = "user/login";
  static const String register = "user/create";
  static const String currentUser = "user/getMe";
  static const String listings = "pets/get_only_listing";

  static const limitPage = 8;
}