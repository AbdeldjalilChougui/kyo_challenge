// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:kyo_challenge/constants.dart';
import 'package:kyo_challenge/ui/views/login/login_view.dart';
import 'package:kyo_challenge/ui/views/signup/signup_viewmodel.dart';
import 'package:kyo_challenge/ui/widgets/loader.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:stacked/stacked.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SignUpView extends HookWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fullName = useTextEditingController();
    var emailAddress = useTextEditingController();
    var password = useTextEditingController();
    var confirmPassword = useTextEditingController();

    return ViewModelBuilder<SignUpViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            children: [
              verticalSpaceMedium,
              const Text("Register", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),),
              verticalSpaceSmall,
              const Text("Welcome to Kyo assistant app, register\nto facilitate and accelrate your marketing ", style: TextStyle(color: Colors.grey, fontSize: 15),),
              verticalSpaceMedium,
              Column(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                        image: model.file == null ? const AssetImage("assets/images/upload_image.png",)
                            : FileImage(model.file!) as ImageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  verticalSpaceSmall,
                  const Text('Click to upload image'),
                ],
              ).gestures(onTap: () => model.pickImage()),
              verticalSpaceMedium,
              TextField(
                controller: fullName,
                decoration: InputDecoration(
                  hintText: 'Full Name',
                  hintStyle: const TextStyle(fontSize: 14),
                  prefixIcon: Image.asset("assets/icons/user.png"),
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
                controller: emailAddress,
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
              verticalSpaceMedium,
              TextFormField(
                controller: confirmPassword,
                obscureText: model.isObscure,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => model.validatePassword(value: value),
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  hintStyle: const TextStyle(fontSize: 14),
                  prefixIcon: Image.asset('assets/icons/lock.png'),
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
              verticalSpaceRegular,
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                  children: [
                    TextSpan(text: 'By signing up you agree to '),
                    TextSpan(text: 'our term of use\nand privacy notice', style: TextStyle(color: kMainColor,)),
                  ]
                ),
              ).center(),
              verticalSpaceLarge,
              Container(
                width: MediaQuery.of(context).size.width - 60,
                height: 50,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: kMainColor,
                ),
                child: model.isButtonLoading! ? const Loader(color: Colors.white,).center() : const Text('Sign Up', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),).center(),
              ).gestures(
                onTap: fullName.text.isNotEmpty && password.text.isNotEmpty && emailAddress.text.isNotEmpty && confirmPassword.text.isNotEmpty ? () {
                  model.signUp();
                } : password.text != confirmPassword.text ? () {
                  showMotionToast(context: context, title: 'Warning', msg: 'Password and Confirm Password does not match !!', type: MotionToastType.warning);
                } : () {
                  showMotionToast(context: context, title: 'Warning', msg: 'All fields are required', type: MotionToastType.warning);
                },
              ),
              verticalSpaceRegular,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account ? ", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 15),).center(),
                  const Text("Login", style: TextStyle(color: kMainColor, fontWeight: FontWeight.bold,),).center(),
                ],
              ).gestures(onTap: () => model.navigateTo(view: const LoginView())),
              verticalSpaceRegular,
            ],
          ),
        ),
      ),
      viewModelBuilder: () => SignUpViewModel(),
    );
  }
}
