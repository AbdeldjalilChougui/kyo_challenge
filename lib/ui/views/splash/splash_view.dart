import 'package:flutter/material.dart';
import 'package:kyo_challenge/constants.dart';
import 'package:kyo_challenge/ui/views/splash/splash_viewmodel.dart';
import 'package:kyo_challenge/ui/widgets/loader.dart';
import 'package:stacked/stacked.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        backgroundColor: kMainColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            verticalSpaceMedium,
            Image.asset("assets/kyo.png", color: Colors.white),
            const Loader(color: Colors.white),
          ],
        ),
      ),
      viewModelBuilder: () => SplashViewModel(),
      onModelReady: (model) => model.startAnimation(),
    );
  }
}
