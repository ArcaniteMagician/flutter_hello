import 'package:flutter/material.dart';
import 'main.dart';
import 'main_layout.dart';
import 'common_layout_widget.dart';
import 'main_tint_page.dart';
import 'contact_demo.dart';

void main() {
  runApp(MaterialApp(
    title: 'HomePage',
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter 练习'),
      ),
      body: ListView(
        children: <Widget>[
          _getItem(context, ShoppingListHomePage(),
              Icons.add, 'ShoppingList', '最初的练手组件'),
          _getItem(context, FirstHaibaraPage(),
              Icons.backup, 'Layout', 'Layout练习'),
          _getItem(context, ContainerHomePage(),
              Icons.cake, 'Common Layout', 'Container的练习'),
          _getItem(context, MyGridViewPage(),
              Icons.cake, 'Common Layout', 'GridView的练习'),
          _getItem(context, ColorsDemo(),
              Icons.cake, 'Common Layout', 'DefaultTabController、ListView结合的练习'),
          _getItem(context, TintHomePage(),
              Icons.details, 'Tint Page', '沉浸式练习'),
          _getItem(context, ContactsDemo(),
              Icons.edit, 'Contact', '官方例子'),
        ],
      ),
    );
  }
}

Widget _getItem(BuildContext context, Widget page,
    IconData icon, String title, String subtitle) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    child: ListTile(
      leading: Icon(
        icon,
        color: Colors.blue[500],
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
    ),
  );
}
