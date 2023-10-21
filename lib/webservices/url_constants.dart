class UrlConstants {
  // dev
  // static const MAIN_URL = "pohttp://122.169.114.249:8080";
  static const MAIN_URL = "http://122.169.114.249:8080";

  static const checklatestVersion =
      "$MAIN_URL/timsWeb/rest/v1/checkApkLatestVesion";
  static bool isDemoApk = true;
  static const loginOtherurl = "$MAIN_URL/timsWeb/rest/v1/checkOtherLogin";
  static const loginUrl = '$MAIN_URL/timsWeb/rest/v1/loginRequest';
  static const logout = "$MAIN_URL/timsWeb/rest/v1/logoutRequest";
  static const matrixList = '$MAIN_URL/timsWeb/rest/v1/employeeTrainingList';

  // Testing
  /* static const MAIN_URL = "http://sfasapkpreprd.esense.in/";
  static bool isDemoApk=true;*/

  // Live
  /* static const MAIN_URL = "https://sfasapp.navneettoptech.com/";
  static bool isDemoApk = false;*/

  // auth & user detail
  static const login = "${MAIN_URL}login.aspx";
  static const passwordPopUp =
      "http://202.8.125.236:8081/timsWeb/rest/v1/confirmApprovalPassword";
  static const trainingDetail = "$MAIN_URL/timsWeb/rest/v1/trainingDetail";
}
