import 'package:flutter/material.dart';
import 'package:ondc_flutter_app/controller/init_controller.dart';
import 'package:ondc_flutter_app/model/select_response_model.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:uuid/uuid.dart';

class AddAddressView extends StatelessWidget {
  final io.Socket socket;
  final SelectResponseModel selectResponse;
  final String locationId;

  const AddAddressView({
    required this.socket,
    required this.selectResponse,
    required this.locationId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text(
          'Init',
        ),
        onPressed: () async {
          var initController = OndcInitController();
          var messageId = const Uuid().v4();
          socket.emit('joinRoom', messageId);
          await initController
              .init(
            messageId: messageId,
            bppId: selectResponse.context!.bppId!,
            bppUri: selectResponse.context!.bppUri!,
            providerId: selectResponse.message!.order!.provider!.id!,
            locationId: locationId, //'shilpkala-store',
            itemId: selectResponse.message!.order!.items!.first.id!,
          )
              .then(
            (value) {
              if (value) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'success',
                    ),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'failed',
                    ),
                  ),
                );
              }
            },
          );
        },
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Add Address'),
    //   ),
    //   body: Center(
    //     child: ElevatedButton(
    //       child: const Text(
    //         'Init',
    //       ),
    //       onPressed: () async {
    //         var initController = OndcInitController();
    //         var messageId = const Uuid().v4();
    //         socket.emit('joinRoom', messageId);
    //         await initController
    //             .init(
    //           messageId: messageId,
    //           bppId: selectResponse.context!.bppId!,
    //           bppUri: selectResponse.context!.bppUri!,
    //           providerId: selectResponse.message!.order!.provider!.id!,
    //           locationId: 'shilpkala-store',
    //           itemId: selectResponse.message!.order!.items!.first.id!,
    //         )
    //             .then(
    //           (value) {
    //             if (value) {
    //               ScaffoldMessenger.of(context).showSnackBar(
    //                 const SnackBar(
    //                   content: Text(
    //                     'success',
    //                   ),
    //                 ),
    //               );
    //             } else {
    //               ScaffoldMessenger.of(context).showSnackBar(
    //                 const SnackBar(
    //                   content: Text(
    //                     'failed',
    //                   ),
    //                 ),
    //               );
    //             }
    //           },
    //         );
    //       },
    //     ),
    //   ),
    // );
  }
}
