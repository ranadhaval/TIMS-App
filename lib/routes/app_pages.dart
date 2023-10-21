import 'package:get/get.dart';
import 'package:tims/pages/Training_Matrix_Screen/Training_Matrix.dart';
import 'package:tims/pages/Tutorial_Screen/on_boarding_page.dart';
import 'package:tims/pages/feedback/feddback_form.dart';
import 'package:tims/pages/Result/result_page.dart';
import 'package:tims/pages/evalution/evalution.dart';
import 'package:tims/pages/Login/Login_Page.dart';
import 'package:tims/pages/splash/splash.dart';
import 'package:tims/pages/TrainingDetail/training_detail_screen.dart';
import 'package:tims/pages/viewmaterial.dart';
import 'package:tims/pages/wrong_answer/wrong_answer.dart';
import 'package:tims/routes/app_routes.dart';

import '../pages/VersionUpdateScrren.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => const SplashScreen(),
    ),
    /* GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginScreen(),
    ),*/
    GetPage(
      name: AppRoutes.EVALUATION,
      page: () => const Evaluation(),
    ),
    GetPage(
      name: AppRoutes.RESULT,
      page: () => const Result(),
    ),
    GetPage(
      name: AppRoutes.WRONGANSWER,
      page: () => const WrongAnswer(),
    ),
    GetPage(
      name: AppRoutes.FEEDBACKFORM,
      page: () => const FeedbackForm(),
    ),
    GetPage(
      name: AppRoutes.TRAININGDETAIL,
      page: () => const TrainingDetail(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => const Login(),
    ),
    GetPage(
      name: AppRoutes.DASHBOARD,
      page: () => const MatrixScreen(),
    ),
    GetPage(
      name: AppRoutes.VIEWMATERIAL,
      page: () => const ViewMaterial(),
    ),
    GetPage(name: AppRoutes.OnBoarding, page: () => const onBoardingPage()),
    GetPage(
        name: AppRoutes.VersionPage, page: () => const VersionUpdateScreen()),
  ];
}
