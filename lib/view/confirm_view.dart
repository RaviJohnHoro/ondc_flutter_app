import 'package:flutter/material.dart';
import 'package:ondc_flutter_app/controller/confirm_controller.dart';
import 'package:ondc_flutter_app/model/init_response_model.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:uuid/uuid.dart';

class ConfirmView extends StatelessWidget {
  final io.Socket socket;
  final InitResponseModel initResponse;

  const ConfirmView({
    required this.socket,
    required this.initResponse,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Confirm',
        ),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text(
            'Confirm',
          ),
          onPressed: () async {
            var confirmController = ConfirmController();
            var orderId = const Uuid().v4();
            var messageId = const Uuid().v4();
            socket.emit('joinRoom', messageId);
            await confirmController
                .confirm(
              initModel: initResponse,
              orderId: orderId,
              messageId: messageId,
            )
                .then(
              (value) {
                if (value) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text('success')));
                } else {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text('failes')));
                }
              },
            );
          },
        ),
      ),
    );
  }
}
