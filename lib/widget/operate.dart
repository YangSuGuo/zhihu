import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import 'package:zhihu/widget/itemIconButton.dart';

import '../model/commentsinfo_model.dart';

class OperateBar extends StatelessWidget {
  final bool stars;
  final String url;
  final AnimationController ctrl;
  final InAppWebViewController? webViewController;
  final CommentInfoData? comments;
  final Function(bool) onStarChange;
  final VoidCallback onPressed;

  const OperateBar({
    super.key,
    this.stars = false,
    required this.url,
    required this.ctrl,
    this.webViewController,
    this.comments,
    required this.onStarChange,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120.h,
        color: Theme.of(context).colorScheme.surface,
        padding: const EdgeInsets.only(bottom: 10),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 4),
                child: IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                )),
            const SizedBox(
              width: 1,
              height: 30,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.grey),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // 评论
                  Itemiconbutton(
                    icon: Icons.messenger_outline,
                    onPressed: onPressed,
                    data: comments?.comments.toString(),
                  ),
                  // 收藏动画
                  IconButton(
                    icon: const Icon(
                      Icons.star_border_rounded,
                      size: 28,
                    ),
                    splashColor: Colors.transparent,
                    color: stars ? Colors.deepOrange : Theme.of(context).colorScheme.onSurface,
                    onPressed: () => onStarChange(!stars),
                  ),
                  // 刷新按钮
                  RotationTransition(
                      turns: CurvedAnimation(parent: ctrl, curve: Curves.linear),
                      child: IconButton(
                        icon: const Icon(Icons.loop),
                        onPressed: () {
                          ctrl.forward(from: 0);
                          webViewController?.reload();
                        },
                      )),
                  IconButton(
                    icon: const Icon(Icons.share_rounded),
                    onPressed: () => Share.share(url),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
