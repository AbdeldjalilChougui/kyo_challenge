import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kyo_challenge/constants.dart';
import 'package:styled_widget/styled_widget.dart';

class UserEmailWidget extends StatelessWidget {
  const UserEmailWidget({
    Key? key,
    this.email,
    this.image,
    this.name,
  }) : super(key: key);
  final String? email;
  final String? name;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("assets/images/$image.png", height: 40,).clipRRect(all: 6),
          horizontalSpaceRegular,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(email!, style: const TextStyle(fontSize: 16),),
              Text(name!, style: const TextStyle(fontSize: 15, color: Colors.white,),),
            ],
          ),
          const Spacer(),
          const Icon(CupertinoIcons.delete),
          horizontalSpaceSmall,
        ],
      ),
    );
  }
}