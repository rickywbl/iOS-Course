import 'package:flutter/material.dart';
import './pages/splash/splash_widget.dart';
import './pages/contain_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  RestartWidget(
      child: MaterialApp(
        theme: ThemeData(
          backgroundColor: Colors.white,
          splashColor: Color.fromARGB(0, 255, 255, 255),
          highlightColor:Color.fromARGB(0, 255, 255, 255), 
          ),
        home: Scaffold(
          resizeToAvoidBottomPadding: false,
          body: ContainerPage(),
        ),
      ),
    );
  }
}


class RestartWidget extends StatefulWidget {
  final Widget child;
  RestartWidget({Key key , @required this.child}) : assert(child != null), super(key : key);

  static restartApp(BuildContext context){
    final _RestartWidgetState state = 
    context.ancestorStateOfType(const TypeMatcher<_RestartWidgetState>());
    state.restartApp();
  }

    @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp(){
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      child: widget.child,
    );
  }
}