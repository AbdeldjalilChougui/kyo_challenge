import 'dart:async';
import 'dart:io';

import 'package:flutter/animation.dart';
import 'package:kyo_challenge/app/app.locator.dart';
import 'package:kyo_challenge/services/media_service.dart';
import 'package:kyo_challenge/services/token_service.dart';
import 'package:kyo_challenge/services/validation_service.dart';
import 'package:kyo_challenge/ui/views/home/home_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignUpViewModel extends BaseViewModel {
  bool isObscure = true;
  bool? isButtonLoading = false;
  final _navigationService = locator<NavigationService>();
  final _validationService = locator<ValidationService>();
  final _mediaService = locator<MediaService>();
  final _tokenService = locator<TokenService>();
  File? file;

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

  void pickImage () async {
    file = await _mediaService.getImage();
    if (file != null) {
      notifyListeners();
    }
  }

  String? validateEmail ({String? value}) {
    return _validationService.validateEmail(value);
  }

  setToken() {
    _tokenService.setTokenValue('token');
  }

  signUp() {
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