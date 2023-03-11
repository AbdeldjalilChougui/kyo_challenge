import 'dart:async';
import 'package:kyo_challenge/app/app.locator.dart';
import 'package:kyo_challenge/services/token_service.dart';
import 'package:kyo_challenge/ui/views/home/home_view.dart';
import 'package:kyo_challenge/ui/views/signup/signup_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewModel extends BaseViewModel {
  bool isDone = false;
  bool isDone2 = false;
  final _navigationService = locator<NavigationService>();
  final _tokenService = locator<TokenService>();

  void clearStackAndShowView({view}) {
    _navigationService.clearStackAndShowView(view,);
  }

  Future<String?>? getToken() async {
    return await _tokenService.getTokenValue();
  }

  startAnimation() async {
    String? token = await getToken();
    Timer(const Duration(milliseconds: 4000), () async {
      isDone = true;
      if (token != null) {
        clearStackAndShowView(view: const HomeView());
      } else {
        clearStackAndShowView(view: const SignUpView());
      }
      notifyListeners();
    },);
  }
}