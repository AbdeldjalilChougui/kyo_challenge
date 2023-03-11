import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:kyo_challenge/app/app.locator.dart';
import 'package:kyo_challenge/services/token_service.dart';
import 'package:kyo_challenge/services/validation_service.dart';
import 'package:kyo_challenge/ui/views/home/home_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  bool isObscure = true;
  final _navigationService = locator<NavigationService>();
  final _validationService = locator<ValidationService>();
  final _tokenService = locator<TokenService>();
  bool? value = false;
  bool? isButtonLoading = false;

  void changeObscure() {
    isObscure = !isObscure;
    notifyListeners();
  }

  void navigateTo({view}) {
    _navigationService.navigateWithTransition(view, curve: Curves.easeIn, duration: const Duration(milliseconds: 300));
  }

  void clearAndNavigateTo({view}) {
    _navigationService.clearStackAndShowView(view,);
  }


  String? validatePassword ({String? value}) {
    return _validationService.passwordValidation(value);
  }

  changeCheckState() {
    value = !value!;
    notifyListeners();
  }

  String? validateEmail ({String? value}) {
    return _validationService.validateEmail(value);
  }

  setToken() {
    _tokenService.setTokenValue('token');
  }

  login() {
    isButtonLoading = true;
    notifyListeners();
    Timer(const Duration(milliseconds: 1500), () {
      isButtonLoading = false;
      notifyListeners();
      navigateTo(view: const HomeView());
    });
    setToken();
  }
}