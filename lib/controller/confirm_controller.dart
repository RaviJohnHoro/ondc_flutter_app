import 'package:http/http.dart' as http;
import 'package:ondc_flutter_app/model/init_response_model.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:developer';
import 'package:ondc_flutter_app/utils/strings.dart';
import 'package:ondc_flutter_app/utils/util.dart';

class ConfirmController {
  Future<bool> confirm({
    required InitResponseModel initModel,
    required String orderId,
    required String messageId,
  }) async {
    var context = initModel.context!;
    var message = initModel.message!;
    var billing = message.order!.billing!;

    //var provider = message.order!.provider!;
    var fulfilments = message.order!.fulfillments;
    try {
      var body = {
        "context": {
          "domain": "nic2004:52110",
          "country": "IND",
          "city": "std:080",
          "action": "confirm",
          "core_version": "1.0.0",
          "bap_id": bapId,
          "bap_uri": bapUri,
          "transaction_id": "252cc06b-3a38-4b70-bbf7-985650ea1c0e",
          "message_id": messageId,
          "timestamp": getFormattedDate(),
          "bpp_id": context.bppId,
          "bpp_uri": context.bppUri,
        },
        "message": {
          "order": {
            "id": orderId,
            "billing": billing.toJson(),
            "items": List.generate(
              message.order!.items!.length,
              (index) => message.order!.items![index].toJson(),
            ),
            "provider": {
              "id": initModel.message!.order!.provider!.id,
              "locations": [
                {"id": "shilpkala-store"}
              ]
            },
            "fulfillments": List.generate(
              fulfilments!.length,
              (index) => fulfilments[index].toJson(),
            ),
            "addOns": [],
            "offers": [],
            "payment": {
              "params": {
                "amount": message.order!.quote!.price!.value,
                "currency": message.order!.quote!.price!.currency,
              },
              "status": "NOT-PAID",
              "type": "POST-FULFILLMENT",
              "collected_by": "BPP"
            },
            "quote": message.order!.quote!.toJson(),
          }
        }
      };

      log("confirm request body: $body");

      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
        'POST',
        Uri.parse(
          '$baseUrl/api/confirm',
        ),
      );
      request.body = json.encode(body);
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        log(await response.stream.bytesToString());
        return true;
      }
      //log("search response: ${response.body}");
      // if (response.statusCode == 200) {
      //   return true;
      // }
      else {
        return false;
      }
    } catch (e) {
      log('confirm failed: ${e.toString()}');
      return false;
    }
  }
}
