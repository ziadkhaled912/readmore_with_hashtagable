import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:readmore/hashtag.dart';

typedef HashtagOnTap = void Function(String?);

String hashtagRegExp = r'(#+[a-zA-Z0-9(_)]{1,})';

RegExp getHashtagRegExp() {
  return RegExp(hashtagRegExp);
}

TextSpan getHashTagText(
  String text, {
  TextStyle? effectiveTextStyle,
  TextStyle? hashtagStyle,
  HashtagOnTap? onTap,
}) {
  final _regExp = getHashtagRegExp();

  if (!_regExp.hasMatch(text) || text.isEmpty) return TextSpan(text: text);
  final texts = text.split(_regExp);
  List<InlineSpan> spans = [];
  final hashtags = _regExp.allMatches(text).toList();

  for (final text in texts) {
    spans.add(TextSpan(
      text: text,
      style: effectiveTextStyle ?? TextStyle(),
    ));
    if (hashtags.isNotEmpty) {
      final match = hashtags.removeAt(0);
      final hashtag = Hashtag.fromMatch(match);

      spans.add(TextSpan(
        text: hashtag.value,
        style: hashtagStyle ?? TextStyle(),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            if (onTap != null)
              onTap.call(hashtag.value ?? '');
          },
      ));
    }
  }
  return TextSpan(children: spans);
}
