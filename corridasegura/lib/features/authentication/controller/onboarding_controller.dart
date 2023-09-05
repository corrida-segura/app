import 'package:corridasegura/constants/colors.dart';
import 'package:corridasegura/constants/images.dart';
import 'package:corridasegura/constants/texts.dart';
import 'package:corridasegura/features/authentication/models/onboarding_model.dart';
import 'package:corridasegura/features/authentication/screens/onboarding/onboarding_widget.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class OnBoardingController extends GetxController{

  final controller = LiquidController();
  RxInt currentPage = 0.obs;


  final pages = [
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: tOnBoardingImage1,
        title: tOnBoardingTitle1,
        description: tOnBoardingDescription1,
        counterText: tOnBoardingCounter1,
        bgColor: tOnBoardingPage1Color,
      ),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: tOnBoardingImage2,
        title: tOnBoardingTitle2,
        description: tOnBoardingDescription2,
        counterText: tOnBoardingCounter2,
        bgColor: tOnBoardingPage2Color,
      ),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: tOnBoardingImage3,
        title: tOnBoardingTitle3,
        description: tOnBoardingDescription3,
        counterText: tOnBoardingCounter3,
        bgColor: tOnBoardingPage3Color,
      ),
    ),
  ];


  skip() => controller.jumpToPage(page: 2);
  animateToNextSlide() {
    int nextPage = controller.currentPage + 1;
    controller.animateToPage(page: nextPage);
  }
  onPageChangedCallback(int activePageIndex) => currentPage.value = activePageIndex;
}