import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({super.key});

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('关于'),
        centerTitle: false,
        elevation: 0,
      ),
      body: ListView(
        children: [
          ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 16,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 16),
                      child: Image.asset(
                        'assets/images/icon/daily.zhihu-1024x1024.png',
                        width: 60,
                        height: 60,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "知乎日报",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Text(
                          "1.0",
                          style: Theme.of(context).textTheme.labelLarge,
                        )
                      ],
                    )
                  ],
                ),
                Gap(16.h),
                Text(
                  "使用 Flutter 开发的仿知乎日报客户端",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 31.w, top: 20.h, bottom: 8.h),
              child: AutoSizeText(
                "作者",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 34.sp,
                    fontWeight: FontWeight.w400),
              )),
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/png/ConneR.png'),
            ),
            title: const Text('楊蘇國'),
            subtitle: const Text("使用 Fluter 开发"),
            onTap: () {
              launchUrl(Uri.parse("https://github.com/YangSuGuo"));
            },
          ),
          Padding(
              padding: EdgeInsets.only(left: 31.w, top: 20.h, bottom: 8.h),
              child: AutoSizeText(
                "其他",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w400),
              )),
          ListTile(
            title: const Text("Telegram"),
            onTap: () {
              launchUrl(Uri.parse("https://t.me/dr_ysg"));
            },
            trailing: const Icon(Icons.launch),
          ),
          ListTile(
            title: const Text("项目地址"),
            onTap: () {
              launchUrl(Uri.parse("https://github.com/YangSuGuo/zhihu"));
            },
            trailing: const Icon(Icons.launch),
          ),
          ListTile(
            title: const Text("问题与反馈"),
            onTap: () {
              launchUrl(Uri.parse("https://github.com/YangSuGuo/zhihu/issues"));
            },
            trailing: const Icon(Icons.launch),
          ),
          ListTile(
              title: const Text("开放源代码证书页"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LicensePage()));
              }),
        ],
      ),
    );
  }
}
