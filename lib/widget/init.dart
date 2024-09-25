import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Init extends StatelessWidget {
  const Init({
    super.key,
    required this.child,
  });

  final Widget child;

  /// 是否深色模式
  bool isDarkMode(BuildContext context) {
    Theme.of(context);
    return View.of(context).platformDispatcher.platformBrightness ==
        Brightness.dark;
  }

  @override
  Widget build(BuildContext context) {
    /// 沉浸模式（全屏模式）
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(
      // 夜间模式：Brightness.dark
      // 日间模式：Brightness.light : false
      isDarkMode(context)
          ? SystemUiOverlayStyle.dark.copyWith(
              statusBarColor: Colors.transparent,
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.light,
              systemNavigationBarColor: Colors.transparent)
          : SystemUiOverlayStyle.light.copyWith(
              statusBarColor: Colors.transparent,
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark,
              systemNavigationBarColor: Colors.transparent,
            ),
    );
    return child;
  }
}
