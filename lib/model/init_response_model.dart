class InitResponseModel {
  final Context? context;
  final Message? message;

  InitResponseModel({
    this.context,
    this.message,
  });

  factory InitResponseModel.fromJson(Map<String, dynamic> json) =>
      InitResponseModel(
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
  final String? domain;
  final String? country;
  final String? city;
  final String? action;
  final String? coreVersion;
  final String? bapId;
  final String? bapUri;
  final String? transactionId;
  final String? messageId;
  final DateTime? timestamp;
  final String? bppId;
  final String? bppUri;

  Context({
    this.domain,
    this.country,
    this.city,
    this.action,
    this.coreVersion,
    this.bapId,
    this.bapUri,
    this.transactionId,
    this.messageId,
    this.timestamp,
    this.bppId,
    this.bppUri,
  });

  factory Context.fromJson(Map<String, dynamic> json) => Context(
        domain: json["domain"],
        country: json["country"],
        city: json["city"],
        action: json["action"],
        coreVersion: json["core_version"],
        bapId: json["bap_id"],
        bapUri: json["bap_uri"],
        transactionId: json["transaction_id"],
        messageId: json["message_id"],
        timestamp: json["timestamp"] == null
            ? null
            : DateTime.parse(json["timestamp"]),
        bppId: json["bpp_id"],
        bppUri: json["bpp_uri"],
      );

  Map<String, dynamic> toJson() => {
        "domain": domain,
        "country": country,
        "city": city,
        "action": action,
        "core_version": coreVersion,
        "bap_id": bapId,
        "bap_uri": bapUri,
        "transaction_id": transactionId,
        "message_id": messageId,
        "timestamp": timestamp?.toIso8601String(),
        "bpp_id": bppId,
        "bpp_uri": bppUri,
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
  final OndcProvider? provider;
  final OndcProvider? providerLocation;
  final List<Item>? items;
  final Billing? billing;
  final List<Fulfillment>? fulfillments;
  final Quote? quote;
  final Payment? payment;

  Order({
    this.provider,
    this.providerLocation,
    this.items,
    this.billing,
    this.fulfillments,
    this.quote,
    this.payment,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        provider: json["provider"] == null
            ? null
            : OndcProvider.fromJson(json["provider"]),
        providerLocation: json["provider_location"] == null
            ? null
            : OndcProvider.fromJson(json["provider_location"]),
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
      );

  Map<String, dynamic> toJson() => {
        "provider": provider?.toJson(),
        "provider_location": providerLocation?.toJson(),
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "billing": billing?.toJson(),
        "fulfillments": fulfillments == null
            ? []
            : List<dynamic>.from(fulfillments!.map((x) => x.toJson())),
        "quote": quote?.toJson(),
        "payment": payment?.toJson(),
      };
}

class Billing {
  final Address? address;
  final String? phone;
  final String? name;
  final String? email;

  Billing({
    this.address,
    this.phone,
    this.name,
    this.email,
  });

  factory Billing.fromJson(Map<String, dynamic> json) => Billing(
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
        phone: json["phone"],
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "address": address?.toJson(),
        "phone": phone,
        "name": name,
        "email": email,
      };
}

class Address {
  final String? door;
  final String? name;
  final String? building;
  final String? street;
  final dynamic locality;
  final dynamic ward;
  final String? city;
  final String? state;
  final String? country;
  final String? areaCode;
  final String? addressAreaCode;

  Address({
    this.door,
    this.name,
    this.building,
    this.street,
    this.locality,
    this.ward,
    this.city,
    this.state,
    this.country,
    this.areaCode,
    this.addressAreaCode,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        door: json["door"],
        name: json["name"],
        building: json["building"],
        street: json["street"],
        locality: json["locality"],
        ward: json["ward"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        areaCode: json["areaCode"],
        addressAreaCode: json["area_code"],
      );

  Map<String, dynamic> toJson() => {
        "door": door,
        "name": name,
        "building": building,
        "street": street,
        "locality": locality,
        "ward": ward,
        "city": city,
        "state": state,
        "country": country,
        "areaCode": areaCode,
        "area_code": addressAreaCode,
      };
}

class Fulfillment {
  final End? end;
  final String? type;
  final Customer? customer;
  final String? providerId;

  Fulfillment({
    this.end,
    this.type,
    this.customer,
    this.providerId,
  });

  factory Fulfillment.fromJson(Map<String, dynamic> json) => Fulfillment(
        end: json["end"] == null ? null : End.fromJson(json["end"]),
        type: json["type"],
        customer: json["customer"] == null
            ? null
            : Customer.fromJson(json["customer"]),
        providerId: json["provider_id"],
      );

  Map<String, dynamic> toJson() => {
        "end": end?.toJson(),
        "type": type,
        "customer": customer?.toJson(),
        "provider_id": providerId,
      };
}

class Customer {
  final Person? person;

  Customer({
    this.person,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        person: json["person"] == null ? null : Person.fromJson(json["person"]),
      );

  Map<String, dynamic> toJson() => {
        "person": person?.toJson(),
      };
}

class Person {
  final String? name;

  Person({
    this.name,
  });

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class End {
  final Contact? contact;
  final Location? location;

  End({
    this.contact,
    this.location,
  });

  factory End.fromJson(Map<String, dynamic> json) => End(
        contact:
            json["contact"] == null ? null : Contact.fromJson(json["contact"]),
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
      );

  Map<String, dynamic> toJson() => {
        "contact": contact?.toJson(),
        "location": location?.toJson(),
      };
}

class Contact {
  final String? email;
  final String? phone;

  Contact({
    this.email,
    this.phone,
  });

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        email: json["email"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "phone": phone,
      };
}

class Location {
  final String? gps;
  final Address? address;

  Location({
    this.gps,
    this.address,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        gps: json["gps"],
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
      );

  Map<String, dynamic> toJson() => {
        "gps": gps,
        "address": address?.toJson(),
      };
}

class Item {
  final String? id;
  final Quantity? quantity;

  Item({
    this.id,
    this.quantity,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        quantity: json["quantity"] == null
            ? null
            : Quantity.fromJson(json["quantity"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quantity": quantity?.toJson(),
      };
}

class Quantity {
  final String? count;

  Quantity({
    this.count,
  });

  factory Quantity.fromJson(Map<String, dynamic> json) => Quantity(
        count: json["count"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
      };
}

class Payment {
  final String? type;
  final String? collectedBy;
  final String? ondcOrgBuyerAppFinderFeeType;
  final int? ondcOrgBuyerAppFinderFeeAmount;
  final int? ondcOrgOndcWithholdingAmount;
  final int? ondcOrgOndcReturnWindow;
  final String? ondcOrgOndcSettlementBasis;
  final String? ondcOrgOndcSettlementWindow;

  Payment({
    this.type,
    this.collectedBy,
    this.ondcOrgBuyerAppFinderFeeType,
    this.ondcOrgBuyerAppFinderFeeAmount,
    this.ondcOrgOndcWithholdingAmount,
    this.ondcOrgOndcReturnWindow,
    this.ondcOrgOndcSettlementBasis,
    this.ondcOrgOndcSettlementWindow,
  });

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        type: json["type"],
        collectedBy: json["collected_by"],
        ondcOrgBuyerAppFinderFeeType:
            json["@ondc/org/buyer_app_finder_fee_type"],
        ondcOrgBuyerAppFinderFeeAmount:
            json["@ondc/org/buyer_app_finder_fee_amount"],
        ondcOrgOndcWithholdingAmount: json["@ondc/org/ondc-withholding_amount"],
        ondcOrgOndcReturnWindow: json["@ondc/org/ondc-return_window"],
        ondcOrgOndcSettlementBasis: json["@ondc/org/ondc-settlement_basis"],
        ondcOrgOndcSettlementWindow: json["@ondc/org/ondc-settlement_window"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "collected_by": collectedBy,
        "@ondc/org/buyer_app_finder_fee_type": ondcOrgBuyerAppFinderFeeType,
        "@ondc/org/buyer_app_finder_fee_amount": ondcOrgBuyerAppFinderFeeAmount,
        "@ondc/org/ondc-withholding_amount": ondcOrgOndcWithholdingAmount,
        "@ondc/org/ondc-return_window": ondcOrgOndcReturnWindow,
        "@ondc/org/ondc-settlement_basis": ondcOrgOndcSettlementBasis,
        "@ondc/org/ondc-settlement_window": ondcOrgOndcSettlementWindow,
      };
}

class OndcProvider {
  final String? id;

  OndcProvider({
    this.id,
  });

  factory OndcProvider.fromJson(Map<String, dynamic> json) => OndcProvider(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}

class Quote {
  final QuotePrice? price;
  final List<Breakup>? breakup;

  Quote({
    this.price,
    this.breakup,
  });

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        price:
            json["price"] == null ? null : QuotePrice.fromJson(json["price"]),
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
  final BreakupPrice? price;

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
        price:
            json["price"] == null ? null : BreakupPrice.fromJson(json["price"]),
      );

  Map<String, dynamic> toJson() => {
        "@ondc/org/item_id": ondcOrgItemId,
        "@ondc/org/item_quantity": ondcOrgItemQuantity?.toJson(),
        "title": title,
        "@ondc/org/title_type": ondcOrgTitleType,
        "price": price?.toJson(),
      };
}

class BreakupPrice {
  final String? currency;
  final dynamic value;

  BreakupPrice({
    this.currency,
    this.value,
  });

  factory BreakupPrice.fromJson(Map<String, dynamic> json) => BreakupPrice(
        currency: json["currency"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "value": value,
      };
}

class QuotePrice {
  final String? currency;
  final String? value;

  QuotePrice({
    this.currency,
    this.value,
  });

  factory QuotePrice.fromJson(Map<String, dynamic> json) => QuotePrice(
        currency: json["currency"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "value": value,
      };
}
