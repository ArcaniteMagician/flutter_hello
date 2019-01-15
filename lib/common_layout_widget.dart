import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
//  debugPaintSizeEnabled = true; // 开启组件边距
  runApp(MaterialApp(
    title: 'Common Layout Widget',
    home: ColorsDemo(),
  ));
}

// DefaultTabController、ListView结合的练习
const double kColorItemHeight = 48.0;

class Palette {
  final String name;
  final MaterialColor primaryColor;
  final MaterialAccentColor accentColor;
  final int threshold;

  Palette({this.name, this.primaryColor, this.accentColor, this.threshold = 900});

  bool get isValid => name != null && primaryColor != null && accentColor != null;
}

final List<Palette> allPalettes = <Palette>[
  Palette(name: 'RED', primaryColor: Colors.red, accentColor: Colors.redAccent, threshold: 300),
  Palette(name: 'PINK', primaryColor: Colors.pink, accentColor: Colors.pinkAccent, threshold: 200),
  Palette(name: 'PURPLE', primaryColor: Colors.purple, accentColor: Colors.purpleAccent, threshold: 200),
  Palette(name: 'DEEP PURPLE', primaryColor: Colors.deepPurple, accentColor: Colors.deepPurpleAccent, threshold: 200),
  Palette(name: 'INDIGO', primaryColor: Colors.indigo, accentColor: Colors.indigoAccent, threshold: 200),
  Palette(name: 'BLUE', primaryColor: Colors.blue, accentColor: Colors.blueAccent, threshold: 400),
  Palette(name: 'LIGHT BLUE', primaryColor: Colors.lightBlue, accentColor: Colors.lightBlueAccent, threshold: 500),
  Palette(name: 'CYAN', primaryColor: Colors.cyan, accentColor: Colors.cyanAccent, threshold: 600),
  Palette(name: 'TEAL', primaryColor: Colors.teal, accentColor: Colors.tealAccent, threshold: 400),
  Palette(name: 'GREEN', primaryColor: Colors.green, accentColor: Colors.greenAccent, threshold: 500),
  Palette(name: 'LIGHT GREEN', primaryColor: Colors.lightGreen, accentColor: Colors.lightGreenAccent, threshold: 600),
  Palette(name: 'LIME', primaryColor: Colors.lime, accentColor: Colors.limeAccent, threshold: 800),
  Palette(name: 'YELLOW', primaryColor: Colors.yellow, accentColor: Colors.yellowAccent),
  Palette(name: 'AMBER', primaryColor: Colors.amber, accentColor: Colors.amberAccent),
  Palette(name: 'ORANGE', primaryColor: Colors.orange, accentColor: Colors.orangeAccent, threshold: 700),
  Palette(name: 'DEEP ORANGE', primaryColor: Colors.deepOrange, accentColor: Colors.deepOrangeAccent, threshold: 400),
//  Palette(name: 'BROWN', primaryColor: Colors.brown, threshold: 200),
//  Palette(name: 'GREY', primaryColor: Colors.grey, threshold: 500),
//  Palette(name: 'BLUE GREY', primaryColor: Colors.blueGrey, threshold: 500),
];

class ColorItem extends StatelessWidget {
  const ColorItem({
    Key key,
    @required this.index,
    @required this.color,
    this.prefix = '',
  }) : assert(index != null),
        assert(color != null),
        assert(prefix != null),
        super(key: key);

  final int index;
  final Color color;
  final String prefix;

  String colorString() => "#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}";

  @override
  Widget build(BuildContext context) {
    // TODO- 意义不明
    return Semantics(
      container: true,
      child: Container(
        height: kColorItemHeight,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        color: color,
        // 自动适应状态栏、底部操作栏，防止UI显示异常的Widget，兼容iPhone X
        child: SafeArea(
          top: false,
          bottom: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('$prefix$index'),
              Text(colorString()),
            ],
          ),
        ),
      ),
    );
  }
}

class PaletteTabView extends StatelessWidget {
  PaletteTabView({
    Key key,
    @required this.colors,
  }) : assert(colors != null && colors.isValid),
        super(key: key);

  final Palette colors;

  static const List<int> primaryKeys = <int>[50, 100, 200, 300, 400, 500, 600, 700, 800, 900];
  static const List<int> accentKeys = <int>[100, 200, 400, 700];

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final TextStyle whiteTextStyle = textTheme.body1.copyWith(color: Colors.white);
    final TextStyle blackTextStyle = textTheme.body1.copyWith(color: Colors.black);
    final List<Widget> colorItems = primaryKeys.map<Widget>((int index) {
      return DefaultTextStyle(
        style: index > colors.threshold ? whiteTextStyle : blackTextStyle,
        child: ColorItem(index: index, color: colors.primaryColor[index]),
      );
    }).toList();

    if (colors.accentColor != null) {
      colorItems.addAll(accentKeys.map<Widget>((int index) {
        return DefaultTextStyle(
          style: index > colors.threshold ? whiteTextStyle : blackTextStyle,
          child: ColorItem(index: index, color: colors.accentColor[index], prefix: 'A'),
        );
      }).toList());
    }

    return ListView(
      itemExtent: kColorItemHeight,
      children: colorItems,
    );
  }
}

class ColorsDemo extends StatelessWidget {
  // 似乎是无效代码
//  static const String routeName = '/colors';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: allPalettes.length,
      child: Scaffold(
        appBar: AppBar(
          elevation: 5.0,
          title: const Text('Colors'),
          bottom: TabBar(
            isScrollable: true,
            tabs: allPalettes.map<Widget>((Palette swatch) => Tab(text: swatch.name)).toList(),
          ),
        ),
        body: TabBarView(
          children: allPalettes.map<Widget>((Palette colors) {
            return PaletteTabView(colors: colors);
          }).toList(),
        ),
      ),
    );
  }
}


// GridView的练习
class MyGridViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView'),
      ),
      body: _buildGrid(),
    );
  }
}

Widget _buildGrid() {
  return GridView.count(
    crossAxisCount: 2,
    mainAxisSpacing: 4.0,
    crossAxisSpacing: 4.0,
    padding: const EdgeInsets.all(4.0),
    children: _buildGridTileList(4),
  );
}

List<Container> _buildGridTileList(int count) {
  return List <Container>.generate(count,
  (int index)=>
  Container
  (
  child:Image.asset
  (index==0?'images/haibara.jpg':"images/haibara${index-1}.jpeg",fit:BoxFit.cover,),
  ));
}

// Container的练习
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.black26,
            // 没有作用
            border: Border.all(color: Colors.black38, width: 10.0),
            // 没有作用
            borderRadius: const BorderRadius.all(Radius.circular(8.0))),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                _getImageExpanded('images/haibara.jpg'),
                _getImageExpanded('images/haibara0.jpeg'),
              ],
            ),
            Row(
              children: <Widget>[
                _getImageExpanded('images/haibara1.jpeg'),
                _getImageExpanded('images/haibara2.jpeg'),
              ],
            )
          ],
        ));
  }
}

Expanded _getImageExpanded(String imagePath) {
  return Expanded(
    child: Container(
      decoration: BoxDecoration(
        // 有作用
        border: Border.all(color: Colors.black38, width: 10.0),
        // TODO- 好像没有作用
        borderRadius: const BorderRadius.all(Radius.circular(18.0)),
      ),
      child: Image.asset(imagePath),
      margin: const EdgeInsets.all(4.0),
    ),
  );
}
