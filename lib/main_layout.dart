import 'package:flutter/material.dart';

void main() {
  // TODO-打开app运行的是哪个dart文件是由哪里决定的？
  runApp(
    MaterialApp(
        // 所以这个title每次都是用来做什么的仍未知晓
        title: "Flutter Layout Demo",
        home: Scaffold(
          appBar: AppBar(
            title: Text('Top Lakes'),
          ),
          body: HomePage(),
        )),
  );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.network(
            'http://ts1.mm.bing.net/th?id=OIP.jKWW9JJTnrwNYni4Cc7qJgHaHQ&pid=15.1&w=80&h=80'),
        _TitleSection(),
        _ButtonBar(),
        _textSection
      ],
    );
  }
}

class _TitleSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(32.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'first line',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Text(
                    'second line',
                    style: TextStyle(color: Colors.grey[500]),
                  )
                ],
              ),
            ),
            Icon(
              Icons.star,
              color: Colors.red[500],
            ),
            Text('41')
          ],
        ));
  }
}

class _ButtonBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      // 让Row可以match_parent，不明白为什么titleSection可以写个Expanded就可以充满，这个不行
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _getButtonColum(Icons.call, 'CALL'),
        _getButtonColum(Icons.near_me, 'ROUTE'),
        _getButtonColum(Icons.share, 'SHARE'),
      ],
    ));
  }
}

Column _getButtonColum(IconData iconData, String label) {
  Color color = Colors.blue[500];
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Icon(
        iconData,
        color: color,
      ),
      Container(
        margin: const EdgeInsets.only(top: 5.0),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      )
    ],
  );
}

Widget _textSection = Container(
  padding: const EdgeInsets.all(32.0),
  child: Text(
    'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
    // 好像是自动换行
    softWrap: true,
  ),
);
