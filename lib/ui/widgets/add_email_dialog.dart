import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kyo_challenge/constants.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:styled_widget/styled_widget.dart';

class AddEmailDialog extends HookWidget {
  final DialogRequest? dialogRequest;
  final Function(DialogResponse)? onDialogTap;
  const AddEmailDialog({Key? key, this.dialogRequest, this.onDialogTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fullName = useTextEditingController();
    var emailAddress = useTextEditingController();

    return Container(
      width: screenWidthPercentage(context, percentage: 0.95),
      height: 380,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          verticalSpaceSmall,
          Image.asset("assets/icons/sms.png"),
          verticalSpaceSmall,
          const Text('Adding email', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),).center(),
          verticalSpaceSmall,
          const Text('by adding this email address you will give the\nkyo assistant to receive all the emails from this address', style: TextStyle(color: Colors.grey),).center(),
          verticalSpaceRegular,
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
          verticalSpaceSmall,
          TextFormField(
            controller: emailAddress,
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
          verticalSpaceSmall,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 50,
                width: screenWidthPercentage(context, percentage: 0.29),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                  border: Border.all(color: kMainColor),
                ),
                child: const Text('Cancel', style: TextStyle(color: kMainColor, fontSize: 16, fontWeight: FontWeight.w500),).center(),
              ).gestures(
                onTap: () {
                  onDialogTap!(DialogResponse(data: false,));
                },
              ).padding(all: 16),
              Container(
                height: 50,
                width: screenWidthPercentage(context, percentage: 0.29),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: kMainColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.add, color: Colors.white,),
                    horizontalSpaceSmall,
                    const Text('Add', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),).center()
                  ],
                ),
              ).gestures(
                onTap: () {
                  onDialogTap!(DialogResponse(data: true,));
                },
              ).padding(all: 16),
            ],
          ),
        ],
      ).padding(vertical: 8, horizontal: 10),
    );
  }
}