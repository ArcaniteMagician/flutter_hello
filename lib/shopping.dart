import 'package:flutter/material.dart';

class Product {
  final String name;

  const Product({this.name});
}

typedef void CartChangedCallback(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget {
  final Product product;
  final bool inCart;
  final CartChangedCallback onItemTap;

  // TODO- 这是什么构造方法。。
  ShoppingListItem({Product product, this.inCart, this.onItemTap})
      : product = product,
        super(key: ObjectKey(product));

  Color _getColor(BuildContext context) {
    return inCart && context == null
        ? Colors.black54
        : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context) {
    if (inCart) {
      return null;
    }

    return TextStyle(
        color: Colors.black54, decoration: TextDecoration.lineThrough);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onItemTap(product, inCart);
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(product?.name[0]),
      ),
      title: Text(
        product.name,
        style: _getTextStyle(context),
      ),
    );
  }
}

class ShoppingList extends StatefulWidget {
  final List<Product> products;

  const ShoppingList({Key key, this.products}) : super(key: key);

  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  Set<Product> _shoppingCart = Set<Product>();

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      inCart ? _shoppingCart.remove(product) : _shoppingCart.add(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shopping List')),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
        children: widget.products.map((Product product) {
          return ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product),
            onItemTap: _handleCartChanged,
          );
        }).toList(),
      ),
    );
  }
}
