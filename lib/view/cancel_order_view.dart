import 'package:flutter/material.dart';
import 'package:ondc_flutter_app/controller/cancel_controller.dart';
import 'package:ondc_flutter_app/controller/track_controller.dart';
import 'package:ondc_flutter_app/model/confirm_response_model.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:uuid/uuid.dart';

class CancelOrderView extends StatelessWidget {
  final io.Socket socket;
  final ConfirmResponseModel confirmResponse;

  const CancelOrderView({
    required this.socket,
    required this.confirmResponse,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cancel Order'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Track Order'),
              onPressed: () async {
                final trackConroller = OndcTrackController();
                var messageId = const Uuid().v4();
                socket.emit('joinRoom', messageId);
                await trackConroller.trackOrder(
                  messageId: messageId,
                  orderId: confirmResponse.message!.order!.id!,
                  bppId: confirmResponse.context!.bppId!,
                  bppUri: confirmResponse.context!.bppUri!,
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text('Cancel Order'),
              onPressed: () async {
                final cancelConroller = OndcCancelController();
                var messageId = const Uuid().v4();
                socket.emit('joinRoom', messageId);
                await cancelConroller.cancelOrder(
                  messageId: messageId,
                  orderId: confirmResponse.message!.order!.id!,
                  bppId: confirmResponse.context!.bppId!,
                  bppUri: confirmResponse.context!.bppUri!,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
