import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:zhihu/pages/home/daily_report.dart';
import 'package:zhihu/pages/main.dart';
import 'package:zhihu/routes/app_routes.dart';
import 'package:zhihu/widget/bulletin_board.dart';
import 'package:zhihu/widget/page_button.dart';
import 'package:zhihu/widget/show_modal_bottom_detail.dart';

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
        title: const Text('知乎日报', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(
                onPressed: () {
                  showModalBottomDetail(
                      height: 380,
                      context: context,
                      child: Padding(
                          padding: EdgeInsets.only(
                              bottom: 28.h, left: 24.w, right: 24.w),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                BulletinBoard(
                                  imgUrl:
                                      "assets/images/png/macos_3840x2160.jpg",
                                  color: colorScheme.primary,
                                  title: "知乎日报",
                                  subtitle: "关于APP的介绍",
                                ),
                                Row(
                                  children: [
                                    Flexible(
                                        child: PageButton(
                                      onPressed: () {
                                        context.pop();
                                        context.pushNamed(
                                            RoutePath.historyFavorites,
                                            pathParameters: {"title": "历史记录"});
                                      },
                                      color:
                                          colorScheme.primary.withOpacity(0.85),
                                      title: "历史记录",
                                      icon: Icons.access_time,
                                    )),
                                    Gap(10),
                                    Flexible(
                                        child: PageButton(
                                      onPressed: () {
                                        context.pop();
                                        context.pushNamed(
                                            RoutePath.historyFavorites,
                                            pathParameters: {"title": "收藏记录"});
                                      },
                                      color:
                                          colorScheme.primary.withOpacity(0.85),
                                      title: "收藏记录",
                                      icon: Icons.egg_alt,
                                    )),
                                  ],
                                )
                              ])));
                },
                icon: const Icon(Icons.settings, size: 26),
                tooltip: '设置',
              ))
        ],
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        leading: leadingTime(colorScheme),
      ),
      body: const Daily(),
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
                  style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
                Text(DateFormat('MM月').format(dateTime),
                    style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
              ])),
      const SizedBox(
          width: 1,
          height: 40,
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.grey),
          ))
    ]);
  }
}
