class SelectResponseModel {
  final Context? context;
  final Message? message;

  SelectResponseModel({
    this.context,
    this.message,
  });

  SelectResponseModel copyWith({
    Context? context,
    Message? message,
  }) =>
      SelectResponseModel(
        context: context ?? this.context,
        message: message ?? this.message,
      );

  factory SelectResponseModel.fromJson(Map<String, dynamic> json) =>
      SelectResponseModel(
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

  Context copyWith({
    String? transactionId,
    String? country,
    String? bppId,
    String? city,
    String? domain,
    String? bppUri,
    String? action,
    String? messageId,
    String? coreVersion,
    String? bapUri,
    String? bapId,
    DateTime? timestamp,
  }) =>
      Context(
        transactionId: transactionId ?? this.transactionId,
        country: country ?? this.country,
        bppId: bppId ?? this.bppId,
        city: city ?? this.city,
        domain: domain ?? this.domain,
        bppUri: bppUri ?? this.bppUri,
        action: action ?? this.action,
        messageId: messageId ?? this.messageId,
        coreVersion: coreVersion ?? this.coreVersion,
        bapUri: bapUri ?? this.bapUri,
        bapId: bapId ?? this.bapId,
        timestamp: timestamp ?? this.timestamp,
      );

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

  Message copyWith({
    Order? order,
  }) =>
      Message(
        order: order ?? this.order,
      );

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        order: json["order"] == null ? null : Order.fromJson(json["order"]),
      );

  Map<String, dynamic> toJson() => {
        "order": order?.toJson(),
      };
}

class Order {
  final SelectResponseProvider? provider;
  final List<ItemElement>? items;
  final List<Fulfillment>? fulfillments;
  final Quote? quote;

  Order({
    this.provider,
    this.items,
    this.fulfillments,
    this.quote,
  });

  Order copyWith({
    SelectResponseProvider? provider,
    List<ItemElement>? items,
    List<Fulfillment>? fulfillments,
    Quote? quote,
  }) =>
      Order(
        provider: provider ?? this.provider,
        items: items ?? this.items,
        fulfillments: fulfillments ?? this.fulfillments,
        quote: quote ?? this.quote,
      );

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        provider: json["provider"] == null
            ? null
            : SelectResponseProvider.fromJson(json["provider"]),
        items: json["items"] == null
            ? []
            : List<ItemElement>.from(
                json["items"]!.map((x) => ItemElement.fromJson(x))),
        fulfillments: json["fulfillments"] == null
            ? []
            : List<Fulfillment>.from(
                json["fulfillments"]!.map((x) => Fulfillment.fromJson(x))),
        quote: json["quote"] == null ? null : Quote.fromJson(json["quote"]),
      );

  Map<String, dynamic> toJson() => {
        "provider": provider?.toJson(),
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "fulfillments": fulfillments == null
            ? []
            : List<dynamic>.from(fulfillments!.map((x) => x.toJson())),
        "quote": quote?.toJson(),
      };
}

class Fulfillment {
  final String? id;
  final bool? tracking;
  final SelectResponseState? state;
  final End? end;
  final String? ondcOrgProviderName;
  final String? ondcOrgCategory;
  final String? ondcOrgTat;

  Fulfillment({
    this.id,
    this.tracking,
    this.state,
    this.end,
    this.ondcOrgProviderName,
    this.ondcOrgCategory,
    this.ondcOrgTat,
  });

  Fulfillment copyWith({
    String? id,
    bool? tracking,
    SelectResponseState? state,
    End? end,
    String? ondcOrgProviderName,
    String? ondcOrgCategory,
    String? ondcOrgTat,
  }) =>
      Fulfillment(
        id: id ?? this.id,
        tracking: tracking ?? this.tracking,
        state: state ?? this.state,
        end: end ?? this.end,
        ondcOrgProviderName: ondcOrgProviderName ?? this.ondcOrgProviderName,
        ondcOrgCategory: ondcOrgCategory ?? this.ondcOrgCategory,
        ondcOrgTat: ondcOrgTat ?? this.ondcOrgTat,
      );

  factory Fulfillment.fromJson(Map<String, dynamic> json) => Fulfillment(
        id: json["id"].toString(),
        tracking: json["tracking"],
        state: json["state"] == null
            ? null
            : SelectResponseState.fromJson(json["state"]),
        end: json["end"] == null ? null : End.fromJson(json["end"]),
        ondcOrgProviderName: json["@ondc/org/provider_name"],
        ondcOrgCategory: json["@ondc/org/category"],
        ondcOrgTat: json["@ondc/org/TAT"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tracking": tracking,
        "state": state?.toJson(),
        "end": end?.toJson(),
        "@ondc/org/provider_name": ondcOrgProviderName,
        "@ondc/org/category": ondcOrgCategory,
        "@ondc/org/TAT": ondcOrgTat,
      };
}

class End {
  final EndLocation? location;

  End({
    this.location,
  });

  End copyWith({
    EndLocation? location,
  }) =>
      End(
        location: location ?? this.location,
      );

  factory End.fromJson(Map<String, dynamic> json) => End(
        location: json["location"] == null
            ? null
            : EndLocation.fromJson(json["location"]),
      );

  Map<String, dynamic> toJson() => {
        "location": location?.toJson(),
      };
}

class EndLocation {
  final String? gps;
  final Address? address;

  EndLocation({
    this.gps,
    this.address,
  });

  EndLocation copyWith({
    String? gps,
    Address? address,
  }) =>
      EndLocation(
        gps: gps ?? this.gps,
        address: address ?? this.address,
      );

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

class Address {
  final String? areaCode;

  Address({
    this.areaCode,
  });

  Address copyWith({
    String? areaCode,
  }) =>
      Address(
        areaCode: areaCode ?? this.areaCode,
      );

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        areaCode: json["area_code"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "area_code": areaCode,
      };
}

class SelectResponseState {
  final Descriptor? descriptor;

  SelectResponseState({
    this.descriptor,
  });

  SelectResponseState copyWith({
    Descriptor? descriptor,
  }) =>
      SelectResponseState(
        descriptor: descriptor ?? this.descriptor,
      );

  factory SelectResponseState.fromJson(Map<String, dynamic> json) =>
      SelectResponseState(
        descriptor: json["descriptor"] == null
            ? null
            : Descriptor.fromJson(json["descriptor"]),
      );

  Map<String, dynamic> toJson() => {
        "descriptor": descriptor?.toJson(),
      };
}

class Descriptor {
  final String? name;

  Descriptor({
    this.name,
  });

  Descriptor copyWith({
    String? name,
  }) =>
      Descriptor(
        name: name ?? this.name,
      );

  factory Descriptor.fromJson(Map<String, dynamic> json) => Descriptor(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class ItemElement {
  final String? id;
  final OndcOrgItemQuantityClass? quantity;
  final String? fulfillmentId;

  ItemElement({
    this.id,
    this.quantity,
    this.fulfillmentId,
  });

  ItemElement copyWith({
    String? id,
    OndcOrgItemQuantityClass? quantity,
    String? fulfillmentId,
  }) =>
      ItemElement(
        id: id ?? this.id,
        quantity: quantity ?? this.quantity,
        fulfillmentId: fulfillmentId ?? this.fulfillmentId,
      );

  factory ItemElement.fromJson(Map<String, dynamic> json) => ItemElement(
        id: json["id"].toString(),
        quantity: json["quantity"] == null
            ? null
            : OndcOrgItemQuantityClass.fromJson(json["quantity"]),
        fulfillmentId: json["fulfillment_id"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quantity": quantity?.toJson(),
        "fulfillment_id": fulfillmentId,
      };
}

class OndcOrgItemQuantityClass {
  final String? count;

  OndcOrgItemQuantityClass({
    this.count,
  });

  OndcOrgItemQuantityClass copyWith({
    String? count,
  }) =>
      OndcOrgItemQuantityClass(
        count: count ?? this.count,
      );

  factory OndcOrgItemQuantityClass.fromJson(Map<String, dynamic> json) =>
      OndcOrgItemQuantityClass(
        count: json["count"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
      };
}

class SelectResponseProvider {
  final String? id;
  final List<LocationElement>? locations;

  SelectResponseProvider({
    this.id,
    this.locations,
  });

  SelectResponseProvider copyWith({
    String? id,
    List<LocationElement>? locations,
  }) =>
      SelectResponseProvider(
        id: id ?? this.id,
        locations: locations ?? this.locations,
      );

  factory SelectResponseProvider.fromJson(Map<String, dynamic> json) =>
      SelectResponseProvider(
        id: json["id"].toString(),
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

  LocationElement copyWith({
    String? id,
  }) =>
      LocationElement(
        id: id ?? this.id,
      );

  factory LocationElement.fromJson(Map<String, dynamic> json) =>
      LocationElement(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}

class Quote {
  final List<Breakup>? breakup;
  final Price? price;
  final String? ttl;

  Quote({
    this.breakup,
    this.price,
    this.ttl,
  });

  Quote copyWith({
    List<Breakup>? breakup,
    Price? price,
    String? ttl,
  }) =>
      Quote(
        breakup: breakup ?? this.breakup,
        price: price ?? this.price,
        ttl: ttl ?? this.ttl,
      );

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        breakup: json["breakup"] == null
            ? []
            : List<Breakup>.from(
                json["breakup"]!.map((x) => Breakup.fromJson(x))),
        price: json["price"] == null ? null : Price.fromJson(json["price"]),
        ttl: json["ttl"],
      );

  Map<String, dynamic> toJson() => {
        "breakup": breakup == null
            ? []
            : List<dynamic>.from(breakup!.map((x) => x.toJson())),
        "price": price?.toJson(),
        "ttl": ttl,
      };
}

class Breakup {
  final BreakupItem? item;
  final String? title;
  final Price? price;
  final String? ondcOrgItemId;
  final OndcOrgItemQuantityClass? ondcOrgItemQuantity;
  final String? ondcOrgTitleType;

  Breakup({
    this.item,
    this.title,
    this.price,
    this.ondcOrgItemId,
    this.ondcOrgItemQuantity,
    this.ondcOrgTitleType,
  });

  Breakup copyWith({
    BreakupItem? item,
    String? title,
    Price? price,
    String? ondcOrgItemId,
    OndcOrgItemQuantityClass? ondcOrgItemQuantity,
    String? ondcOrgTitleType,
  }) =>
      Breakup(
        item: item ?? this.item,
        title: title ?? this.title,
        price: price ?? this.price,
        ondcOrgItemId: ondcOrgItemId ?? this.ondcOrgItemId,
        ondcOrgItemQuantity: ondcOrgItemQuantity ?? this.ondcOrgItemQuantity,
        ondcOrgTitleType: ondcOrgTitleType ?? this.ondcOrgTitleType,
      );

  factory Breakup.fromJson(Map<String, dynamic> json) => Breakup(
        item: json["item"] == null ? null : BreakupItem.fromJson(json["item"]),
        title: json["title"],
        price: json["price"] == null ? null : Price.fromJson(json["price"]),
        ondcOrgItemId: json["@ondc/org/item_id"],
        ondcOrgItemQuantity: json["@ondc/org/item_quantity"] == null
            ? null
            : OndcOrgItemQuantityClass.fromJson(
                json["@ondc/org/item_quantity"]),
        ondcOrgTitleType: json["@ondc/org/title_type"],
      );

  Map<String, dynamic> toJson() => {
        "item": item?.toJson(),
        "title": title,
        "price": price?.toJson(),
        "@ondc/org/item_id": ondcOrgItemId,
        "@ondc/org/item_quantity": ondcOrgItemQuantity?.toJson(),
        "@ondc/org/title_type": ondcOrgTitleType,
      };
}

class BreakupItem {
  final String? id;
  final PurpleQuantity? quantity;
  final Price? price;

  BreakupItem({
    this.id,
    this.quantity,
    this.price,
  });

  BreakupItem copyWith({
    String? id,
    PurpleQuantity? quantity,
    Price? price,
  }) =>
      BreakupItem(
        id: id ?? this.id,
        quantity: quantity ?? this.quantity,
        price: price ?? this.price,
      );

  factory BreakupItem.fromJson(Map<String, dynamic> json) => BreakupItem(
        id: json["id"],
        quantity: json["quantity"] == null
            ? null
            : PurpleQuantity.fromJson(json["quantity"]),
        price: json["price"] == null ? null : Price.fromJson(json["price"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quantity": quantity?.toJson(),
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

  Price copyWith({
    String? currency,
    String? value,
  }) =>
      Price(
        currency: currency ?? this.currency,
        value: value ?? this.value,
      );

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        currency: json["currency"],
        value: json["value"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "value": value,
      };
}

class PurpleQuantity {
  final OndcOrgItemQuantityClass? available;
  final OndcOrgItemQuantityClass? maximum;

  PurpleQuantity({
    this.available,
    this.maximum,
  });

  PurpleQuantity copyWith({
    OndcOrgItemQuantityClass? available,
    OndcOrgItemQuantityClass? maximum,
  }) =>
      PurpleQuantity(
        available: available ?? this.available,
        maximum: maximum ?? this.maximum,
      );

  factory PurpleQuantity.fromJson(Map<String, dynamic> json) => PurpleQuantity(
        available: json["available"] == null
            ? null
            : OndcOrgItemQuantityClass.fromJson(json["available"]),
        maximum: json["maximum"] == null
            ? null
            : OndcOrgItemQuantityClass.fromJson(json["maximum"]),
      );

  Map<String, dynamic> toJson() => {
        "available": available?.toJson(),
        "maximum": maximum?.toJson(),
      };
}





// class SelectResponseModel {
//   final Context? context;
//   final Message? message;

//   SelectResponseModel({
//     this.context,
//     this.message,
//   });

//   factory SelectResponseModel.fromJson(Map<String, dynamic> json) =>
//       SelectResponseModel(
//         context:
//             json["context"] == null ? null : Context.fromJson(json["context"]),
//         message:
//             json["message"] == null ? null : Message.fromJson(json["message"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "context": context?.toJson(),
//         "message": message?.toJson(),
//       };
// }

// class Context {
//   final String? domain;
//   final String? action;
//   final String? coreVersion;
//   final String? bapId;
//   final String? bapUri;
//   final String? bppId;
//   final String? bppUri;
//   final String? transactionId;
//   final String? messageId;
//   final String? city;
//   final String? country;
//   final DateTime? timestamp;

//   Context({
//     this.domain,
//     this.action,
//     this.coreVersion,
//     this.bapId,
//     this.bapUri,
//     this.bppId,
//     this.bppUri,
//     this.transactionId,
//     this.messageId,
//     this.city,
//     this.country,
//     this.timestamp,
//   });

//   factory Context.fromJson(Map<String, dynamic> json) => Context(
//         domain: json["domain"],
//         action: json["action"],
//         coreVersion: json["core_version"],
//         bapId: json["bap_id"],
//         bapUri: json["bap_uri"],
//         bppId: json["bpp_id"],
//         bppUri: json["bpp_uri"],
//         transactionId: json["transaction_id"],
//         messageId: json["message_id"],
//         city: json["city"],
//         country: json["country"],
//         timestamp: json["timestamp"] == null
//             ? null
//             : DateTime.parse(json["timestamp"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "domain": domain,
//         "action": action,
//         "core_version": coreVersion,
//         "bap_id": bapId,
//         "bap_uri": bapUri,
//         "bpp_id": bppId,
//         "bpp_uri": bppUri,
//         "transaction_id": transactionId,
//         "message_id": messageId,
//         "city": city,
//         "country": country,
//         "timestamp": timestamp?.toIso8601String(),
//       };
// }

// class Message {
//   final Order? order;

//   Message({
//     this.order,
//   });

//   factory Message.fromJson(Map<String, dynamic> json) => Message(
//         order: json["order"] == null ? null : Order.fromJson(json["order"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "order": order?.toJson(),
//       };
// }

// class Order {
//   final OndcProvider? provider;
//   final List<ItemElement>? items;
//   final List<Fulfillment>? fulfillments;
//   final Quote? quote;

//   Order({
//     this.provider,
//     this.items,
//     this.fulfillments,
//     this.quote,
//   });

//   factory Order.fromJson(Map<String, dynamic> json) => Order(
//         provider: json["provider"] == null
//             ? null
//             : OndcProvider.fromJson(json["provider"]),
//         items: json["items"] == null
//             ? []
//             : List<ItemElement>.from(
//                 json["items"]!.map((x) => ItemElement.fromJson(x))),
//         fulfillments: json["fulfillments"] == null
//             ? []
//             : List<Fulfillment>.from(
//                 json["fulfillments"]!.map((x) => Fulfillment.fromJson(x))),
//         quote: json["quote"] == null ? null : Quote.fromJson(json["quote"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "provider": provider?.toJson(),
//         "items": items == null
//             ? []
//             : List<dynamic>.from(items!.map((x) => x.toJson())),
//         "fulfillments": fulfillments == null
//             ? []
//             : List<dynamic>.from(fulfillments!.map((x) => x.toJson())),
//         "quote": quote?.toJson(),
//       };
// }

// class Fulfillment {
//   final String? id;
//   final String? type;
//   final String? ondcOrgProviderName;
//   final bool? tracking;
//   final String? ondcOrgCategory;
//   final String? ondcOrgTat;
//   final OndcState? state;

//   Fulfillment({
//     this.id,
//     this.type,
//     this.ondcOrgProviderName,
//     this.tracking,
//     this.ondcOrgCategory,
//     this.ondcOrgTat,
//     this.state,
//   });

//   factory Fulfillment.fromJson(Map<String, dynamic> json) => Fulfillment(
//         id: json["id"],
//         type: json["type"],
//         ondcOrgProviderName: json["@ondc/org/provider_name"],
//         tracking: json["tracking"],
//         ondcOrgCategory: json["@ondc/org/category"],
//         ondcOrgTat: json["@ondc/org/TAT"],
//         state: json["state"] == null ? null : OndcState.fromJson(json["state"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "type": type,
//         "@ondc/org/provider_name": ondcOrgProviderName,
//         "tracking": tracking,
//         "@ondc/org/category": ondcOrgCategory,
//         "@ondc/org/TAT": ondcOrgTat,
//         "state": state?.toJson(),
//       };
// }

// class OndcState {
//   final Descriptor? descriptor;

//   OndcState({
//     this.descriptor,
//   });

//   factory OndcState.fromJson(Map<String, dynamic> json) => OndcState(
//         descriptor: json["descriptor"] == null
//             ? null
//             : Descriptor.fromJson(json["descriptor"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "descriptor": descriptor?.toJson(),
//       };
// }

// class Descriptor {
//   final String? name;

//   Descriptor({
//     this.name,
//   });

//   factory Descriptor.fromJson(Map<String, dynamic> json) => Descriptor(
//         name: json["name"],
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name,
//       };
// }

// class ItemElement {
//   final String? fulfillmentId;
//   final String? id;

//   ItemElement({
//     this.fulfillmentId,
//     this.id,
//   });

//   factory ItemElement.fromJson(Map<String, dynamic> json) => ItemElement(
//         fulfillmentId: json["fulfillment_id"],
//         id: json["id"],
//       );

//   Map<String, dynamic> toJson() => {
//         "fulfillment_id": fulfillmentId,
//         "id": id,
//       };
// }

// class OndcProvider {
//   final String? id;

//   OndcProvider({
//     this.id,
//   });

//   factory OndcProvider.fromJson(Map<String, dynamic> json) => OndcProvider(
//         id: json["id"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//       };
// }

// class Quote {
//   final Price? price;
//   final List<Breakup>? breakup;
//   final String? ttl;

//   Quote({
//     this.price,
//     this.breakup,
//     this.ttl,
//   });

//   factory Quote.fromJson(Map<String, dynamic> json) => Quote(
//         price: json["price"] == null ? null : Price.fromJson(json["price"]),
//         breakup: json["breakup"] == null
//             ? []
//             : List<Breakup>.from(
//                 json["breakup"]!.map((x) => Breakup.fromJson(x))),
//         ttl: json["ttl"],
//       );

//   Map<String, dynamic> toJson() => {
//         "price": price?.toJson(),
//         "breakup": breakup == null
//             ? []
//             : List<dynamic>.from(breakup!.map((x) => x.toJson())),
//         "ttl": ttl,
//       };
// }

// class Breakup {
//   final String? ondcOrgItemId;
//   final OndcOrgItemQuantity? ondcOrgItemQuantity;
//   final String? title;
//   final String? ondcOrgTitleType;
//   final Price? price;
//   final BreakupItem? item;

//   Breakup({
//     this.ondcOrgItemId,
//     this.ondcOrgItemQuantity,
//     this.title,
//     this.ondcOrgTitleType,
//     this.price,
//     this.item,
//   });

//   factory Breakup.fromJson(Map<String, dynamic> json) => Breakup(
//         ondcOrgItemId: json["@ondc/org/item_id"],
//         ondcOrgItemQuantity: json["@ondc/org/item_quantity"] == null
//             ? null
//             : OndcOrgItemQuantity.fromJson(json["@ondc/org/item_quantity"]),
//         title: json["title"],
//         ondcOrgTitleType: json["@ondc/org/title_type"],
//         price: json["price"] == null ? null : Price.fromJson(json["price"]),
//         item: json["item"] == null ? null : BreakupItem.fromJson(json["item"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "@ondc/org/item_id": ondcOrgItemId,
//         "@ondc/org/item_quantity": ondcOrgItemQuantity?.toJson(),
//         "title": title,
//         "@ondc/org/title_type": ondcOrgTitleType,
//         "price": price?.toJson(),
//         "item": item?.toJson(),
//       };
// }

// class BreakupItem {
//   final Quantity? quantity;
//   final Price? price;

//   BreakupItem({
//     this.quantity,
//     this.price,
//   });

//   factory BreakupItem.fromJson(Map<String, dynamic> json) => BreakupItem(
//         quantity: json["quantity"] == null
//             ? null
//             : Quantity.fromJson(json["quantity"]),
//         price: json["price"] == null ? null : Price.fromJson(json["price"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "quantity": quantity?.toJson(),
//         "price": price?.toJson(),
//       };
// }

// class Price {
//   final String? currency;
//   final String? value;

//   Price({
//     this.currency,
//     this.value,
//   });

//   factory Price.fromJson(Map<String, dynamic> json) => Price(
//         currency: json["currency"],
//         value: json["value"].toString(),
//       );

//   Map<String, dynamic> toJson() => {
//         "currency": currency,
//         "value": value,
//       };
// }

// class Quantity {
//   final OndcOrgItemQuantity? available;
//   final OndcOrgItemQuantity? maximum;

//   Quantity({
//     this.available,
//     this.maximum,
//   });

//   factory Quantity.fromJson(Map<String, dynamic> json) => Quantity(
//         available: json["available"] == null
//             ? null
//             : OndcOrgItemQuantity.fromJson(json["available"]),
//         maximum: json["maximum"] == null
//             ? null
//             : OndcOrgItemQuantity.fromJson(json["maximum"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "available": available?.toJson(),
//         "maximum": maximum?.toJson(),
//       };
// }

// class OndcOrgItemQuantity {
//   final String? count;

//   OndcOrgItemQuantity({
//     this.count,
//   });

//   factory OndcOrgItemQuantity.fromJson(Map<String, dynamic> json) =>
//       OndcOrgItemQuantity(
//         count: json["count"].toString(),
//       );

//   Map<String, dynamic> toJson() => {
//         "count": count,
//       };
// }
