import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:swypex/_base/widgets/base_stateful_widget.dart';
import 'package:swypex/res/ass_path.dart';
import 'package:swypex/res/const_colors.dart';
import 'package:swypex/ui/screens/home/home_screen.dart';
import 'package:swypex/util/ui/screen_controller.dart';

class SplashScreen extends BaseStatefulWidget {
  static const routeName = '/splash';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _SplashScreenState();
}

class _SplashScreenState extends BaseState<SplashScreen> {
  @override
  void initState() {
    /// to make full screen
    enterFullScreen();

    /// to start time to switch to another screen
    _startTime();

    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.movieCardBackground,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Lottie.asset(
            AssPath.appLogo,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  void _startTime() async {
    var _duration = const Duration(milliseconds: 3000);
    Timer(_duration, _goToNextScreen);
  }

  Future _goToNextScreen() async {
    Navigator.of(context).pushNamedAndRemoveUntil(
      HomeScreen.routeName,
      (Route<dynamic> route) => false,
    );
  }
}
