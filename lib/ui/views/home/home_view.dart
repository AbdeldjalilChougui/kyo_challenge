import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:kyo_challenge/constants.dart';
import 'package:kyo_challenge/ui/views/home/home_viewmodel.dart';
import 'package:kyo_challenge/ui/views/navbar/chat_screen/chat_view.dart';
import 'package:kyo_challenge/ui/views/navbar/emails_screen/emails_view.dart';
import 'package:kyo_challenge/ui/widgets/loader.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: model.isBusy ? const Loader() : PageTransitionSwitcher(
          duration: const Duration(milliseconds: 300),
          reverse: model.reverse,
          transitionBuilder: (
              Widget child,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              ) {
            return SharedAxisTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.horizontal,
              child: child,
            );
          },
          child: getViewForIndex(index: model.currentIndex,),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedLabelStyle: const TextStyle(color: kMainColor),
          currentIndex: model.currentIndex,
          onTap: model.setIndex,
          items: [
            BottomNavigationBarItem(
              label: 'emails',
              icon: Image.asset("assets/icons/sms.png", color: model.currentIndex == 0 ? kMainColor : Colors.black),
            ),
            BottomNavigationBarItem(
              label: 'chat',
              icon: Image.asset("assets/icons/message.png", color: model.currentIndex == 1 ? kMainColor : Colors.black),
            ),
            BottomNavigationBarItem(
              label: 'settings',
              icon: Image.asset("assets/icons/settings.png", color: model.currentIndex == 2 ? kMainColor : Colors.black),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }

  Widget getViewForIndex({int? index,}) {
    switch (index) {
      case 0:
        return const EmailsView();
      case 1:
        return const ChatView();
      case 2:
        return Container();
      default:
        return Container();
    }
  }
}
