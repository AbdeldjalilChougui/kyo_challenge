import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kyo_challenge/constants.dart';
import 'package:kyo_challenge/ui/views/navbar/chat_screen/chat_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:styled_widget/styled_widget.dart';

class ChatView extends HookWidget {
  const ChatView({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var message = useTextEditingController();

    return ViewModelBuilder<ChatViewModel>.reactive(
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
              Expanded(
                child: Stack(
                  children: [
                    ListView(
                      shrinkWrap: true,
                      children: model.messages.isEmpty ? [
                        verticalSpaceLarge,
                        verticalSpaceLarge,
                        verticalSpaceLarge,
                        Image.asset("assets/kyo.png", color: Colors.grey, height: 190),
                        const Text('Start a chat with kyo', style: TextStyle(color: Colors.grey)).center(),
                      ] : model.messages,
                    ),
                    Positioned(
                      bottom: 15,
                      right: 10,
                      child: FloatingActionButton(
                        onPressed: () => model.integrateEmail(context: context,),
                        backgroundColor: Colors.blue,
                        child: Image.asset("assets/icons/sms.png", color: Colors.white,),
                      ),
                    ),
                  ],
                ),
              ),

              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: message,
                      decoration: InputDecoration(
                        hintText: 'Start chat...',
                        hintStyle: const TextStyle(fontSize: 14),
                        suffixIcon: Image.asset("assets/icons/send.png").gestures(onTap: () {
                          model.addMessage(text: message.text);
                          message.clear();
                        }),
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: kTextFiledGrayColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ).padding(horizontal: 16, vertical: 8),
                  ),
                  Image.asset("assets/icons/vocal.png",).gestures(onTap: () {
                    model.addVocal();
                  }),
                  horizontalSpaceRegular,
                ],
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => ChatViewModel(),
    );
  }
}