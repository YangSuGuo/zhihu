import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:zhihu/pages/daily_report/daily_report.dart';
import 'package:zhihu/pages/main.dart';
import 'package:zhihu/widget/show_modal_bottom_detail.dart';
import 'package:zhihu/widget/theme_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Main(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        leadingWidth: 60,
        title: const Text('知乎日报',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(
                onPressed: () {
                  showModalBottomDetail(
                    height: 400,
                    context: context,
                    child: ListView(
                        physics: const AlwaysScrollableScrollPhysics(
                          parent: BouncingScrollPhysics(),
                        ),
                        padding: EdgeInsets.only(
                            bottom: 28.h, left: 24.w, right: 24.w),
                        children: _buildTheme(colorScheme)),
                  );
                },
                icon: const Icon(Icons.settings, size: 26),
                tooltip: '设置',
              ))
        ],
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        leading: leadingTime(colorScheme),
      ),
      body: const DailyReport(),
    );
  }

  /// 日期显示
  Widget leadingTime(ColorScheme colorScheme) {
    DateTime dateTime = DateTime.now();
    return Row(children: [
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  DateFormat('dd').format(dateTime),
                  style: const TextStyle(
                      fontSize: 23, fontWeight: FontWeight.bold),
                ),
                Text(DateFormat('MM月').format(dateTime),
                    style: const TextStyle(
                        fontSize: 11, fontWeight: FontWeight.bold)),
              ])),
      const SizedBox(
          width: 1,
          height: 40,
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.grey),
          ))
    ]);
  }

  List<Widget> _buildTheme(ColorScheme colorScheme) {
    final List<Widget> children;
    children = [
      /// 主题外观设置
      AutoSizeText(
        "主题外观",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 42.sp,
            color: colorScheme.secondary),
      ),
      Gap(16.h),
      Wrap(
        alignment: WrapAlignment.spaceBetween,
        direction: Axis.horizontal,
        // spacing: 50.w,
        children: [
          ThemeCard(
              title: "跟随系统",
              selected: false,
              width: 210.w,
              height: 110.h,
              borderCurvature: 24.5.r,
              containerCurvature: 20.r,
              showBorder: true,
              iconOffset: EdgeInsets.only(right: 12.w, bottom: 10.h),
              isExplanationText: true,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      color: colorScheme.scrim,
                      child: Text(
                        'Aa',
                        style: TextStyle(
                          // color: AppThemeColorScheme.lightDefaultScheme().onSecondary,
                          fontWeight: FontWeight.bold,
                          fontSize: 32.sp,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      // color: AppThemeColorScheme.lightDefaultScheme().onPrimary,
                      child: Text(
                        'Aa',
                        style: TextStyle(
                          // color: AppThemeColorScheme.lightDefaultScheme()
                          //     .secondary,
                          fontWeight: FontWeight.bold,
                          fontSize: 32.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              onTap: () {}),
          ThemeCard(
              title: "日间模式",
              selected: false,
              width: 210.w,
              height: 110.h,
              borderCurvature: 24.5.r,
              containerCurvature: 20.r,
              showBorder: true,
              iconOffset: EdgeInsets.only(right: 12.w, bottom: 10.h),
              isExplanationText: true,
              child: Container(
                alignment: Alignment.center,
                // color: AppThemeColorScheme.lightDefaultScheme().onPrimary,
                child: Text(
                  'Aa',
                  style: TextStyle(
                    // color: AppThemeColorScheme.lightDefaultScheme().secondary,
                    fontWeight: FontWeight.bold,
                    fontSize: 36.sp,
                  ),
                ),
              ),
              onTap: () {
                HapticFeedback.lightImpact();
              }),
          ThemeCard(
              title: "夜间模式",
              selected: false,
              width: 210.w,
              height: 110.h,
              borderCurvature: 24.5.r,
              containerCurvature: 20.r,
              showBorder: true,
              iconOffset: EdgeInsets.only(right: 12.w, bottom: 10.h),
              isExplanationText: true,
              child: Container(
                alignment: Alignment.center,
                color: colorScheme.scrim,
                child: Text(
                  'Aa',
                  style: TextStyle(
                    // color: AppThemeColorScheme.lightDefaultScheme().onSecondary,
                    fontWeight: FontWeight.bold,
                    fontSize: 36.sp,
                  ),
                ),
              ),
              onTap: () {
                HapticFeedback.lightImpact();
              }),
        ],
      ),
      Gap(24.h),
    ];
    return children;
  }
}
