import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:zhihu/db/database/dao/stars_dao.dart';
import 'package:zhihu/db/database/entity/stars.dart';
import 'package:zhihu/http/api/stories_model.dart';
import 'package:zhihu/model/commentsinfo_model.dart';
import 'package:zhihu/routes/app_routes.dart';
import 'package:zhihu/widget/operate.dart';

class BodyContent extends ConsumerStatefulWidget {
  const BodyContent({
    super.key,
    required this.id,
    required this.stars,
  });

  final String id;
  final Stars stars;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BodyContentState();
}

class _BodyContentState extends ConsumerState<BodyContent> with TickerProviderStateMixin {
  /// 文章
  CommentInfoData? comments; // 评论信息
  int id = 9766161; // 初始值 id
  bool stars = false; // 收藏状态

  // webview
  final urlController = TextEditingController();
  final GlobalKey webViewKey = GlobalKey();
  InAppWebViewController? webViewController;
  late PullToRefreshController pullToRefreshController;
  late InAppWebViewSettings options;

  // 评论 收藏初始化
  Future<void> initialData(int id) async {
    CommentInfoData data = await ref.read(getCommentsInfoProvider(id).future); // 评论数据
    final bool result = await ref.read(isSavedProvider(id).future); // 收藏状态
    setState(() {
      stars = result;
      comments = data;
    });
  }

  @override
  void initState() {
    super.initState();
    id = int.parse(widget.id);
    initialData(id);
    // 浏览器设置
    options = InAppWebViewSettings(
        mediaPlaybackRequiresUserGesture: false,
        verticalScrollBarEnabled: false,
        transparentBackground: true,
        algorithmicDarkeningAllowed: true,
        // underPageBackgroundColor: ,
        // clearCache: true,
        contentBlockers: [
          ContentBlocker(
              trigger: ContentBlockerTrigger(urlFilter: ".*"),
              action:
                  ContentBlockerAction(type: ContentBlockerActionType.CSS_DISPLAY_NONE, selector: '.Daily,.view-more'))
        ]);
    // 浏览器下拉刷新操作
    pullToRefreshController = PullToRefreshController(
      onRefresh: () async {
        if (Platform.isAndroid) {
          webViewController?.reload();
        } else if (Platform.isIOS) {
          webViewController?.loadUrl(urlRequest: URLRequest(url: await webViewController?.getUrl()));
        }
      },
    );
  }

  @override
  void dispose() {
    // 销毁 WebView
    if (webViewController != null) {
      // webViewController?.clearCache(); // 尝试清理缓存
      // webViewController!.clearAllCache(); // 尝试清理缓存
      webViewController?.dispose(); // 释放 WebView
      webViewController = null; // 设置为 null，防止后续误用
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Expanded(
          child: Padding(
        padding: const EdgeInsets.only(top: 40),
        // 用于添加集成到 flutter widget 树中的内联原生 WebView
        child: InAppWebView(
          key: webViewKey,
          initialUrlRequest: URLRequest(url: WebUri("https://daily.zhihu.com/story/$id")),
          initialSettings: options,
          pullToRefreshController: pullToRefreshController,
          onWebViewCreated: (controller) {
            webViewController = controller;
          },
          onLoadStart: (controller, url) async {},
          onLoadStop: (controller, url) async {
            pullToRefreshController.endRefreshing();
          },
        ),
      )),
      OperateBar(
        stars: stars,
        url: 'https://daily.zhihu.com/story/$id',
        ctrl: AnimationController(vsync: this, duration: const Duration(seconds: 1)),
        comments: comments,
        webViewController: webViewController,
        // 收藏事件
        onStarChange: (newStarState) async {
          newStarState ? ref.read(insertStarsProvider(widget.stars)) : ref.read(deleteStarsProvider(id));
          setState(() => stars = newStarState);
        },
        // 评论事件
        onPressed: () {
          if (comments!.comments != 0) {
            context.pushNamed(RoutePath.comments, pathParameters: {"id": id.toString()}, extra: comments);
          }
        },
      )
    ]));
  }
}
