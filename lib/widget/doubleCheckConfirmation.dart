import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

/// 导航返回拦截
class DoubleCheckConfirmation extends StatefulWidget {
  final Widget child;

  const DoubleCheckConfirmation({super.key, required this.child});

  @override
  State<DoubleCheckConfirmation> createState() =>
      _DoubleCheckConfirmationState();
}

class _DoubleCheckConfirmationState extends State<DoubleCheckConfirmation> {
  DateTime? lastPressedAt; //上次点击时间

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (didPop) return;
        SmartDialog.showToast("再按一次退出");
        if (lastPressedAt == null ||
            DateTime.now().difference(lastPressedAt!) >
                const Duration(seconds: 1)) {
          // 两次点击间隔超过1秒则重新计时
          lastPressedAt = DateTime.now();
          return;
        }
        SystemNavigator.pop();
      },
      child: widget.child,
    );
  }
}
