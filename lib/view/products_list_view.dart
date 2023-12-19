import 'package:ondc_flutter_app/controller/select_controller.dart';
import 'package:ondc_flutter_app/model/search_response_model.dart';
import 'package:ondc_flutter_app/model/select_order_request_model.dart';
import 'package:ondc_flutter_app/provider/select_request_provider.dart';
import 'package:ondc_flutter_app/view/product_detail_view.dart';
import 'package:ondc_flutter_app/widgets/image_container.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:flutter/material.dart';
import 'package:ondc_flutter_app/provider/search_provider.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/v4.dart';

class ProductsListView extends StatelessWidget {
  final io.Socket socket;
  final String messageId;

  const ProductsListView({
    required this.socket,
    required this.messageId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products List'),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(Icons.add),
      //   onPressed: () {
      //     var listLength = Provider.of<SearchProvider>(context, listen: false)
      //         .searchList
      //         .length;
      //     log("listlength: $listLength");
      //     socket.emit('loadMore', {
      //       'messageId': messageId,
      //       'index': listLength,
      //     });
      //   },
      // ),
      body: Consumer<SearchProvider>(
        builder: (_, searchProvider, __) {
          return ListView(
            //physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: searchProvider.searchList.length,
                itemBuilder: (_, index) {
                  var searchResponse = searchProvider.searchList[index];
                  return searchResponse.error != null
                      ? Container()
                      : ProductContainer(
                          name: searchResponse
                                  .message!.catalog!.bppDescriptor!.name ??
                              "",
                          imageUrl: searchResponse.message!.catalog!
                                          .bppDescriptor!.images ==
                                      null ||
                                  searchResponse.message!.catalog!
                                      .bppDescriptor!.images!.isEmpty
                              ? ""
                              : searchResponse.message!.catalog!.bppDescriptor!
                                  .images!.first,
                          providers:
                              searchResponse.message!.catalog!.bppProviders ??
                                  [],
                          onTap: searchResponse
                                  .message!.catalog!.bppProviders!.isEmpty
                              ? () {}
                              : () async {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) {
                                        return ChangeNotifierProvider<
                                            SelectRequestProvider>(
                                          create: (_) =>
                                              SelectRequestProvider(),
                                          child: ProductDetailView(
                                            searchModel: searchResponse,
                                            socket: socket,
                                          ),
                                        );
                                      },
                                    ),
                                  );

                                  // var messageId = const Uuid().v4();
                                  // var orderId = const Uuid().v4();

                                  // late final catalog =
                                  //     searchResponse.message!.catalog!;
                                  // late final bppDescriptor =
                                  //     catalog.bppDescriptor!;
                                  // late final bppProviders =
                                  //     catalog.bppProviders!;
                                  // var item = bppProviders.first.items!.first;
                                  // var bppProvider = bppProviders.first;

                                  // var order = SelectOrder.fromJson(
                                  //   {
                                  //     "items": [
                                  //       {
                                  //         "id": item.id,
                                  //         "quantity": {
                                  //           "count": 1,
                                  //         }
                                  //       }
                                  //     ],
                                  //     "provider": {
                                  //       "id": bppProvider.id,
                                  //       "locations": [
                                  //         {
                                  //           "id":
                                  //               bppProvider.locations!.first.id,
                                  //         }
                                  //       ]
                                  //     },
                                  //     "fulfillments": [
                                  //       {
                                  //         "end": {
                                  //           "location": {
                                  //             "gps": bppProvider
                                  //                 .locations!.first.gps,
                                  //             "address": {
                                  //               "area_code": bppProvider
                                  //                   .locations!
                                  //                   .first
                                  //                   .address!
                                  //                   .areaCode,
                                  //             }
                                  //           }
                                  //         }
                                  //       }
                                  //     ]
                                  //   },
                                  // );

                                  // socket.emit('joinRoom', messageId);
                                  // var ondcSelectController =
                                  //     OndcSelectController();
                                  // await ondcSelectController.select(
                                  //   messageId: messageId,
                                  //   order: order,
                                  //   // gps: gps,
                                  //   // itemId: itemId,
                                  //   // itemQuantity: itemQuantity,
                                  //   // providerId: providerId,
                                  //   // locationId: locationId,
                                  //   // areaCode: areaCode,
                                  // );
                                },
                        );
                },
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    var listLength =
                        Provider.of<SearchProvider>(context, listen: false)
                            .searchList
                            .length;
                    socket.emit(
                      'loadMore',
                      {
                        'messageId': messageId,
                        'index': listLength,
                      },
                    );
                  },
                  child: const Text('Load More'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class ProductContainer extends StatelessWidget {
  final void Function()? onTap;
  final String imageUrl;
  final String name;
  final List<BppProvider> providers;

  const ProductContainer({
    required this.onTap,
    required this.imageUrl,
    required this.name,
    required this.providers,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isProvidersEmpty = providers.isEmpty;

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 10,
          child: Container(
            height: 100,
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  //color: Colors.blue,
                  height: 50,
                  width: 50,
                  child: ImageContainer(
                    imageUrl: imageUrl,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Text(
                          name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: isProvidersEmpty,
                        child: const Text(
                          'No providers',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: !isProvidersEmpty,
                  child: const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.arrow_forward_ios,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
