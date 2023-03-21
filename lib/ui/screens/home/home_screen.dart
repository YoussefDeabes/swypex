import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:swypex/_base/widgets/base_stateful_widget.dart';
import 'package:swypex/api/models/movies/Results.dart';
import 'package:swypex/ui/widgets/widgets.dart';
import 'package:swypex/util/ui/feedback_controller.dart';
import 'package:swypex/util/ui/screen_controller.dart';

class HomeScreen extends BaseStatefulWidget {
  static const routeName = '/home-screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  BaseState<HomeScreen> baseCreateState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends BaseState<HomeScreen> {

  @override
  void initState() {
    super.initState();
    exitFullScreen();
    
  }


  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(child: Text("Home"),),
    );
  }

///////////////////////////////////////////////////////////
//////////////////// Widget methods ///////////////////////
///////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////
/////////////////// Helper methods ////////////////////////
///////////////////////////////////////////////////////////

}
