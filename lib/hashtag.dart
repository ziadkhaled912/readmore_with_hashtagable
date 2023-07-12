class Hashtag {
  final String? _value;
  String? get value => _value;

  /// construct link from matched regExp
  Hashtag.fromMatch(RegExpMatch match)
      : _value = match.input.substring(match.start, match.end);
}
