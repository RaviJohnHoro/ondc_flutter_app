import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:ondc_flutter_app/utils/strings.dart';
import 'dart:convert';
import 'dart:async';

import 'package:ondc_flutter_app/utils/util.dart';

class OndcInitController {
  Future<bool> init({
    required String messageId,
    required String bppId,
    required String bppUri,
    required String providerId,
    required String locationId,
    required String itemId,
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
          "city": "std:080",
          "action": "init",
          "core_version": "1.0.0",
          "bap_id": bapId,
          "bap_uri": bapUri,
          "transaction_id": "252cc06b-3a38-4b70-bbf7-985650ea1c0e",
          "message_id": messageId,
          "timestamp": getFormattedDate(),
          "bpp_id": "ondc.limeroad.com",
          "bpp_uri": "https://ondc.limeroad.com/ondc",
        },
        "message": {
          "order": {
            "provider": {
              "id": providerId,
              "locations": [
                {"id": locationId}
              ]
            },
            "items": [
              {
                "id": itemId,
                "quantity": {"count": 1}
              }
            ],
            "add_ons": [],
            "offers": [],
            "billing": {
              "address": {
                "door": "1",
                "name": "1",
                "building": "1",
                "street": "1",
                "locality": null,
                "ward": null,
                "city": "Palam Road",
                "state": "Haryana",
                "country": "IND",
                "areaCode": "122015",
                "area_code": "122015"
              },
              "phone": "8181818191",
              "name": "1",
              "email": "aditya@dataorc.in"
            },
            "fulfillments": [
              {
                "end": {
                  "contact": {
                    "email": "ravijohnhoro5@gmail.com",
                    "phone": "7739772728"
                  },
                  "location": {
                    "gps": "28.49837,77.0795259",
                    "address": {
                      "door": "1",
                      "name": "1",
                      "building": "1",
                      "street": "1",
                      "locality": null,
                      "ward": null,
                      "city": "Palam Road",
                      "state": "Haryana",
                      "country": "IND",
                      "areaCode": "122015",
                      "area_code": "122015"
                    }
                  }
                },
                "type": "Delivery",
                "customer": {
                  "person": {"name": "1"}
                },
                "provider_id": providerId,
              }
            ],
            "payment": {
              "type": "POST-FULFILLMENT",
              "collected_by": "BPP",
              // "@ondc/org/buyer_app_finder_fee_type": "Percent",
              // "@ondc/org/buyer_app_finder_fee_amount": 3,
              // "@ondc/org/ondc-withholding_amount": 0,
              // "@ondc/org/ondc-return_window": 0,
              // "@ondc/org/ondc-settlement_basis": "Collection",
              // "@ondc/org/ondc-settlement_window": "PT2D"
            }
          }
        }
      };

      // var body = {
      //   "context": {
      //     "domain": "nic2004:52110",
      //     "country": "IND",
      //     "city": "std:080",
      //     "action": "init",
      //     "core_version": "1.0.0",
      //     "bap_id": bapId,
      //     "bap_uri": bapUri,
      //     "transaction_id": "252cc06b-3a38-4b70-bbf7-985650ea1c0e",
      //     "message_id": messageId,
      //     "timestamp": getFormattedDate(),
      //     "bpp_id": bppId,
      //     "bpp_uri": bppUri,
      //   },
      //   "message": {
      //     "order": {
      //       "provider": {
      //         "id": providerId,
      //         "locations": [
      //           {"id": locationId}
      //         ]
      //       },
      //       "items": [
      //         {
      //           "id": itemId,
      //           "quantity": {"count": 1}
      //         }
      //       ],
      //       "add_ons": [],
      //       "offers": [],
      //       "billing": {
      //         "address": {
      //           "door": "1",
      //           "name": "1",
      //           "building": "1",
      //           "street": "1",
      //           "locality": null,
      //           "ward": null,
      //           "city": "Palam Road",
      //           "state": "Haryana",
      //           "country": "IND",
      //           "areaCode": "122015",
      //           "area_code": "122015"
      //         },
      //         "phone": "8181818191",
      //         "name": "1",
      //         "email": "aditya@dataorc.in"
      //       },
      //       "fulfillments": [
      //         {
      //           "end": {
      //             "contact": {
      //               "email": "ravijohnhoro5@gmail.com",
      //               "phone": "7739772728"
      //             },
      //             "location": {
      //               "gps": "28.49837,77.0795259",
      //               "address": {
      //                 "door": "1",
      //                 "name": "1",
      //                 "building": "1",
      //                 "street": "1",
      //                 "locality": null,
      //                 "ward": null,
      //                 "city": "Palam Road",
      //                 "state": "Haryana",
      //                 "country": "IND",
      //                 "areaCode": "122015",
      //                 "area_code": "122015"
      //               }
      //             }
      //           },
      //           "type": "Delivery",
      //           "customer": {
      //             "person": {"name": "1"}
      //           },
      //           "provider_id": providerId,
      //         }
      //       ],
      //       // "payment": {
      //       //   "type": "POST-FULFILLMENT",
      //       //   "collected_by": "BPP",
      //       //   "@ondc/org/buyer_app_finder_fee_type": "Percent",
      //       //   "@ondc/org/buyer_app_finder_fee_amount": 3,
      //       //   "@ondc/org/ondc-withholding_amount": 0,
      //       //   "@ondc/org/ondc-return_window": 0,
      //       //   "@ondc/org/ondc-settlement_basis": "Collection",
      //       //   "@ondc/org/ondc-settlement_window": "PT2D"
      //       // }
      //     }
      //   }
      // };

      log("init request body: ${jsonEncode(body)}");

      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
        'POST',
        Uri.parse(
          '$baseUrl/api/init',
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
      log('init failed: ${e.toString()}');
      return false;
    }
  }
}
