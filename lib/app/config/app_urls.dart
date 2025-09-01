/// Defines API endpoints for the LayerX app.
abstract class AppUrls {
  AppUrls._();

  static const String baseAPIURL = 'https://proxix.jeuxtesting.com/api';

  // static const String notificationsBaseApi = "https://fcm.googleapis.com/v1/projects/ninjacar-3cb70/messages:send";

  // Auth Apis
  static const String signUp = '/register';
  static const String addJobs = '/add-job';
  static const String editJobs = '/update-job';
  static const String login = '/login';
  static const String getAllCategories = '/categories';
  static const String sendOtp = '/send-otp';
  static const String forgotPassword = '/forgot';
  static const String getUser = '/user-profile';
  static const String logout = '/logout';
  static const String deleteAccount = '/delete-account';
  static const String updateProfile = '/profile-update';

  // Jobs
  static const String getUserJobsByStatus = "/user-jobs";
  static const String getEngineerJobsByStatus = "/engineer-jobs";
  static const String getJobDetails = "/job";
  static const String deleteJob = "/delete-job";
  static const String submitReport = "/submit-report";
  static const String cancelJobRequest = "/create-job-request";

  // Notifications Apis
  static const String getAllNotifications = "/notifications";
  static const String markAllAsRead = "/mark-as-all-read";
  static const String deleteAllNotifications = "/delete-all-notification";

  // App Settings
  static const String getAboutUs = "/about-us";

  // Wallet Api
  static const String getWallet = "/engineer-vault";
}
