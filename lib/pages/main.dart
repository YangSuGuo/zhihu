import 'package:flutter/material.dart';
import 'package:zhihu/widget/init.dart';

class Main extends StatelessWidget {
  const Main({
    super.key,
    required this.appBar,
    required this.body,
  });

  final AppBar appBar;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Init(
        child: Scaffold(
      appBar: appBar,
      body: body,
    ));
  }
}
