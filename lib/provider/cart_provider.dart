import 'package:flutter/material.dart';
import 'package:ondc_flutter_app/model/cart_item.dart';
import 'package:ondc_flutter_app/model/select_response_model.dart';

class CartProvider extends ChangeNotifier {
  late SelectResponseModel selectOrderResponseModel;
  List<CartItem> cartItems = [];

  int totalItemCount = 0;
  int distinctItemCount = 0;

  addCartItem(CartItem item) {
    cartItems.add(item);
    notifyListeners();
  }

  addProduct(SelectResponseModel model) {
    if (model.message != null) {
      selectOrderResponseModel = model;
      var _cartItems = [];
      for (var _cartItem in cartItems) {
        for (var _item in selectOrderResponseModel.message!.order!.items!) {
          if (_item.id == _cartItem.itemId) {
            _cartItems.add(_cartItem);
          }
        }
      }
      cartItems = [..._cartItems];
      getItemCount(model.message!.order!);
      notifyListeners();
    }
  }

  getItemCount(Order selectOrder) {
    totalItemCount = 0;
    distinctItemCount = 0;
    for (var item in selectOrder.items!) {
      totalItemCount += int.parse(item.quantity!.count ?? "0");
      distinctItemCount++;
    }
  }
}
