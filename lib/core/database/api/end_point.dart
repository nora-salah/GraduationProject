class EndPoint {
  static const String baseUrl = "http://10.0.2.2:8000/api/";
  //static const String baseUrl ="http://127.0.0.1:8000/api/";

  static const String register = "register";
  static const String login = "login";
  static const String logout = "logout";
  static const String profile = "profile";
  static const String userPhoto = "userphoto";
  static const String userPersonalInformation = "userpersonalinformation";
  static const String getAllBlogs = "blog/index";
  static const String getDetectionData = "detection";
  static const String getDetectionDosageData = "dosage";
  static const String getDetectionSideEffectData = "sideeffect";
  static const String getDetectionConstrainData = "contraindiacation";
}

class Apikeys {
  static const String email = 'email';
  static const String id = 'id';
  static const String blogs = 'blogs';
  static const String dosage = 'dosage';
  static const String dosages = 'dosages';

  static const String pillId = 'pill_id';
  static const String contraindiacations = 'contraindiacations';

  static const String sideEffect = 'side_effect';

  static const String sideEffects = 'sideEffects';

  static const String username = 'username';
  static const String phone = 'phone';
  static const String title = 'title';
  static const String content = 'content';
  static const String reference = 'reference';

  static const String accept = 'Accept';
  static const String success = 'success';

  static const String authorization = 'Authorization';
  static const String password = 'password';
  static const String vEmail = 'email_verified_at';
  static const String created = 'created_at';
  static const String updated = 'updated_at';

  static const String rememberToken = 'remember_token';
  static const String confirmPassword = 'confirm_password';
  static const String message = 'message';
  static const String token = 'token';
  static const String code = 'code';
  static const String name = 'name';
  static const String status = 'status';
  static String profilePic = "photo";
  static String photo = "photo";

  static const String description = 'description';
}
