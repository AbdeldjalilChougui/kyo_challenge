import 'package:flutter/cupertino.dart';
import 'package:kyo_challenge/constants.dart';
import 'package:styled_widget/styled_widget.dart';

class UserMessageWidget extends StatelessWidget {
  const UserMessageWidget({
    Key? key,
    this.text,
    this.image,
  }) : super(key: key);
  final String? text;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("assets/images/$image.png", height: 40,).clipRRect(all: 6),
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