import 'package:flutter/cupertino.dart';
import 'package:kyo_challenge/constants.dart';
import 'package:styled_widget/styled_widget.dart';

class UserVocalWidget extends StatelessWidget {
  const UserVocalWidget({
    Key? key,
    this.image,
  }) : super(key: key);
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
          Image.asset("assets/images/record.png", width: screenWidthPercentage(context, percentage: 0.75)),
        ],
      ),
    );
  }
}