import 'dart:io';

import 'package:flutter_one/utils/high_light_code.dart';
import 'package:flutter_one/widgets/components/flutter_markdown/lib/src/style_sheet.dart';

import '../components/flutter_markdown/lib/flutter_markdown.dart' as md;
import 'package:flutter/material.dart';


/// 使用方法
/// MarkdownBody(markdown)
final hightlighter = new HighLight();

class HighLight extends md.SyntaxHighlighter {
  @override
  TextSpan format(String source) {
    final SyntaxHighlighterStyle style =
        SyntaxHighlighterStyle.lightThemeStyle();
    return TextSpan(
        style: const TextStyle(fontSize: 10.0),
        children: <TextSpan>[DartSyntaxHighlighter(style:style).format(source)]);
  }
}

class MarkdownBody extends StatelessWidget {
  final String data;
  MarkdownBody(this.data);
  @override
  Widget build(BuildContext context) {
    return md.MarkdownBody(data: data,
        styleSheet:MarkdownStyleSheet.fromTheme(Theme.of(context)),
        onTapLink: (href){

        },
        imageDirectory: Directory.current,
        syntaxHighlighter: HighLight());
  }
}
