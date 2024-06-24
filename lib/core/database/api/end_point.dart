class EndPoint {
  //static const String baseUrl = "http://192.168.1.8:8000/api/";
  static const String baseUrl = "http://10.0.2.2:8000/api/";
  //static const String baseUrl = "  https://factually-national-piranha.ngrok-free.app";

  //static const String baseUrl ="http://127.0.0.1:8000/api/";
  //static const String baseUrl = "http://10.148.26.143:8000/api/";

  static const String register = "register";
  static const String login = "login";
  static const String logout = "logout";
  static const String profile = "profile";
  static const String userPhoto = "userphoto";
  static const String userPersonalInformation = "userpersonalinformation";
  static const String getAllBlogs = "blog/index";
  static const String getDetectionData = "detection";
  static const String getAllPillsInteraction = "interaction/index";
  static const String getInteractions = "interaction";
  static const String getInteractionHistory = "interaction/history";
  static const String getDetectionHistory = "detection/history";

  static const String getImageInteraction = "imageInteraction";

  static const String getDetectionDosageData = "dosage";
  static const String getDetectionSideEffectData = "sideeffect";
  static const String getDetectionConstrainData = "contraindiacation";
  static String getSpecificDetectionHistory(id) {
    return "detection/history/show/$id";
  }

  static String deleteSpecificDetectionHistory(id) {
    return "detection/history/delete/$id";
  }

  static String getSpecificInteractionHistory(id) {
    return "interaction/history/show$id";
  }

  static String deleteSpecificInteractionHistory(id) {
    return "interaction/history/delete/$id";
  }
}

class Apikeys {
  static const String email = 'email';
  static const String id = 'id';
  static const String thumbnail = 'thumbnail';

  static const String blogs = 'blogs';
  static const String category_id = 'category_id';

  static const String dosage = 'dosage';
  static const String data = 'data';
  static const String pill1Photo = 'pill_1_photo';
  static const String pill2Photo = 'pill_2_photo';
  static const String interactionType = 'interaction_type';
  static const String interactionId = 'interaction_id';
  static const String createdAt = 'created_at';
  static const String userPillPhoto = 'userPillPhoto';
  static const String pillPhoto = 'pillPhoto';
  static const String pillName = 'pillName';

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
  static const String errorMessage = 'errorMessage';

  static const String token = 'token';
  static const String code = 'code';
  static const String name = 'name';
  static const String status = 'status';
  static String profilePic = "photo";
  static String photo = "photo";
  static String img = "img";
  static String img1 = "img1";
  static String img2 = "img2";

  static const String description = 'description';
}
