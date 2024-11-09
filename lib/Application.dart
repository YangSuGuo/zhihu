import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:zhihu/routes/app_routes.dart';
import 'package:zhihu/themes/app_theme.dart';

class Application extends ConsumerWidget {
  late ColorScheme lightColorScheme;
  late ColorScheme darkColorScheme;

  Application({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DynamicColorBuilder(builder: ((ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
      lightColorScheme = lightDynamic?.harmonized() ?? AppTheme.defaultLightColorScheme;
      darkColorScheme = darkDynamic?.harmonized() ?? AppTheme.defaultLightColorScheme;

      return ScreenUtilInit(
          // 屏幕适配
          designSize: const Size(750.0, 1334.0),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp.router(
              title: "知乎日报",
              // 主题
              themeMode: ThemeMode.system,
              theme: AppTheme.themeUtils(lightColorScheme),
              darkTheme: AppTheme.themeUtils(darkColorScheme),
              // 路由
              routerConfig: ref.watch(goRouterProvider),
              builder: FlutterSmartDialog.init(),
              debugShowCheckedModeBanner: false,
            );
          });
    }));
  }
}
