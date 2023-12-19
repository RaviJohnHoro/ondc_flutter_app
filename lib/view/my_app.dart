import 'dart:convert';
import 'dart:developer';
import 'package:ondc_flutter_app/model/confirm_response_model.dart';
import 'package:ondc_flutter_app/model/init_response_model.dart';
import 'package:ondc_flutter_app/model/search_response_model.dart';
import 'package:ondc_flutter_app/model/select_response_model.dart';
import 'package:ondc_flutter_app/provider/cart_provider.dart';
import 'package:ondc_flutter_app/view/address_view.dart';
import 'package:ondc_flutter_app/view/cancel_order_view.dart';
import 'package:ondc_flutter_app/view/confirm_view.dart';
import 'package:ondc_flutter_app/view/products_list_view.dart';
import 'package:ondc_flutter_app/provider/search_provider.dart';
import 'package:provider/provider.dart';

import '../controller/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:uuid/v4.dart';
import 'package:get/get.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //final baseUrl = 'http://192.168.29.89/';

  final baseUrl = 'https://www.gamatics.in';

  late io.Socket socket;

  Position? _currentPosition;

  int count = 0;

  var searchController = TextEditingController();

  String messageId = "";

  bool isProduct = true;

  void _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        _currentPosition = position;
      });
    } catch (e) {
      log('Error getting location: $e');
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  Future<void> _requestLocationPermission() async {
    PermissionStatus status = await Permission.location.request();

    if (status == PermissionStatus.granted) {
      // Location permission granted, you can now use location services
      _showMessage('Location permission granted!');
    } else if (status == PermissionStatus.denied) {
      // Location permission denied
      _showMessage('Location permission denied.');
    } else if (status == PermissionStatus.permanentlyDenied) {
      // Location permission permanently denied, take the user to app settings
      _showMessage(
          'Location permission permanently denied. Please go to app settings to enable it.');
      openAppSettings();
    }
  }

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
    socket = io.io(baseUrl, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket.connect();
    socket.on(
      'message',
      (data) {
        log('Message from server with room id :$messageId : ${data.toString()}}');
        var decodedData = jsonDecode(data);
        //log(decodedData.runtimeType.toString());
        if (decodedData['context'] != null) {
          var action = decodedData['context']['action'];
          switch (action) {
            case 'on_search':
              Provider.of<SearchProvider>(context, listen: false)
                  .addToSearchList(
                      SearchResponseModel.fromJson(jsonDecode(data)));

              break;
            case 'on_select':
              log("### on_select: $decodedData");
              var selectModel = SelectResponseModel.fromJson(decodedData);
              if (selectModel.message != null) {
                var cartProvider =
                    Provider.of<CartProvider>(context, listen: false);
                cartProvider.addProduct(selectModel);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'No message found on_select',
                    ),
                  ),
                );
              }

              // Get.to(
              //   () => AddAddressView(
              //     socket: socket,
              //     selectResponse: selectModel,
              //   ),
              // );
              break;
            case 'on_init':
              log("### on_init: $decodedData");
              var initModel = InitResponseModel.fromJson(decodedData);
              if (initModel.message != null) {
                Get.to(
                  () => ConfirmView(
                    socket: socket,
                    initResponse: initModel,
                  ),
                );
              }
              break;
            case 'on_confirm':
              log("### on_confirm: $decodedData");
              var confirmModel = ConfirmResponseModel.fromJson(decodedData);
              if (confirmModel.message != null) {
                Get.to(
                  () => CancelOrderView(
                    socket: socket,
                    confirmResponse: confirmModel,
                  ),
                );
              }
              break;
            case 'on_status':
              log("### on_status: $decodedData");
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    decodedData.toString(),
                  ),
                ),
              );
              break;
            case 'on_track':
              log("### on_track: $decodedData");
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    decodedData.toString(),
                  ),
                ),
              );
              break;
            case 'on_cancel':
              log("### on_cancel: $decodedData");
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    decodedData.toString(),
                  ),
                ),
              );
              break;
            default:
              break;
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PositionContainer(
              position: _currentPosition,
            ),
            ElevatedButton(
              onPressed: () {
                _getCurrentLocation();
              },
              child: const Text(
                'Get Current Location',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     CustomContainer(
            //       onTap: () {
            //         setState(() {
            //           isProduct = false;
            //         });
            //       },
            //       isProduct: !isProduct,
            //       text: 'Shop',
            //     ),
            //     const SizedBox(
            //       width: 10,
            //     ),
            //     CustomContainer(
            //       onTap: () {
            //         setState(() {
            //           isProduct = true;
            //         });
            //       },
            //       isProduct: isProduct,
            //       text: 'Product',
            //     ),
            //   ],
            // ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: searchController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (messageId.isNotEmpty) {
                      socket.off('message');
                      socket.emit('leaveRoom', {'roomId': messageId});
                      context.read<SearchProvider>().resetList();
                    }

                    messageId = const UuidV4().generate();

                    socket.emit('joinRoom', messageId);

                    await OndcSearchController()
                        .search(
                      query: searchController.text.trim(),
                      messageId: messageId,
                      position: _currentPosition!,
                      isProduct: isProduct,
                    )
                        .then((value) {
                      if (!value) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Search Failed'),
                          ),
                        );
                      } else {
                        // Future.delayed(const Duration(seconds: 1), () {
                        //   socket.emit('loadMore', {
                        //     'messageId': messageId,
                        //     'index': 0,
                        //   });
                        // });
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => ProductsListView(
                              socket: socket,
                              messageId: messageId,
                            ),
                          ),
                        );
                      }
                    });

                    //connect('');
                  },
                  child: const Text('Search'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  final void Function()? onTap;
  final bool isProduct;
  final String text;

  const CustomContainer({
    required this.onTap,
    required this.isProduct,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(10),
          color: isProduct ? Colors.blue : Colors.white,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isProduct ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}

class PositionContainer extends StatelessWidget {
  final Position? position;

  const PositionContainer({this.position, super.key});

  @override
  Widget build(BuildContext context) {
    return position == null
        ? Container()
        : Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              "Current Location: ${position!.latitude} ${position!.longitude}",
            ),
          );
  }
}
