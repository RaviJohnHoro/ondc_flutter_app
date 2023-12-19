import 'package:flutter/material.dart';
import 'package:ondc_flutter_app/model/select_order_request_model.dart';

class SelectRequestProvider extends ChangeNotifier {
  SelectOrder? selectOrder;

  addProduct(SelectOrder order) {
    if (selectOrder == null) {
      selectOrder = order;
    } else {
      if (order.provider!.id == selectOrder!.provider!.id) {
        selectOrder!.items!.addAll(order.items!);
      } else {
        selectOrder = order;
      }
    }
    notifyListeners();
  }
}
