import 'dart:async';
import 'cart.dart';

class MyData {
  List<Cart> _carts = [];
  final _cartStreamController = StreamController<List<Cart>>.broadcast();
  Stream<List<Cart>> get cartStream => _cartStreamController.stream;
  List<Cart> get carts => _carts;
  void initData() {
    _carts = [];
    _cartStreamController.add(_carts);
  }
  void loadData(List<Cart> cartList) {
    _carts = cartList;
    _cartStreamController.add(_carts);
  }
  void addCart(Cart cart) {
    _carts.add(cart);
    _cartStreamController.add(_carts);
  }
  void removeCart(int index) {
    _carts.removeAt(index);
    _cartStreamController.add(_carts);
  }
  void clearCart() {
    _carts.clear();
    _cartStreamController.add(_carts);
  }
  void updateData() {
    _cartStreamController.add(_carts);
  }
  void dispose() {
    _cartStreamController.close();
  }
}
