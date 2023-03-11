// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:kyo_challenge/constants.dart';
import 'package:kyo_challenge/ui/views/email_integration/email_integration_viewmodel.dart';
import 'package:kyo_challenge/ui/views/login/login_viewmodel.dart';
import 'package:kyo_challenge/ui/views/signup/signup_view.dart';
import 'package:kyo_challenge/ui/widgets/loader.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:stacked/stacked.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class EmailIntegrationView extends HookWidget {
  const EmailIntegrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var email = useTextEditingController();
    var password = useTextEditingController();

    return ViewModelBuilder<EmailIntegrationViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  shrinkWrap: true,
                  children: [
                    verticalSpaceMedium,
                    const Text("Email Integration", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),),
                    verticalSpaceSmall,
                    const Text("Please add you email information to send and\nreceive emails", style: TextStyle(color: Colors.grey, fontSize: 15),),
                    verticalSpaceMedium,
                    TextFormField(
                      controller: email,
                      validator: (value) => model.validateEmail(value: value),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        hintText: 'Email Address',
                        hintStyle: const TextStyle(fontSize: 14),
                        prefixIcon: Image.asset('assets/icons/sms.png'),
                        fillColor: kTextFiledGrayColor,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: kTextFiledGrayColor),
                        ),
                      ),
                    ),
                    verticalSpaceMedium,
                    TextFormField(
                      controller: password,
                      obscureText: model.isObscure,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => model.validatePassword(value: value),
                      decoration: InputDecoration(
                        hintText: 'Email Password',
                        hintStyle: const TextStyle(fontSize: 14),
                        prefixIcon: Image.asset('assets/icons/lock.png'),
                        suffixIcon: const Text('Show', style: TextStyle(fontWeight: FontWeight.bold, color: kMainColor, ),).padding(vertical: 20, horizontal: 10)
                            .gestures(
                            onTap: () {
                              model.changeObscure();
                            }
                        ),
                        fillColor: kTextFiledGrayColor,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: kTextFiledGrayColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: kMainColor,
                ),
                child: model.isButtonLoading! ? const Loader(color: Colors.white,).center() : const Text('Next', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),).center(),
              ).gestures(
                onTap: email.text.isNotEmpty && password.text.isNotEmpty ? () {
                  model.integrate();
                } : () {
                  showMotionToast(context: context, title: 'Warning', msg: 'Email Address and Email Password are required', type: MotionToastType.warning);
                },
              ).padding(all: 16),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => EmailIntegrationViewModel(),
    );
  }
}
