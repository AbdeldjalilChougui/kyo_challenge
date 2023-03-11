import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kyo_challenge/constants.dart';
import 'package:kyo_challenge/ui/views/navbar/emails_screen/emails_viewmodel.dart';
import 'package:kyo_challenge/ui/widgets/user_email_widget.dart';
import 'package:stacked/stacked.dart';
import 'package:styled_widget/styled_widget.dart';

class EmailsView extends HookWidget {
  const EmailsView({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EmailsViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset("assets/images/user_pic.png"),
                  horizontalSpaceSmall,
                  horizontalSpaceTiny,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('a.boukhatem@esi-sba.dz'),
                      Text('View profile', style: TextStyle(color: kMainColor),)
                    ],
                  ),
                  const Spacer(),
                  Image.asset("assets/icons/kyo_icon.png"),
                  horizontalSpaceSmall,
                  Image.asset("assets/icons/history.png"),
                ],
              ).padding(horizontal: 10, vertical: 5),
              const Divider(thickness: 1.1, height: 1.1),
              model.emailsModel.isEmpty ? Column(
                children: [
                  verticalSpaceLarge,
                  verticalSpaceLarge,
                  verticalSpaceLarge,
                  Image.asset("assets/kyo.png", color: Colors.grey, height: 190),
                  const Text('Add emails to the  list', style: TextStyle(color: Colors.grey)).center(),
                  Container(
                    height: 50,
                    width: 150,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: kMainColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.add, color: Colors.white,),
                        horizontalSpaceSmall,
                        const Text('Email', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),).center()
                      ],
                    ),
                  ).gestures(
                    onTap: () {
                      model.showAddEmailDialog().then((value) {
                        model.addEmail(email: 'a.boukhatem98@gmail.com', name: 'Ahmed Boukhatem');
                      });
                    },
                  ).padding(all: 16),
                ],
              ) : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      verticalSpaceSmall,
                      Text('Emails', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                      Text('List of emails you want to track',),
                    ],
                  ).padding(horizontal: 15),
                  verticalSpaceSmall,
                  for (var emailModel in model.emailsModel)
                    UserEmailWidget(name: emailModel.name, email: emailModel.email, image: 'email_img1'),

                  verticalSpaceLarge,
                  verticalSpaceLarge,
                  Container(
                    height: 50,
                    width: 150,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: kMainColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.add, color: Colors.white,),
                        horizontalSpaceSmall,
                        const Text('Email', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),).center()
                      ],
                    ),
                  ).gestures(
                    onTap: () {
                      model.showAddEmailDialog().then((value) {
                        model.addEmail(email: 'a.boukhatem98@gmail.com', name: 'Ahmed Boukhatem');
                      });
                    },
                  ).center().padding(all: 16),
                ],
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => EmailsViewModel(),
    );
  }
}