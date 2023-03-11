import 'package:flutter/cupertino.dart';
import 'package:kyo_challenge/constants.dart';
import 'package:kyo_challenge/enum/dialog_type.dart';
import 'package:kyo_challenge/models/email_model.dart';
import 'package:kyo_challenge/services/token_service.dart';
import 'package:kyo_challenge/ui/widgets/user_email_widget.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:stacked/stacked.dart';
import 'package:kyo_challenge/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

class EmailsViewModel extends BaseViewModel {
  String? text;
  bool? isDone = false;
  List<EmailModel> emailsModel = [];
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _tokenService = locator<TokenService>();

  void navigateTo({view, context}) {
    _navigationService.navigateToView(view)!.then((value) {
      showMotionToast(context: context, msg: 'Email Integrated', title: 'Email Integrated Successfully', type: MotionToastType.success);
    });
  }

  Future<bool?> showAddEmailDialog() async {
    var result = await _dialogService.showCustomDialog(
      variant: DialogType.addEmail,
    );

    if (result!.confirmed) {
      return true;
    }

    return false;
  }


  void addEmail({String? email, String? name}) async {
    emailsModel.add(EmailModel(email: email!, name: name,));

    notifyListeners();
  }
}