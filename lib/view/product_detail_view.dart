import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ondc_flutter_app/controller/select_controller.dart';
import 'package:ondc_flutter_app/model/cart_item.dart';
import 'package:ondc_flutter_app/model/search_response_model.dart';
import 'package:ondc_flutter_app/model/select_order_request_model.dart';
import 'package:ondc_flutter_app/provider/cart_provider.dart';
import 'package:ondc_flutter_app/utils/strings.dart';
import 'package:ondc_flutter_app/view/cart_view.dart';
import 'package:ondc_flutter_app/widgets/image_container.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:uuid/v4.dart';

class ProductDetailView extends StatefulWidget {
  final SearchResponseModel searchModel;
  final io.Socket socket;

  const ProductDetailView({
    required this.searchModel,
    required this.socket,
    super.key,
  });

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  late final catalog = widget.searchModel.message!.catalog!;
  late final bppDescriptor = catalog.bppDescriptor!;
  late final bppProviders = catalog.bppProviders!;

  late BppProvider bppProvider = bppProviders.first;
  late List<Item> items = bppProvider.items!;

  SelectOrder? selectOrder;

  addProduct(SelectOrder order) {
    if (selectOrder == null) {
      selectOrder = order;
      log("1 ${selectOrder!.toJson()}");
    } else {
      log("provider ids: ${order.provider!.id} ${selectOrder!.provider!.id} isSame: ${order.provider!.id == selectOrder!.provider!.id}");
      if (order.provider!.id == selectOrder!.provider!.id) {
        bool containsProduct = false;
        for (var item in selectOrder!.items!) {
          if (order.items!.first.id == item.id) {
            containsProduct = true;
            selectOrder = selectOrder!.copyWith(
              items: [
                ...selectOrder!.items!
                    .where((e) => e.id != order.items!.first.id)
                    .toList(),
                SelectItem(
                  id: item.id,
                  quantity: SelectQuantity(
                    count: (int.parse(item.quantity!.count ?? "0") +
                            int.parse(
                                order.items!.first.quantity!.count ?? "0"))
                        .toString(),
                  ),
                ),
              ],
            );
            log("2 ${selectOrder!.toJson()}");
            break;
          }
        }

        if (!containsProduct) {
          var item = order.items!.first;
          log("3: before ${selectOrder!.toJson()}");
          selectOrder = selectOrder!.copyWith(
            items: [
              ...selectOrder!.items!,
              SelectItem(
                id: item.id,
                quantity: SelectQuantity(
                  count: item.quantity!.count,
                ),
              ),
            ],
          );
          log("3: after ${selectOrder!.toJson()}");
        }
        //selectOrder!.items!.addAll(order.items!);
      } else {
        showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              content: const Text(
                'The sellers are different. Do you wish to continue? This will remove previous items from your cart.',
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                ),
                const SizedBox(
                  width: 20,
                ),
                TextButton(
                  onPressed: () {
                    selectOrder = order;
                    log("4 ${selectOrder!.toJson()}");
                  },
                  child: const Text('Confirm'),
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var imageUrl = bppDescriptor.images == null || bppDescriptor.images!.isEmpty
        ? ""
        : bppDescriptor.images!.first;
    return Scaffold(
      appBar: AppBar(
        title: Text(catalog.bppDescriptor!.name ?? ""),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => CartView(
                    socket: widget.socket,
                    locationId: bppProvider.locations!.first.id!,
                  ),
                ),
              );
            },
            icon: Stack(
              children: [
                const Icon(
                  Icons.shopping_cart,
                ),
                Consumer<CartProvider>(
                  builder: (context, cartProvider, child) {
                    var itemCount = cartProvider.totalItemCount;
                    return itemCount == 0
                        ? Container()
                        : Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(3),
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                '$itemCount',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              child: ImageContainer(
                imageUrl: imageUrl,
                height: 200,
                width: 200,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: DropdownButtonFormField<BppProvider>(
                isExpanded: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                value: bppProvider,
                items: List.generate(
                  bppProviders.length,
                  (index) {
                    var provider = bppProviders[index];
                    return DropdownMenuItem<BppProvider>(
                      value: provider,
                      child: Text(
                        provider.descriptor!.name ?? "",
                      ),
                    );
                  },
                ),
                onChanged: (value) {
                  if (value != null) {
                    bppProvider = value;
                    items = bppProvider.items!;
                    if (mounted) {
                      setState(() {});
                    }
                  }
                },
              ),
            ),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (_, index) {
                  var item = items[index];
                  var imageUrl = item.descriptor!.images == null ||
                          item.descriptor!.images!.isEmpty
                      ? ""
                      : item.descriptor!.images!.first;
                  return Card(
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () async {
                          log("item id: ${item.id}");
                          addProduct(
                            SelectOrder.fromJson(
                              {
                                "items": [
                                  {
                                    "id": item.id,
                                    "quantity": {
                                      "count": 1,
                                    }
                                  }
                                ],
                                "provider": {
                                  "id": bppProvider.id,
                                  "locations": [
                                    {
                                      "id": bppProvider.locations!.first.id,
                                    }
                                  ]
                                },
                                "fulfillments": [
                                  {
                                    "end": {
                                      "location": {
                                        "gps": bppProvider.locations!.first.gps,
                                        "address": {
                                          "area_code": bppProvider.locations!
                                              .first.address!.areaCode,
                                        }
                                      }
                                    }
                                  }
                                ]
                              },
                            ),
                          );

                          log("before sending: ${selectOrder!.toJson()}");

                          var messageId = const UuidV4().generate();
                          widget.socket.emit('joinRoom', messageId);
                          var ondcSelectController = OndcSelectController();
                          Provider.of<CartProvider>(context, listen: false)
                              .addCartItem(
                            CartItem(
                              itemId: item.id!,
                              name: item.descriptor!.name ?? "",
                              imageUrl: imageUrl,
                            ),
                          );
                          await ondcSelectController.select(
                            messageId: messageId,
                            order: selectOrder!,
                            // gps: gps,
                            // itemId: itemId,
                            // itemQuantity: itemQuantity,
                            // providerId: providerId,
                            // locationId: locationId,
                            // areaCode: areaCode,
                          );
                        },
                        child: ListTile(
                          leading: SizedBox(
                            height: 150,
                            width: 50,
                            child: ImageContainer(
                              imageUrl: imageUrl,
                            ),
                          ),
                          title: Text(
                            item.descriptor!.name ?? "",
                          ),
                          subtitle: Text("$rupee ${item.price!.value}"),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: items.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
