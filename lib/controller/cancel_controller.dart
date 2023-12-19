import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';

import 'package:ondc_flutter_app/utils/strings.dart';
import 'package:ondc_flutter_app/utils/util.dart';

class OndcCancelController {
  Future<bool> cancelOrder({
    required String messageId,
    required String orderId,
    required String bppId,
    required String bppUri,
  }) async {
    try {
      var body = {
        "context": {
          "domain": "nic2004:52110",
          "country": "IND",
          "city": "std:080",
          "action": "cancel",
          "core_version": "1.0.0",
          "bap_id": bapId,
          "bap_uri": bapUri,
          "transaction_id": "252cc06b-3a38-4b70-bbf7-985650ea1c0e",
          "message_id": messageId,
          "timestamp": getFormattedDate(),
          "bpp_id": bppId,
          "bpp_uri": bppUri,
        },
        "message": {
          "order_id": orderId,
          "cancellation_reason_id": "001",
        }
      };
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
        'POST',
        Uri.parse(
          '$baseUrl/api/cancel',
        ),
      );
      request.body = json.encode(body);
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        log(await response.stream.bytesToString());
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log("catch block: cancel order");
      log(e.toString());
      return false;
    }
  }
}
