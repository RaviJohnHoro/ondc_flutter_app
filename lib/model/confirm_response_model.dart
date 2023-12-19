class ConfirmResponseModel {
  final Context? context;
  final Message? message;

  ConfirmResponseModel({
    this.context,
    this.message,
  });

  factory ConfirmResponseModel.fromJson(Map<String, dynamic> json) =>
      ConfirmResponseModel(
        context:
            json["context"] == null ? null : Context.fromJson(json["context"]),
        message:
            json["message"] == null ? null : Message.fromJson(json["message"]),
      );

  Map<String, dynamic> toJson() => {
        "context": context?.toJson(),
        "message": message?.toJson(),
      };
}

class Context {
  final String? transactionId;
  final String? country;
  final String? bppId;
  final String? city;
  final String? domain;
  final String? bppUri;
  final String? action;
  final String? messageId;
  final String? coreVersion;
  final String? bapUri;
  final String? bapId;
  final DateTime? timestamp;

  Context({
    this.transactionId,
    this.country,
    this.bppId,
    this.city,
    this.domain,
    this.bppUri,
    this.action,
    this.messageId,
    this.coreVersion,
    this.bapUri,
    this.bapId,
    this.timestamp,
  });

  factory Context.fromJson(Map<String, dynamic> json) => Context(
        transactionId: json["transaction_id"],
        country: json["country"],
        bppId: json["bpp_id"],
        city: json["city"],
        domain: json["domain"],
        bppUri: json["bpp_uri"],
        action: json["action"],
        messageId: json["message_id"],
        coreVersion: json["core_version"],
        bapUri: json["bap_uri"],
        bapId: json["bap_id"],
        timestamp: json["timestamp"] == null
            ? null
            : DateTime.parse(json["timestamp"]),
      );

  Map<String, dynamic> toJson() => {
        "transaction_id": transactionId,
        "country": country,
        "bpp_id": bppId,
        "city": city,
        "domain": domain,
        "bpp_uri": bppUri,
        "action": action,
        "message_id": messageId,
        "core_version": coreVersion,
        "bap_uri": bapUri,
        "bap_id": bapId,
        "timestamp": timestamp?.toIso8601String(),
      };
}

class Message {
  final Order? order;

  Message({
    this.order,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        order: json["order"] == null ? null : Order.fromJson(json["order"]),
      );

  Map<String, dynamic> toJson() => {
        "order": order?.toJson(),
      };
}

class Order {
  final String? id;
  final String? state;
  final OndcConfirmProvider? provider;
  final List<Item>? items;
  final Billing? billing;
  final List<Fulfillment>? fulfillments;
  final Quote? quote;
  final Payment? payment;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Order({
    this.id,
    this.state,
    this.provider,
    this.items,
    this.billing,
    this.fulfillments,
    this.quote,
    this.payment,
    this.createdAt,
    this.updatedAt,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        state: json["state"],
        provider: json["provider"] == null
            ? null
            : OndcConfirmProvider.fromJson(json["provider"]),
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
        billing:
            json["billing"] == null ? null : Billing.fromJson(json["billing"]),
        fulfillments: json["fulfillments"] == null
            ? []
            : List<Fulfillment>.from(
                json["fulfillments"]!.map((x) => Fulfillment.fromJson(x))),
        quote: json["quote"] == null ? null : Quote.fromJson(json["quote"]),
        payment:
            json["payment"] == null ? null : Payment.fromJson(json["payment"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "state": state,
        "provider": provider?.toJson(),
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "billing": billing?.toJson(),
        "fulfillments": fulfillments == null
            ? []
            : List<dynamic>.from(fulfillments!.map((x) => x.toJson())),
        "quote": quote?.toJson(),
        "payment": payment?.toJson(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Billing {
  final String? name;
  final Address? address;
  final String? email;
  final String? phone;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Billing({
    this.name,
    this.address,
    this.email,
    this.phone,
    this.createdAt,
    this.updatedAt,
  });

  factory Billing.fromJson(Map<String, dynamic> json) => Billing(
        name: json["name"],
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
        email: json["email"],
        phone: json["phone"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "address": address?.toJson(),
        "email": email,
        "phone": phone,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Address {
  final String? door;
  final String? name;
  final dynamic locality;
  final String? city;
  final String? state;
  final String? country;
  final String? areaCode;

  Address({
    this.door,
    this.name,
    this.locality,
    this.city,
    this.state,
    this.country,
    this.areaCode,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        door: json["door"],
        name: json["name"],
        locality: json["locality"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        areaCode: json["area_code"],
      );

  Map<String, dynamic> toJson() => {
        "door": door,
        "name": name,
        "locality": locality,
        "city": city,
        "state": state,
        "country": country,
        "area_code": areaCode,
      };
}

class Fulfillment {
  final String? id;
  final String? ondcOrgProviderName;
  final OndcConfirmState? state;
  final String? type;
  final bool? tracking;
  final Start? start;
  final End? end;

  Fulfillment({
    this.id,
    this.ondcOrgProviderName,
    this.state,
    this.type,
    this.tracking,
    this.start,
    this.end,
  });

  factory Fulfillment.fromJson(Map<String, dynamic> json) => Fulfillment(
        id: json["id"],
        ondcOrgProviderName: json["@ondc/org/provider_name"],
        state: json["state"] == null
            ? null
            : OndcConfirmState.fromJson(json["state"]),
        type: json["type"],
        tracking: json["tracking"],
        start: json["start"] == null ? null : Start.fromJson(json["start"]),
        end: json["end"] == null ? null : End.fromJson(json["end"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "@ondc/org/provider_name": ondcOrgProviderName,
        "state": state?.toJson(),
        "type": type,
        "tracking": tracking,
        "start": start?.toJson(),
        "end": end?.toJson(),
      };
}

class End {
  final EndLocation? location;
  final Time? time;
  final Instructions? instructions;
  final EndContact? contact;

  End({
    this.location,
    this.time,
    this.instructions,
    this.contact,
  });

  factory End.fromJson(Map<String, dynamic> json) => End(
        location: json["location"] == null
            ? null
            : EndLocation.fromJson(json["location"]),
        time: json["time"] == null ? null : Time.fromJson(json["time"]),
        instructions: json["instructions"] == null
            ? null
            : Instructions.fromJson(json["instructions"]),
        contact: json["contact"] == null
            ? null
            : EndContact.fromJson(json["contact"]),
      );

  Map<String, dynamic> toJson() => {
        "location": location?.toJson(),
        "time": time?.toJson(),
        "instructions": instructions?.toJson(),
        "contact": contact?.toJson(),
      };
}

class EndContact {
  final String? phone;

  EndContact({
    this.phone,
  });

  factory EndContact.fromJson(Map<String, dynamic> json) => EndContact(
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
      };
}

class Instructions {
  final String? name;
  final String? shortDesc;

  Instructions({
    this.name,
    this.shortDesc,
  });

  factory Instructions.fromJson(Map<String, dynamic> json) => Instructions(
        name: json["name"],
        shortDesc: json["short_desc"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "short_desc": shortDesc,
      };
}

class EndLocation {
  final String? gps;
  final Address? address;

  EndLocation({
    this.gps,
    this.address,
  });

  factory EndLocation.fromJson(Map<String, dynamic> json) => EndLocation(
        gps: json["gps"],
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
      );

  Map<String, dynamic> toJson() => {
        "gps": gps,
        "address": address?.toJson(),
      };
}

class Time {
  final Range? range;

  Time({
    this.range,
  });

  factory Time.fromJson(Map<String, dynamic> json) => Time(
        range: json["range"] == null ? null : Range.fromJson(json["range"]),
      );

  Map<String, dynamic> toJson() => {
        "range": range?.toJson(),
      };
}

class Range {
  final DateTime? start;
  final DateTime? end;

  Range({
    this.start,
    this.end,
  });

  factory Range.fromJson(Map<String, dynamic> json) => Range(
        start: json["start"] == null ? null : DateTime.parse(json["start"]),
        end: json["end"] == null ? null : DateTime.parse(json["end"]),
      );

  Map<String, dynamic> toJson() => {
        "start": start?.toIso8601String(),
        "end": end?.toIso8601String(),
      };
}

class Start {
  final StartLocation? location;
  final Time? time;
  final Instructions? instructions;
  final StartContact? contact;

  Start({
    this.location,
    this.time,
    this.instructions,
    this.contact,
  });

  factory Start.fromJson(Map<String, dynamic> json) => Start(
        location: json["location"] == null
            ? null
            : StartLocation.fromJson(json["location"]),
        time: json["time"] == null ? null : Time.fromJson(json["time"]),
        instructions: json["instructions"] == null
            ? null
            : Instructions.fromJson(json["instructions"]),
        contact: json["contact"] == null
            ? null
            : StartContact.fromJson(json["contact"]),
      );

  Map<String, dynamic> toJson() => {
        "location": location?.toJson(),
        "time": time?.toJson(),
        "instructions": instructions?.toJson(),
        "contact": contact?.toJson(),
      };
}

class StartContact {
  final String? phone;
  final String? email;

  StartContact({
    this.phone,
    this.email,
  });

  factory StartContact.fromJson(Map<String, dynamic> json) => StartContact(
        phone: json["phone"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "email": email,
      };
}

class StartLocation {
  final String? id;
  final LocationDescriptor? descriptor;
  final String? gps;

  StartLocation({
    this.id,
    this.descriptor,
    this.gps,
  });

  factory StartLocation.fromJson(Map<String, dynamic> json) => StartLocation(
        id: json["id"],
        descriptor: json["descriptor"] == null
            ? null
            : LocationDescriptor.fromJson(json["descriptor"]),
        gps: json["gps"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "descriptor": descriptor?.toJson(),
        "gps": gps,
      };
}

class LocationDescriptor {
  final String? name;

  LocationDescriptor({
    this.name,
  });

  factory LocationDescriptor.fromJson(Map<String, dynamic> json) =>
      LocationDescriptor(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class OndcConfirmState {
  final StateDescriptor? descriptor;

  OndcConfirmState({
    this.descriptor,
  });

  factory OndcConfirmState.fromJson(Map<String, dynamic> json) =>
      OndcConfirmState(
        descriptor: json["descriptor"] == null
            ? null
            : StateDescriptor.fromJson(json["descriptor"]),
      );

  Map<String, dynamic> toJson() => {
        "descriptor": descriptor?.toJson(),
      };
}

class StateDescriptor {
  final String? name;
  final String? code;

  StateDescriptor({
    this.name,
    this.code,
  });

  factory StateDescriptor.fromJson(Map<String, dynamic> json) =>
      StateDescriptor(
        name: json["name"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
      };
}

class Item {
  final String? id;
  final String? fulfillmentId;
  final Quantity? quantity;

  Item({
    this.id,
    this.fulfillmentId,
    this.quantity,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        fulfillmentId: json["fulfillment_id"],
        quantity: json["quantity"] == null
            ? null
            : Quantity.fromJson(json["quantity"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fulfillment_id": fulfillmentId,
        "quantity": quantity?.toJson(),
      };
}

class Quantity {
  final int? count;

  Quantity({
    this.count,
  });

  factory Quantity.fromJson(Map<String, dynamic> json) => Quantity(
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
      };
}

class Payment {
  final String? uri;
  final String? tlMethod;
  final Params? params;
  final String? status;
  final String? type;
  final String? collectedBy;
  final String? ondcOrgBuyerAppFinderFeeType;
  final String? ondcOrgBuyerAppFinderFeeAmount;
  final String? ondcOrgWithholdingAmount;
  final String? ondcOrgReturnWindow;
  final String? ondcOrgSettlementBasis;
  final String? ondcOrgSettlementWindow;
  final List<OndcOrgSettlementDetail>? ondcOrgSettlementDetails;

  Payment({
    this.uri,
    this.tlMethod,
    this.params,
    this.status,
    this.type,
    this.collectedBy,
    this.ondcOrgBuyerAppFinderFeeType,
    this.ondcOrgBuyerAppFinderFeeAmount,
    this.ondcOrgWithholdingAmount,
    this.ondcOrgReturnWindow,
    this.ondcOrgSettlementBasis,
    this.ondcOrgSettlementWindow,
    this.ondcOrgSettlementDetails,
  });

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        uri: json["uri"],
        tlMethod: json["tl_method"],
        params: json["params"] == null ? null : Params.fromJson(json["params"]),
        status: json["status"],
        type: json["type"],
        collectedBy: json["collected_by"],
        ondcOrgBuyerAppFinderFeeType:
            json["@ondc/org/buyer_app_finder_fee_type"],
        ondcOrgBuyerAppFinderFeeAmount:
            json["@ondc/org/buyer_app_finder_fee_amount"],
        ondcOrgWithholdingAmount: json["@ondc/org/withholding_amount"],
        ondcOrgReturnWindow: json["@ondc/org/return_window"],
        ondcOrgSettlementBasis: json["@ondc/org/settlement_basis"],
        ondcOrgSettlementWindow: json["@ondc/org/settlement_window"],
        ondcOrgSettlementDetails: json["@ondc/org/settlement_details"] == null
            ? []
            : List<OndcOrgSettlementDetail>.from(
                json["@ondc/org/settlement_details"]!
                    .map((x) => OndcOrgSettlementDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "uri": uri,
        "tl_method": tlMethod,
        "params": params?.toJson(),
        "status": status,
        "type": type,
        "collected_by": collectedBy,
        "@ondc/org/buyer_app_finder_fee_type": ondcOrgBuyerAppFinderFeeType,
        "@ondc/org/buyer_app_finder_fee_amount": ondcOrgBuyerAppFinderFeeAmount,
        "@ondc/org/withholding_amount": ondcOrgWithholdingAmount,
        "@ondc/org/return_window": ondcOrgReturnWindow,
        "@ondc/org/settlement_basis": ondcOrgSettlementBasis,
        "@ondc/org/settlement_window": ondcOrgSettlementWindow,
        "@ondc/org/settlement_details": ondcOrgSettlementDetails == null
            ? []
            : List<dynamic>.from(
                ondcOrgSettlementDetails!.map((x) => x.toJson())),
      };
}

class OndcOrgSettlementDetail {
  final String? settlementCounterparty;
  final String? settlementPhase;
  final String? settlementType;
  final String? upiAddress;
  final String? settlementBankAccountNo;
  final String? settlementIfscCode;
  final String? beneficiaryName;
  final String? bankName;
  final String? branchName;

  OndcOrgSettlementDetail({
    this.settlementCounterparty,
    this.settlementPhase,
    this.settlementType,
    this.upiAddress,
    this.settlementBankAccountNo,
    this.settlementIfscCode,
    this.beneficiaryName,
    this.bankName,
    this.branchName,
  });

  factory OndcOrgSettlementDetail.fromJson(Map<String, dynamic> json) =>
      OndcOrgSettlementDetail(
        settlementCounterparty: json["settlement_counterparty"],
        settlementPhase: json["settlement_phase"],
        settlementType: json["settlement_type"],
        upiAddress: json["upi_address"],
        settlementBankAccountNo: json["settlement_bank_account_no"],
        settlementIfscCode: json["settlement_ifsc_code"],
        beneficiaryName: json["beneficiary_name"],
        bankName: json["bank_name"],
        branchName: json["branch_name"],
      );

  Map<String, dynamic> toJson() => {
        "settlement_counterparty": settlementCounterparty,
        "settlement_phase": settlementPhase,
        "settlement_type": settlementType,
        "upi_address": upiAddress,
        "settlement_bank_account_no": settlementBankAccountNo,
        "settlement_ifsc_code": settlementIfscCode,
        "beneficiary_name": beneficiaryName,
        "bank_name": bankName,
        "branch_name": branchName,
      };
}

class Params {
  final String? currency;
  final String? transactionId;
  final String? amount;

  Params({
    this.currency,
    this.transactionId,
    this.amount,
  });

  factory Params.fromJson(Map<String, dynamic> json) => Params(
        currency: json["currency"],
        transactionId: json["transaction_id"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "transaction_id": transactionId,
        "amount": amount,
      };
}

class OndcConfirmProvider {
  final String? id;
  final List<LocationElement>? locations;

  OndcConfirmProvider({
    this.id,
    this.locations,
  });

  factory OndcConfirmProvider.fromJson(Map<String, dynamic> json) =>
      OndcConfirmProvider(
        id: json["id"],
        locations: json["locations"] == null
            ? []
            : List<LocationElement>.from(
                json["locations"]!.map((x) => LocationElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "locations": locations == null
            ? []
            : List<dynamic>.from(locations!.map((x) => x.toJson())),
      };
}

class LocationElement {
  final String? id;

  LocationElement({
    this.id,
  });

  factory LocationElement.fromJson(Map<String, dynamic> json) =>
      LocationElement(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}

class Quote {
  final Price? price;
  final List<Breakup>? breakup;

  Quote({
    this.price,
    this.breakup,
  });

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        price: json["price"] == null ? null : Price.fromJson(json["price"]),
        breakup: json["breakup"] == null
            ? []
            : List<Breakup>.from(
                json["breakup"]!.map((x) => Breakup.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "price": price?.toJson(),
        "breakup": breakup == null
            ? []
            : List<dynamic>.from(breakup!.map((x) => x.toJson())),
      };
}

class Breakup {
  final String? ondcOrgItemId;
  final Quantity? ondcOrgItemQuantity;
  final String? title;
  final String? ondcOrgTitleType;
  final Price? price;

  Breakup({
    this.ondcOrgItemId,
    this.ondcOrgItemQuantity,
    this.title,
    this.ondcOrgTitleType,
    this.price,
  });

  factory Breakup.fromJson(Map<String, dynamic> json) => Breakup(
        ondcOrgItemId: json["@ondc/org/item_id"],
        ondcOrgItemQuantity: json["@ondc/org/item_quantity"] == null
            ? null
            : Quantity.fromJson(json["@ondc/org/item_quantity"]),
        title: json["title"],
        ondcOrgTitleType: json["@ondc/org/title_type"],
        price: json["price"] == null ? null : Price.fromJson(json["price"]),
      );

  Map<String, dynamic> toJson() => {
        "@ondc/org/item_id": ondcOrgItemId,
        "@ondc/org/item_quantity": ondcOrgItemQuantity?.toJson(),
        "title": title,
        "@ondc/org/title_type": ondcOrgTitleType,
        "price": price?.toJson(),
      };
}

class Price {
  final String? currency;
  final String? value;

  Price({
    this.currency,
    this.value,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        currency: json["currency"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "value": value,
      };
}
