// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:kyo_challenge/constants.dart';
import 'package:kyo_challenge/ui/views/login/login_viewmodel.dart';
import 'package:kyo_challenge/ui/views/signup/signup_view.dart';
import 'package:kyo_challenge/ui/widgets/loader.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:stacked/stacked.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginView extends HookWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var email = useTextEditingController();
    var password = useTextEditingController();

    return ViewModelBuilder<LoginViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              verticalSpaceMedium,
              const Text("Login", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),),
              verticalSpaceSmall,
              const Text("login with your account to start manage\nyour marketing using our smart assistant", style: TextStyle(color: Colors.grey, fontSize: 15),),
              verticalSpaceMedium,
              Image.asset("assets/kyo.png", color: kMainColor, height: 190),
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
                  hintText: 'Password',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        onChanged: (value) => model.changeCheckState(),
                        value: model.value,
                        activeColor: kMainColor,
                      ).padding(all: 0),
                      const Text("Remember me"),
                    ],
                  ),
                  const Text('Forgot Password?', style: TextStyle(fontWeight: FontWeight.w500, color: kMainColor, fontSize: 15),)
                      .alignment(Alignment.centerRight).gestures(onTap: () {}),
                ],
              ),
              verticalSpaceMedium,
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: kMainColor,
                ),
                child: model.isButtonLoading! ? const Loader(color: Colors.white,).center() : const Text('Login', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),).center(),
              ).gestures(
                onTap: email.text.isNotEmpty && password.text.isNotEmpty ? () {
                  model.login();
                } : () {
                  showMotionToast(context: context, title: 'Warning', msg: 'Email and Password are required', type: MotionToastType.warning);
                },
              ),
              verticalSpaceRegular,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account ? ", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 15),).center(),
                  const Text("Sign Up", style: TextStyle(color: kMainColor, fontWeight: FontWeight.bold,),).center(),
                ],
              ).gestures(onTap: () => model.navigateTo(view: const SignUpView())),
              verticalSpaceRegular,
            ],
          ),
        ),
      ),
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}
