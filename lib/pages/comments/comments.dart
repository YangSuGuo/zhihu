import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:zhihu/http/api/stories_model.dart';
import 'package:zhihu/model/commentsinfo_model.dart';
import 'package:zhihu/widget/comment_widget.dart';

class Comments extends ConsumerWidget {
  final String id;
  final CommentInfoData comments;

  const Comments({
    super.key,
    required this.id,
    required this.comments,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        elevation: 0,
        title: Text('${comments.comments} 条评论'),
      ),
      body: ListView(children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          if (comments.longComments != 0)
            CommentsWidget(id: id, isShort: false),
          if (comments.shortComments != 0)
            CommentsWidget(id: id, isShort: true),
        ])
      ]),
    );
  }
}

class CommentsWidget extends ConsumerWidget {
  final String id;
  final bool isShort;

  const CommentsWidget({super.key, required this.id, required this.isShort});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commentsAsync = ref.watch(getCommentsProvider(id, isShort));

    return commentsAsync.when(
      data: (comments) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 0),
              child: Text(
                '${comments.length} 条评论',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: comments.length,
              itemBuilder: (BuildContext context, int index) {
                return CommentWidget(comment: comments[index]);
              },
            ),
          ],
        );
      },
      loading: () =>
          Center(child: LoadingAnimationWidget.waveDots(color: Theme.of(context).colorScheme.primary, size: 50)),
      error: (Object err, StackTrace stack) {
        log('${err.toString()}\n$stack');
        return Text('Error: ${err.toString()}');
      },
    );
  }
}
