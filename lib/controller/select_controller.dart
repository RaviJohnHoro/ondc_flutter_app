import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:ondc_flutter_app/model/select_order_request_model.dart';
import 'package:ondc_flutter_app/utils/strings.dart';
import 'dart:convert';
import 'dart:async';

import 'package:ondc_flutter_app/utils/util.dart';

class OndcSelectController {
  Future<bool> select({
    required String messageId,
    required SelectOrder order,
    // required String gps,
    // required String itemId,
    // required String itemQuantity,
    // required String providerId,
    // required String locationId,
    // required String areaCode,
  }) async {
    try {
      var body = {
        "context": {
          "domain": "nic2004:52110",
          "country": "IND",
          "city": "*",
          "action": "select",
          "core_version": "1.1.0",
          "bap_id": bapId,
          "bap_uri": bapUri,
          "transaction_id": "252cc06b-3a38-4b70-bbf7-985650ea1c0e",
          "message_id": messageId,
          "timestamp": getFormattedDate(),
          "ttl": "P1M",
          "bpp_id": "ondc.limeroad.com",
          "bpp_uri": "https://ondc.limeroad.com/ondc",
        },
        "message": {
          "order": order.toJson(),
          // "order": {
          //   "items": [
          //     {
          //       "id": "lr_16706147",
          //       "quantity": {
          //         "count": 1,
          //       }
          //     }
          //   ],
          //   "provider": {
          //     "id": "lr_1174",
          //     "locations": [
          //       {
          //         "id": "shilpkala-store",
          //       }
          //     ]
          //   },
          //   "fulfillments": [
          //     {
          //       "end": {
          //         "location": {
          //           //"gps": "18.5529805,73.9482617",
          //           "address": {
          //             "area_code": "560076",
          //           }
          //         }
          //       }
          //     }
          //   ]
          // },
        },
      };

      // var body = {
      //   "context": {
      //     "domain": "nic2004:52110",
      //     "country": "IND",
      //     "city": "*",
      //     "action": "select",
      //     "core_version": "1.1.0",
      // "bap_id": bapId,
      // "bap_uri": bapUri,
      //     "transaction_id": "252cc06b-3a38-4b70-bbf7-985650ea1c0e",
      //     "message_id": messageId,
      //     "timestamp": getFormattedDate(),
      //     "ttl": "P1M",
      //     "bpp_id": "staging-ondc.zlite.in",
      //     "bpp_uri": "https://staging-ondc.zlite.in",
      //   },
      //   "message": {
      //     "order": {
      //       "items": [
      //         {
      //           "id": "jolantaa-1",
      //           "quantity": {"count": 1}
      //         }
      //       ],
      //       "provider": {
      //         "id": "39b2c4e2-1892-5196-8a91-d28c3362e01e",
      //         "locations": [
      //           {
      //             "id": "bakerycenter",
      //           }
      //         ]
      //       },
      //       "fulfillments": [
      //         {
      //           "end": {
      //             "location": {
      //               "gps": "18.5529805,73.9482617",
      //               "address": {
      //                 "area_code": "411014",
      //               }
      //             }
      //           }
      //         }
      //       ]
      //     },
      //   },
      // };

      // var body = {
      //   "context": {
      //     "domain": "nic2004:52110",
      //     "country": "IND",
      //     "city": "*",
      //     "action": "select",
      //     "core_version": "1.1.0",
      // "bap_id": bapId,
      //     "bap_uri": bapUri,
      //     "transaction_id": "252cc06b-3a38-4b70-bbf7-985650ea1c0e",
      //     "message_id": messageId,
      //     "timestamp": getFormattedDate(),
      //     "ttl": "P1M",
      //     "bpp_id": "ondc.dpanda.in",
      //     "bpp_uri": "https://ondc.dpanda.in/staging/",
      //   },
      //   "message": {
      //     "order": {
      //       "items": [
      //         {
      //           "id": "24321237",
      //           "quantity": {"count": 1}
      //         }
      //       ],
      //       "provider": {
      //         "id": "ondc-dpanda",
      //         "locations": [
      //           {"id": "ondc-dpanda-gurgaon"}
      //         ]
      //       },
      //       "fulfillments": [
      //         {
      //           "end": {
      //             "location": {
      //               "gps": "28.49837,77.0795259",
      //               "address": {"area_code": "122015"}
      //             }
      //           }
      //         }
      //       ]
      //     },
      //   },
      // };

      //log("body is: ${jsonEncode(body)}");

      // final response = await http.post(
      //   Uri.parse(
      //     '$baseUrl/api/search',
      //   ),
      //   body: jsonEncode(body),
      // );
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
        'POST',
        Uri.parse(
          '$baseUrl/api/select',
        ),
      );
      request.body = json.encode(body);
      request.headers.addAll(headers);
      log("select order request body: $body");
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        log("select:: ${await response.stream.bytesToString()}");
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
      log('select failed: ${e.toString()}');
      return false;
    }
  }
}
