abstract class Api {
  // 知乎日报 列表
  static const String zhihuList = 'stories/latest';

  // 知乎日报 正文 {id}
  static const String zhihuBody = 'story/';

  // 知乎日报 过去的 {yyyyMMdd}
  static const String zhihuOldList = 'stories/before/';

  // 知乎日报 评论信息 {id}
  static const String zhihuCommentsInfo = 'story-extra/';

  // 知乎日报 长评论 {id}
  static const String zhihuComments = '/long-comments';

  // 知乎日报 短评论 {id}
  static const String zhihuShortComments = '/short-comments';
}
