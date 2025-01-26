import 'package:flutter/material.dart';

class CartProviderWidget extends StatefulWidget {
  final Widget child;

  const CartProviderWidget({Key? key, required this.child}) : super(key: key);

  @override
  _CartProviderWidgetState createState() => _CartProviderWidgetState();

  static _CartProviderWidgetState of(BuildContext context) {
    final _CartProviderInherited? inherited =
        context.dependOnInheritedWidgetOfExactType<_CartProviderInherited>();
    assert(inherited != null, 'CartProviderWidget not found in widget tree');
    return inherited!.state;
  }
}

class _CartProviderWidgetState extends State<CartProviderWidget> {
  final List<Map<String, dynamic>> _cartItems = [];
  double _checkoutTotal = 0.0;

  List<Map<String, dynamic>> get cartItems => _cartItems;

  int get cartItemCount => _cartItems.length;

  double get checkoutTotal => _checkoutTotal;

  void addItem(Map<String, dynamic> item) {
    setState(() {
      _cartItems.add(item);
      _updateTotal();
    });
  }

  void removeItem(Map<String, dynamic> item) {
    setState(() {
      _cartItems.remove(item);
      _updateTotal();
    });
  }

  void clearCart() {
    setState(() {
      _cartItems.clear();
      _checkoutTotal = 0.0;
    });
  }

  void updateCheckoutTotal(double total) {
    setState(() {
      _checkoutTotal = total;
    });
  }

  void _updateTotal() {
    _checkoutTotal = _cartItems.fold(0.0, (sum, item) {
      double price = double.parse(item['price'].toString());
      int quantity = item['quantity'] ?? 1;
      return sum + (price * quantity);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _CartProviderInherited(
      state: this,
      child: widget.child,
    );
  }
}

class _CartProviderInherited extends InheritedWidget {
  final _CartProviderWidgetState state;

  const _CartProviderInherited({
    Key? key,
    required this.state,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_CartProviderInherited oldWidget) {
    return state != oldWidget.state;
  }
}
