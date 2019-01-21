import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
//  debugPaintSizeEnabled=true;// 开启组件边距
  // TODO-打开app运行的是哪个dart文件是由哪里决定的？
  runApp(MaterialApp(
    // 所以这个title每次都是用来做什么的仍未知晓
    title: "Flutter Layout Demo",
    home: TintHomePage(),
  ));
}

class TintHomePage extends StatefulWidget {
  @override
  _TintHomePageState createState() => _TintHomePageState();
}

class _TintHomePageState extends State<TintHomePage> {
  static const double _appBarHeight = 255.0;

  @override
  Widget build(BuildContext context) {
    // 当没有把CustomScrollView包在脚手架中时，里面所有TextView都会带黄色双下划线，且默认字体颜色为红色
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: _appBarHeight,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Haibara Ai'),
              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.asset(
                    'images/haibara.jpg',
                    fit: BoxFit.cover,
                  ),
                  Align(
//                    bottomCenter  (0.5, 1.0)    底部中心
//                    bottomLeft    (0.0, 1.0)    左下角
//                    bottomRight   (1.0, 1.0)    右下角
//                    center        (0.5, 0.5)    水平垂直居中
//                    centerLeft    (0.0, 0.5)    左边缘中心
//                    centerRight   (1.0, 0.5)    右边缘中心
//                    topCenter     (0.5, 0.0)    顶部中心
//                    topLeft       (0.0, 0.0)    左上角
//                    topRight      (1.0, 0.0)    右上角
//                  alignment: FractionalOffset(0.5, 1.0),
                    alignment: FractionalOffset.bottomCenter,
                    child: Text('Text In Stack'),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(<Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // TODO- 初步判定为在Column内的宽度声明会生效
                  _getText(context),
                  _ButtonBar(),
                  _textSection,
                ],
              ),
              // 直接在SliverList下的宽度声明未生效
              _getText(context),
              _ButtonBar(),
              _textSection,
            ]),
          ),
        ],
      ),
    );
  }
}


class _ButtonBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: SizedBox(
          height: 100.0,
          width: 300.0,
          child: Card(
            elevation: 5.0,
            child: Row(
              // 让Row可以match_parent，不明白为什么titleSection可以写个Expanded就可以充满，这个不行
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _getButtonColumn(Icons.call, 'CALL'),
                _getButtonColumn(Icons.near_me, 'ROUTE'),
                _getButtonColumn(Icons.share, 'SHARE'),
              ],
            ),
          ),
        ));
  }
}

Column _getButtonColumn(IconData iconData, String label) {
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
    style: TextStyle(
      color: Colors.green[200],
      fontSize: 18.0,
      fontWeight: FontWeight.w400,
    ),
  ),
);

Widget _getText(BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 5.0),
    child: SizedBox(
      height: 60.0,
      // 获取了屏幕宽度
      width: MediaQuery
          .of(context)
          .size
          .width - 20.0,
      child: Card(
        // 设置不被接受的值可以去除阴影效果
        elevation: -20.0,
        child: Text(
          'Text in SliverList',
          style: TextStyle(fontSize: 20.0),
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );
}
