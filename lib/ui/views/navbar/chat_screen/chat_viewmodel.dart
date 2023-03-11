import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:kyo_challenge/constants.dart';
import 'package:kyo_challenge/services/token_service.dart';
import 'package:kyo_challenge/ui/views/email_integration/email_integration_view.dart';
import 'package:kyo_challenge/ui/widgets/kyo_message_widget.dart';
import 'package:kyo_challenge/ui/widgets/loader.dart';
import 'package:kyo_challenge/ui/widgets/user_message_widget.dart';
import 'package:kyo_challenge/ui/widgets/user_vocal_widget.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:stacked/stacked.dart';
import 'package:kyo_challenge/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

class ChatViewModel extends BaseViewModel {
  String? text;
  bool? isDone = false;
  List<Widget> messages = [];
  final _navigationService = locator<NavigationService>();
  final _tokenService = locator<TokenService>();

  void navigateTo({view, context}) {
    _navigationService.navigateToView(view)!.then((value) {
      showMotionToast(context: context, msg: 'Email Integrated', title: 'Email Integrated Successfully', type: MotionToastType.success);
    });
  }

  Future<bool?>? getIsEmailIntegrated() async {
    return await _tokenService.getIsIntegratedValue();
  }

  integrateEmail({context,}) async {
    bool? isEmailIntegrated = await getIsEmailIntegrated() ?? false;
    if (isEmailIntegrated) {

    } else {
      navigateTo(context: context, view: const EmailIntegrationView());
    }
  }

  void addMessage({String? text}) async {
    messages.addAll([
      UserMessageWidget(text: text!, image: "email_img1"),
      const KyoMessageWidget(text: "Quantum computing is a type of computing where information is processed using quantum-mechanical phenomena, such as superposition and entanglement. In traditional computing, information is processed using bits, which can have a value of either 0 or 1. In quantum computing, information is processed using quantum bits, or qubits, which can  ",),
    ]);

    notifyListeners();
    notifyListeners();
    // messages.add(
    //   const Loader(color: kMainColor),
    // );
    //
    //
    // await Future.delayed(const Duration(milliseconds: 10), () {
    //   addResponse();
    //   notifyListeners();
    // },);
  }

  addResponse() {
    messages.removeLast();

    messages.add(
      const KyoMessageWidget(text: "Quantum computing is a type of computing where information is processed using quantum-mechanical phenomena, such as superposition and entanglement. In traditional computing, information is processed using bits, which can have a value of either 0 or 1. In quantum computing, information is processed using quantum bits, or qubits, which can  ",),
    );

    notifyListeners();
  }


  void addVocal() async {
    messages.addAll([
      const UserVocalWidget(image: "email_img1"),
      const KyoMessageWidget(text: "Quantum computing is a type of computing where information is processed using quantum-mechanical phenomena, such as superposition and entanglement. In traditional computing, information is processed using bits, which can have a value of either 0 or 1. In quantum computing, information is processed using quantum bits, or qubits, which can  ",),
    ]);

    notifyListeners();
    notifyListeners();

    // messages.add(
    //   const Loader(color: kMainColor),
    // );
    //
    //
    // await Future.delayed(const Duration(milliseconds: 10), () {
    //   addResponse();
    //   notifyListeners();
    // },);
  }
}