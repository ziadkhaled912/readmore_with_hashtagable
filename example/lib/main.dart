import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF02BB9F),
        primaryColorDark: const Color(0xFF167F67),
      ),
      title: 'Read More Text',
      home: DemoApp(),
    );
  }
}

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Read More Text',
        style: TextStyle(color: Colors.white),
      )),
      body: DefaultTextStyle.merge(
        style: const TextStyle(
          fontSize: 16.0,
          //fontFamily: 'monospace',
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                key: const Key('showMore'),
                padding: const EdgeInsets.all(16.0),
                child: ReadMoreText.hashtagable(
                  'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                  trimLines: 2,
                  // preDataText: "AMANDA",
                  // preDataTextStyle: TextStyle(fontWeight: FontWeight.w500),
                  style: TextStyle(color: Colors.red),
                  colorClickableText: Colors.pink,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: '...Show more',
                  trimExpandedText: ' show less',
                  hashtagStyle: TextStyle(color: Colors.black), onHashtagTap: (String? value) {  },
                ),
              ),
              ReadMoreText.hashtagable(
                "attributes #das dsalfdlksjf fdklsjflksfe kjfdlsk",
                trimMode: TrimMode.Line,
                // colorClickableText: Colors.yellow,
                trimCollapsedText: "less",
                trimExpandedText: "\nmore",
                // lessStyle: _buttonStyle(context),
                // moreStyle: _buttonStyle(context),
                style: TextStyle(
                  // fontSize: 12,
                  // fontWeight: FontWeight.w400,
                  // height: 18/12,
                  color: Colors.red,
                ),
                hashtagStyle: null,
                onHashtagTap: (text) {
                  // context.router.push(VideoSearchRoute(hashtag: text));
                },
              ),
              Divider(
                color: const Color(0xFF167F67),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ReadMoreText(
                  'Flutter has its own UI components, along with an engine to render them on both the Android and iOS platforms. Most of those UI components, right out of the box, conform to the guidelines of Material Design.',
                  trimLines: 3,
                  style: TextStyle(color: Colors.black),
                  colorClickableText: Colors.pink,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: '...Expand',
                  trimExpandedText: ' Collapse ',
                ),
              ),
              Divider(
                color: const Color(0xFF167F67),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ReadMoreText(
                  'The Flutter framework builds its layout via the composition of widgets, everything that you construct programmatically is a widget and these are compiled together to create the user interface. ',
                  trimLines: 2,
                  style: TextStyle(color: Colors.black),
                  colorClickableText: Colors.pink,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: '...Read more',
                  trimExpandedText: ' Less',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ReadMoreText.hashtagable(
                  '#hashTest thatand these are compiled together to create the user interface. ' * 3,
                  trimLines: 2,
                  style: TextStyle(color: Colors.black),
                  colorClickableText: Colors.pink,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: '...Read more',
                  trimExpandedText: ' Less',
                  hashtagStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.w700),
                  onHashtagTap: (text) {
                    print("On Tab $text");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
