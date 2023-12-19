import 'package:flutter/material.dart';
import 'package:ondc_flutter_app/model/cart_item.dart';
import 'package:ondc_flutter_app/model/select_response_model.dart';
import 'package:ondc_flutter_app/provider/cart_provider.dart';
import 'package:ondc_flutter_app/view/address_view.dart';
import 'package:ondc_flutter_app/widgets/image_container.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class CartView extends StatelessWidget {
  final io.Socket socket;

  final String locationId;

  const CartView({
    required this.socket,
    required this.locationId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var selectResponse = Provider.of<CartProvider>(context, listen: false)
        .selectOrderResponseModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cart',
        ),
      ),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          var totalItemCount = cartProvider.totalItemCount;
          var distinctItemCount = cartProvider.distinctItemCount;
          return totalItemCount == 0
              ? const Center(
                  child: Text("No items in cart"),
                )
              : ListView(
                  shrinkWrap: true,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: distinctItemCount,
                      itemBuilder: (context, index) {
                        var order = cartProvider
                            .selectOrderResponseModel.message!.order!;

                        var item = order.items![index];
                        CartItem? cartItem;

                        for (var i in cartProvider.cartItems) {
                          if (item.id == i.itemId) {
                            cartItem = i;
                            break;
                          }
                        }

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ImageContainer(
                                height: 50,
                                width: 50,
                                imageUrl: cartItem!.imageUrl,
                              ),
                              Expanded(
                                child: Text(cartItem.name),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 10,
                                ),
                                decoration: BoxDecoration(
                                  //color: Colors.blue,
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(right: 5),
                                      alignment: Alignment.center,
                                      child: const Icon(
                                        Icons.remove,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 15,
                                      ),
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          left: BorderSide(
                                            color: Colors.black,
                                          ),
                                          right: BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        item.quantity!.count ?? "0",
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: const Icon(Icons.add),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                    AddAddressView(
                      socket: socket,
                      selectResponse: selectResponse,
                      locationId: locationId,
                    ),
                  ],
                );
        },
      ),
    );
  }
}
