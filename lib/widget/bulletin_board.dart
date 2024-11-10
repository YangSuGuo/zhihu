import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../routes/app_routes.dart';

class BulletinBoard extends StatelessWidget {
  final String imgUrl;
  final Color color;
  final String title;
  final String subtitle;
  final double radius = 35;

  const BulletinBoard({
    super.key,
    required this.imgUrl,
    required this.color,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {
          context.pushNamed(RoutePath.about);
        },
        style: ButtonStyle(
            padding: WidgetStatePropertyAll(const EdgeInsets.all(16)),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
              ),
            ),
            side: WidgetStatePropertyAll(BorderSide.none),
            backgroundColor: WidgetStatePropertyAll(color)),
        child: SizedBox(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  height: 140,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(radius),
                    child: AspectRatio(
                      aspectRatio: 3.0,
                      child: Image.asset(imgUrl, fit: BoxFit.cover),
                    ),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.auto_awesome),
                        color: Theme.of(context).colorScheme.primary,
                        style: IconButton.styleFrom(
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .onPrimary
                              .withOpacity(0.95),
                        ),
                      ),
                      Gap(5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            title,
                            style: TextStyle(
                                fontSize: 17,
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontWeight: FontWeight.w500),
                          ),
                          AutoSizeText(
                            subtitle,
                            style: TextStyle(
                                fontSize: 13,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimary
                                    .withAlpha(210),
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      )
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.keyboard_arrow_right),
                    color: Theme.of(context).colorScheme.primary,
                    style: IconButton.styleFrom(
                      iconSize: 30,
                      minimumSize: Size(30, 30),
                      padding: EdgeInsets.zero,
                      backgroundColor: Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withOpacity(0.7),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
