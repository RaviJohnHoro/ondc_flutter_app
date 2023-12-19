import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:ondc_flutter_app/utils/strings.dart';
import 'dart:convert';
import 'dart:async';

import 'package:ondc_flutter_app/utils/util.dart';

class OndcSearchController {
  Future<bool> search({
    required String query,
    required String messageId,
    required Position position,
    bool isProduct = true,
  }) async {
    try {
      var fulfillment = {
        "type": "Delivery",
        "end": {
          "location": {"gps": "${position.latitude},${position.longitude}"}
        }
      };

      var intent = {
        "item": {
          "descriptor": {
            "name": query,
          }
        },
        "fulfillment": fulfillment,
      };
      var body = {
        "context": {
          "domain": "nic2004:52110",
          "country": "IND",
          "city": "*",
          "action": "search",
          "core_version": "1.1.0",
          "bap_id": bapId,
          "bap_uri": bapUri,
          "transaction_id": "252cc06b-3a38-4b70-bbf7-985650ea1c0e",
          "message_id": messageId,
          "timestamp": getFormattedDate(),
          "ttl": "P1M"
        },
        "message": {
          "intent": intent,
        }
      };

      log("search body is: ${jsonEncode(body)}");

      // final response = await http.post(
      //   Uri.parse(
      //     '$baseUrl/api/search',
      //   ),
      //   body: jsonEncode(body),
      // );
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('POST', Uri.parse('$baseUrl/api/search'));
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
        log("response code: ${response.statusCode}");
        return false;
      }
    } catch (e) {
      log('search failed: ${e.toString()}');
      return false;
    }
  }
}
