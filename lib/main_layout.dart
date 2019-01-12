import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
//  debugPaintSizeEnabled=true;// 开启组件边距
  // TODO-打开app运行的是哪个dart文件是由哪里决定的？
  runApp(MaterialApp(
      // 所以这个title每次都是用来做什么的仍未知晓
      title: "Flutter Layout Demo",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Haibara Ai'),
        ),
        body: Column(children: <Widget>[
          Image.asset(
            'images/haibara.jpg',
            width: 533.0,
            height: 200.0,
            fit: BoxFit.cover,
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              HomePage(),
              ListTile(
                  leading: const Icon(Icons.flight_land),
                  title: const Text('Trix\'s airplane'),
                  subtitle: 1 != 2
                      ? const Text('The airplane is only in Act II.')
                      : null,
                  enabled: 1 == 2,
                  onTap: () {
                    /* react to the tile being tapped */
                  })
            ],
          )),
        ]),
      )));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[_TitleSection(), _ButtonBar(), _textSection],
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
                        'Haibara ai',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Text(
                    'There will never be nobody like you.',
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
        _getButtonColunm(Icons.call, 'CALL'),
        _getButtonColunm(Icons.near_me, 'ROUTE'),
        _getButtonColunm(Icons.share, 'SHARE'),
      ],
    ));
  }
}

Column _getButtonColunm(IconData iconData, String label) {
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
    '灰原喜欢小熊（TV 212-213）、小狗（TV 233-234）、小猫（TV 427-428、486、722）、'
        '萤火虫（TV 289-290）等小动物，喜欢绯色（TV 176、178），爱吃花生黄油和蓝莓果酱夹心的三明治（OVA 11中设定，'
        '非原作情节）；喜欢的电影是《爱因斯坦的光荣与苦恼的日子》（为TV 138中虚构的电影）。'
        '\n从TV 129、TV 205、TV 375、TV 423、M 11、OVA 9、OVA 12、M 15 特典等集数中，可以看出灰原爱看时装杂志。'
        '灰原也有使用女性时尚用品的爱好，TV 205中向佐藤警官提出的愿望是：“我要普达拉（PRADA）最新款的皮包”；'
        'TV 375中提出的帮柯南的条件：“芙莎绘最新款的钱包，这么大……（用手比划大小）就这样我就帮你。”',
    // 好像是自动换行
    softWrap: true,
  ),
);
