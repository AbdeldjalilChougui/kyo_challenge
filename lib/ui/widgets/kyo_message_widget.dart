import 'package:flutter/cupertino.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:flutter/material.dart';
import 'package:kyo_challenge/constants.dart';

class KyoMessageWidget extends StatelessWidget {
  const KyoMessageWidget({
    Key? key,
    this.text,
  }) : super(key: key);
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: kMainDisabledGray,
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: kMainColor,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Image.asset("assets/icons/kyo_icon.png", color: Colors.white,).center(),
          ),
          horizontalSpaceRegular,
          SizedBox(
            width: screenWidthPercentage(context, percentage: 0.75),
            child: Text(text!, style: const TextStyle(fontSize: 18),),
          ),
        ],
      ),
    );
  }
}