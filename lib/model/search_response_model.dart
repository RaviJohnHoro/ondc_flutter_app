class SearchResponseModel {
  final Context? context;
  final Message? message;
  final Error? error;

  SearchResponseModel({
    this.context,
    this.message,
    this.error,
  });

  factory SearchResponseModel.fromJson(Map<String, dynamic> json) =>
      SearchResponseModel(
        context:
            json["context"] == null ? null : Context.fromJson(json["context"]),
        message:
            json["message"] == null ? null : Message.fromJson(json["message"]),
        error: json["error"] == null ? null : Error.fromJson(json["error"]),
      );

  Map<String, dynamic> toJson() => {
        "context": context?.toJson(),
        "message": message?.toJson(),
      };
}

class Error {
  final String? type;
  final String? code;
  final String? message;

  Error({
    this.type,
    this.code,
    this.message,
  });

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        type: json["type"],
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "code": code,
        "message": message,
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
  final String? bppId;
  final String? bppUri;
  final String? transactionId;
  final String? messageId;
  final DateTime? timestamp;

  Context({
    this.domain,
    this.country,
    this.city,
    this.action,
    this.coreVersion,
    this.bapId,
    this.bapUri,
    this.bppId,
    this.bppUri,
    this.transactionId,
    this.messageId,
    this.timestamp,
  });

  factory Context.fromJson(Map<String, dynamic> json) => Context(
        domain: json["domain"],
        country: json["country"],
        city: json["city"],
        action: json["action"],
        coreVersion: json["core_version"],
        bapId: json["bap_id"],
        bapUri: json["bap_uri"],
        bppId: json["bpp_id"],
        bppUri: json["bpp_uri"],
        transactionId: json["transaction_id"],
        messageId: json["message_id"],
        timestamp: json["timestamp"] == null
            ? null
            : DateTime.parse(json["timestamp"]),
      );

  Map<String, dynamic> toJson() => {
        "domain": domain,
        "country": country,
        "city": city,
        "action": action,
        "core_version": coreVersion,
        "bap_id": bapId,
        "bap_uri": bapUri,
        "bpp_id": bppId,
        "bpp_uri": bppUri,
        "transaction_id": transactionId,
        "message_id": messageId,
        "timestamp": timestamp?.toIso8601String(),
      };
}

class Message {
  final Catalog? catalog;

  Message({
    this.catalog,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        catalog:
            json["catalog"] == null ? null : Catalog.fromJson(json["catalog"]),
      );

  Map<String, dynamic> toJson() => {
        "catalog": catalog?.toJson(),
      };
}

class Catalog {
  final BppDescriptorClass? bppDescriptor;
  final List<BppFulfillment>? bppFulfillments;
  final List<BppProvider>? bppProviders;

  Catalog({
    this.bppDescriptor,
    this.bppFulfillments,
    this.bppProviders,
  });

  factory Catalog.fromJson(Map<String, dynamic> json) => Catalog(
        bppDescriptor: json["bpp/descriptor"] == null
            ? null
            : BppDescriptorClass.fromJson(json["bpp/descriptor"]),
        bppFulfillments: json["bpp/fulfillments"] == null
            ? []
            : List<BppFulfillment>.from(json["bpp/fulfillments"]!
                .map((x) => BppFulfillment.fromJson(x))),
        bppProviders: json["bpp/providers"] == null
            ? []
            : List<BppProvider>.from(
                json["bpp/providers"]!.map((x) => BppProvider.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "bpp/descriptor": bppDescriptor?.toJson(),
        "bpp/fulfillments": bppFulfillments == null
            ? []
            : List<dynamic>.from(bppFulfillments!.map((x) => x.toJson())),
        "bpp/providers": bppProviders == null
            ? []
            : List<dynamic>.from(bppProviders!.map((x) => x.toJson())),
      };
}

class BppDescriptorClass {
  final String? code;
  final String? name;
  final String? symbol;
  final String? shortDesc;
  final String? longDesc;
  final List<String>? images;

  BppDescriptorClass({
    this.code,
    this.name,
    this.symbol,
    this.shortDesc,
    this.longDesc,
    this.images,
  });

  factory BppDescriptorClass.fromJson(Map<String, dynamic> json) =>
      BppDescriptorClass(
        code: json["code"],
        name: json["name"],
        symbol: json["symbol"],
        shortDesc: json["short_desc"],
        longDesc: json["long_desc"],
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "symbol": symbol,
        "short_desc": shortDesc,
        "long_desc": longDesc,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
      };
}

class BppFulfillment {
  final String? id;
  final String? type;

  BppFulfillment({
    this.id,
    this.type,
  });

  factory BppFulfillment.fromJson(Map<String, dynamic> json) => BppFulfillment(
        id: json["id"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
      };
}

class BppProvider {
  final String? id;
  final BppDescriptorClass? descriptor;
  final String? ondcOrgFssaiLicenseNo;
  final BppProviderTime? time;
  final String? ttl;
  final List<Location>? locations;
  final List<Fulfillment>? fulfillments;
  final List<Category>? categories;
  final List<Item>? items;
  final List<dynamic>? offers;
  final List<Tag>? tags;

  BppProvider({
    this.id,
    this.descriptor,
    this.ondcOrgFssaiLicenseNo,
    this.time,
    this.ttl,
    this.locations,
    this.fulfillments,
    this.categories,
    this.items,
    this.offers,
    this.tags,
  });

  factory BppProvider.fromJson(Map<String, dynamic> json) => BppProvider(
        id: json["id"],
        descriptor: json["descriptor"] == null
            ? null
            : BppDescriptorClass.fromJson(json["descriptor"]),
        ondcOrgFssaiLicenseNo: json["@ondc/org/fssai_license_no"],
        time: json["time"] == null
            ? null
            : BppProviderTime.fromJson(json["time"]),
        ttl: json["ttl"],
        locations: json["locations"] == null
            ? []
            : List<Location>.from(
                json["locations"]!.map((x) => Location.fromJson(x))),
        fulfillments: json["fulfillments"] == null
            ? []
            : List<Fulfillment>.from(
                json["fulfillments"]!.map((x) => Fulfillment.fromJson(x))),
        categories: json["categories"] == null
            ? []
            : List<Category>.from(
                json["categories"]!.map((x) => Category.fromJson(x))),
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
        offers: json["offers"] == null
            ? []
            : List<dynamic>.from(json["offers"]!.map((x) => x)),
        tags: json["tags"] == null
            ? []
            : List<Tag>.from(json["tags"]!.map((x) => Tag.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "descriptor": descriptor?.toJson(),
        "@ondc/org/fssai_license_no": ondcOrgFssaiLicenseNo,
        "time": time?.toJson(),
        "ttl": ttl,
        "locations": locations == null
            ? []
            : List<dynamic>.from(locations!.map((x) => x.toJson())),
        "fulfillments": fulfillments == null
            ? []
            : List<dynamic>.from(fulfillments!.map((x) => x.toJson())),
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "offers":
            offers == null ? [] : List<dynamic>.from(offers!.map((x) => x)),
        "tags": tags == null
            ? []
            : List<dynamic>.from(tags!.map((x) => x.toJson())),
      };
}

class Category {
  final String? id;
  final String? parentCategoryId;
  final CategoryDescriptor? descriptor;
  final List<Tag>? tags;

  Category({
    this.id,
    this.parentCategoryId,
    this.descriptor,
    this.tags,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        parentCategoryId: json["parent_category_id"],
        descriptor: json["descriptor"] == null
            ? null
            : CategoryDescriptor.fromJson(json["descriptor"]),
        tags: json["tags"] == null
            ? []
            : List<Tag>.from(json["tags"]!.map((x) => Tag.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "parent_category_id": parentCategoryId,
        "descriptor": descriptor?.toJson(),
        "tags": tags == null
            ? []
            : List<dynamic>.from(tags!.map((x) => x.toJson())),
      };
}

class CategoryDescriptor {
  final String? name;
  final String? shortDesc;
  final String? longDesc;
  final List<String>? images;
  final String? symbol;

  CategoryDescriptor({
    this.name,
    this.shortDesc,
    this.longDesc,
    this.images,
    this.symbol,
  });

  factory CategoryDescriptor.fromJson(Map<String, dynamic> json) =>
      CategoryDescriptor(
        name: json["name"],
        shortDesc: json["short_desc"],
        longDesc: json["long_desc"],
        images: (json["images"] as List<dynamic>?)
                ?.where((x) => x != null)
                .map((x) => x.toString())
                .toList() ??
            [],
        // images: json["images"] == null
        //     ? []
        //     : List<String>.from(json["images"]!.map((x) => x)),
        symbol: json["symbol"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "short_desc": shortDesc,
        "long_desc": longDesc,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "symbol": symbol,
      };
}

class Tag {
  final String? code;
  final List<ListElement>? list;

  Tag({
    this.code,
    this.list,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        code: json["code"],
        list: json["list"] == null
            ? []
            : List<ListElement>.from(
                json["list"]!.map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "list": list == null
            ? []
            : List<dynamic>.from(list!.map((x) => x.toJson())),
      };
}

class ListElement {
  final String? code;
  final String? value;

  ListElement({
    this.code,
    this.value,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        code: json["code"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "value": value,
      };
}

class Fulfillment {
  final String? id;
  final String? type;
  final Start? start;
  final Contact? contact;

  Fulfillment({
    this.id,
    this.type,
    this.start,
    this.contact,
  });

  factory Fulfillment.fromJson(Map<String, dynamic> json) => Fulfillment(
        id: json["id"],
        type: json["type"],
        start: json["start"] == null ? null : Start.fromJson(json["start"]),
        contact:
            json["contact"] == null ? null : Contact.fromJson(json["contact"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "start": start?.toJson(),
        "contact": contact?.toJson(),
      };
}

class Contact {
  final String? phone;
  final String? email;

  Contact({
    this.phone,
    this.email,
  });

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        phone: json["phone"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "email": email,
      };
}

class Start {
  final StartTime? time;

  Start({
    this.time,
  });

  factory Start.fromJson(Map<String, dynamic> json) => Start(
        time: json["time"] == null ? null : StartTime.fromJson(json["time"]),
      );

  Map<String, dynamic> toJson() => {
        "time": time?.toJson(),
      };
}

class StartTime {
  final Range? range;

  StartTime({
    this.range,
  });

  factory StartTime.fromJson(Map<String, dynamic> json) => StartTime(
        range: json["range"] == null ? null : Range.fromJson(json["range"]),
      );

  Map<String, dynamic> toJson() => {
        "range": range?.toJson(),
      };
}

class Range {
  final String? start;
  final String? end;

  Range({
    this.start,
    this.end,
  });

  factory Range.fromJson(Map<String, dynamic> json) => Range(
        start: json["start"],
        end: json["end"],
      );

  Map<String, dynamic> toJson() => {
        "start": start,
        "end": end,
      };
}

class Item {
  final String? id;
  final CategoryDescriptor? descriptor;
  final Quantity? quantity;
  final Price? price;
  final String? categoryId;
  final List<String>? categoryIds;
  final String? fulfillmentId;
  final String? locationId;
  final bool? related;
  final bool? recommended;
  final String? ondcOrgReturnable;
  final String? ondcOrgCancellable;
  final String? ondcOrgReturnWindow;
  final String? ondcOrgSellerPickupReturn;
  final String? ondcOrgTimeToShip;
  final String? ondcOrgAvailableOnCod;
  final String? ondcOrgContactDetailsConsumerCare;
  final List<dynamic>? addOns;
  //inal Tags? tags;

  Item({
    this.id,
    this.descriptor,
    this.quantity,
    this.price,
    this.categoryId,
    this.categoryIds,
    this.fulfillmentId,
    this.locationId,
    this.related,
    this.recommended,
    this.ondcOrgReturnable,
    this.ondcOrgCancellable,
    this.ondcOrgReturnWindow,
    this.ondcOrgSellerPickupReturn,
    this.ondcOrgTimeToShip,
    this.ondcOrgAvailableOnCod,
    this.ondcOrgContactDetailsConsumerCare,
    this.addOns,
    //this.tags,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        descriptor: json["descriptor"] == null
            ? null
            : CategoryDescriptor.fromJson(json["descriptor"]),
        quantity: json["quantity"] == null
            ? null
            : Quantity.fromJson(json["quantity"]),
        price: json["price"] == null ? null : Price.fromJson(json["price"]),
        categoryId: json["category_id"],
        categoryIds: json["category_ids"] == null
            ? []
            : List<String>.from(json["category_ids"]!.map((x) => x)),
        fulfillmentId: json["fulfillment_id"],
        locationId: json["location_id"],
        related: json["related"],
        recommended: json["recommended"],
        ondcOrgReturnable: json["@ondc/org/returnable"].toString(),
        ondcOrgCancellable: json["@ondc/org/cancellable"].toString(),
        ondcOrgReturnWindow: json["@ondc/org/return_window"],
        ondcOrgSellerPickupReturn:
            json["@ondc/org/seller_pickup_return"].toString(),
        ondcOrgTimeToShip: json["@ondc/org/time_to_ship"],
        ondcOrgAvailableOnCod: json["@ondc/org/available_on_cod"].toString(),
        ondcOrgContactDetailsConsumerCare:
            json["@ondc/org/contact_details_consumer_care"],
        addOns: json["add-ons"] == null
            ? []
            : List<dynamic>.from(json["add-ons"]!.map((x) => x)),
        //tags: json["tags"] == null ? null : Tags.fromJson(json["tags"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "descriptor": descriptor?.toJson(),
        "quantity": quantity?.toJson(),
        "price": price?.toJson(),
        "category_id": categoryId,
        "category_ids": categoryIds == null
            ? []
            : List<dynamic>.from(categoryIds!.map((x) => x)),
        "fulfillment_id": fulfillmentId,
        "location_id": locationId,
        "related": related,
        "recommended": recommended,
        "@ondc/org/returnable": ondcOrgReturnable,
        "@ondc/org/cancellable": ondcOrgCancellable,
        "@ondc/org/return_window": ondcOrgReturnWindow,
        "@ondc/org/seller_pickup_return": ondcOrgSellerPickupReturn,
        "@ondc/org/time_to_ship": ondcOrgTimeToShip,
        "@ondc/org/available_on_cod": ondcOrgAvailableOnCod,
        "@ondc/org/contact_details_consumer_care":
            ondcOrgContactDetailsConsumerCare,
        "add-ons":
            addOns == null ? [] : List<dynamic>.from(addOns!.map((x) => x)),
        //"tags": tags?.toJson(),
      };
}

class Price {
  final String? currency;
  final String? value;
  final String? maximumValue;

  Price({
    this.currency,
    this.value,
    this.maximumValue,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        currency: json["currency"],
        value: json["value"].toString(),
        maximumValue: json["maximum_value"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "value": value,
        "maximum_value": maximumValue,
      };
}

class Quantity {
  final Unitized? unitized;
  final Available? available;
  final Available? maximum;

  Quantity({
    this.unitized,
    this.available,
    this.maximum,
  });

  factory Quantity.fromJson(Map<String, dynamic> json) => Quantity(
        unitized: json["unitized"] == null
            ? null
            : Unitized.fromJson(json["unitized"]),
        available: json["available"] == null
            ? null
            : Available.fromJson(json["available"]),
        maximum: json["maximum"] == null
            ? null
            : Available.fromJson(json["maximum"]),
      );

  Map<String, dynamic> toJson() => {
        "unitized": unitized?.toJson(),
        "available": available?.toJson(),
        "maximum": maximum?.toJson(),
      };
}

class Available {
  final String? count;

  Available({
    this.count,
  });

  factory Available.fromJson(Map<String, dynamic> json) => Available(
        count: json["count"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
      };
}

class Unitized {
  final Radius? measure;

  Unitized({
    this.measure,
  });

  factory Unitized.fromJson(Map<String, dynamic> json) => Unitized(
        measure:
            json["measure"] == null ? null : Radius.fromJson(json["measure"]),
      );

  Map<String, dynamic> toJson() => {
        "measure": measure?.toJson(),
      };
}

class Radius {
  final String? unit;
  final String? value;

  Radius({
    this.unit,
    this.value,
  });

  factory Radius.fromJson(Map<String, dynamic> json) => Radius(
        unit: json["unit"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "unit": unit,
        "value": value,
      };
}

class Tags {
  final String? veg;
  final String? nonVeg;

  Tags({
    this.veg,
    this.nonVeg,
  });

  factory Tags.fromJson(Map<String, dynamic> json) => Tags(
        veg: json["veg"],
        nonVeg: json["non_veg"],
      );

  Map<String, dynamic> toJson() => {
        "veg": veg,
        "non_veg": nonVeg,
      };
}

class Location {
  final String? id;
  final String? gps;
  final Address? address;
  final Circle? circle;
  final LocationTime? time;

  Location({
    this.id,
    this.gps,
    this.address,
    this.circle,
    this.time,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
        gps: json["gps"],
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
        circle: json["circle"] == null ? null : Circle.fromJson(json["circle"]),
        time: json["time"] == null ? null : LocationTime.fromJson(json["time"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "gps": gps,
        "address": address?.toJson(),
        "circle": circle?.toJson(),
        "time": time?.toJson(),
      };
}

class Address {
  final String? locality;
  final String? street;
  final String? city;
  final String? areaCode;
  final String? state;

  Address({
    this.locality,
    this.street,
    this.city,
    this.areaCode,
    this.state,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        locality: json["locality"],
        street: json["street"],
        city: json["city"],
        areaCode: json["area_code"],
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "locality": locality,
        "street": street,
        "city": city,
        "area_code": areaCode,
        "state": state,
      };
}

class Circle {
  final String? gps;
  final Radius? radius;

  Circle({
    this.gps,
    this.radius,
  });

  factory Circle.fromJson(Map<String, dynamic> json) => Circle(
        gps: json["gps"],
        radius: json["radius"] == null ? null : Radius.fromJson(json["radius"]),
      );

  Map<String, dynamic> toJson() => {
        "gps": gps,
        "radius": radius?.toJson(),
      };
}

class LocationTime {
  final String? days;
  final Schedule? schedule;
  final Range? range;

  LocationTime({
    this.days,
    this.schedule,
    this.range,
  });

  factory LocationTime.fromJson(Map<String, dynamic> json) => LocationTime(
        days: json["days"],
        schedule: json["schedule"] == null
            ? null
            : Schedule.fromJson(json["schedule"]),
        range: json["range"] == null ? null : Range.fromJson(json["range"]),
      );

  Map<String, dynamic> toJson() => {
        "days": days,
        "schedule": schedule?.toJson(),
        "range": range?.toJson(),
      };
}

class Schedule {
  final List<DateTime>? holidays;
  final String? frequency;
  final List<String>? times;

  Schedule({
    this.holidays,
    this.frequency,
    this.times,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        holidays: json["holidays"] == null
            ? []
            : List<DateTime>.from(
                json["holidays"]!.map((x) => DateTime.parse(x))),
        frequency: json["frequency"],
        times: json["times"] == null
            ? []
            : List<String>.from(json["times"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "holidays": holidays == null
            ? []
            : List<dynamic>.from(holidays!.map((x) =>
                "${x.year.toString().padLeft(4, '0')}-${x.month.toString().padLeft(2, '0')}-${x.day.toString().padLeft(2, '0')}")),
        "frequency": frequency,
        "times": times == null ? [] : List<dynamic>.from(times!.map((x) => x)),
      };
}

class BppProviderTime {
  final String? label;
  final DateTime? timestamp;

  BppProviderTime({
    this.label,
    this.timestamp,
  });

  factory BppProviderTime.fromJson(Map<String, dynamic> json) =>
      BppProviderTime(
        label: json["label"],
        timestamp: json["timestamp"] == null
            ? null
            : DateTime.parse(json["timestamp"]),
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "timestamp": timestamp?.toIso8601String(),
      };
}



// class SearchResponseModel {
//   final Context? context;
//   final Message? message;
//   final Error? error;

//   SearchResponseModel({
//     this.context,
//     this.message,
//     this.error,
//   });

//   factory SearchResponseModel.fromJson(Map<String, dynamic> json) =>
//       SearchResponseModel(
//         context:
//             json["context"] == null ? null : Context.fromJson(json["context"]),
//         message:
//             json["message"] == null ? null : Message.fromJson(json["message"]),
//         error: json["error"] == null ? null : Error.fromJson(json["error"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "context": context?.toJson(),
//         "message": message?.toJson(),
//         "error": error?.toJson(),
//       };
// }

// class Context {
//   final String? domain;
//   final String? country;
//   final String? city;
//   final String? action;
//   final String? coreVersion;
//   final String? bapId;
//   final String? bapUri;
//   final String? transactionId;
//   final String? messageId;
//   final DateTime? timestamp;
//   final String? ttl;
//   final String? bppId;
//   final String? bppUri;

//   Context({
//     this.domain,
//     this.country,
//     this.city,
//     this.action,
//     this.coreVersion,
//     this.bapId,
//     this.bapUri,
//     this.transactionId,
//     this.messageId,
//     this.timestamp,
//     this.ttl,
//     this.bppId,
//     this.bppUri,
//   });

//   factory Context.fromJson(Map<String, dynamic> json) => Context(
//         domain: json["domain"],
//         country: json["country"],
//         city: json["city"],
//         action: json["action"],
//         coreVersion: json["core_version"],
//         bapId: json["bap_id"],
//         bapUri: json["bap_uri"],
//         transactionId: json["transaction_id"],
//         messageId: json["message_id"],
//         timestamp: json["timestamp"] == null
//             ? null
//             : DateTime.parse(json["timestamp"]),
//         ttl: json["ttl"],
//         bppId: json["bpp_id"],
//         bppUri: json["bpp_uri"],
//       );

//   Map<String, dynamic> toJson() => {
//         "domain": domain,
//         "country": country,
//         "city": city,
//         "action": action,
//         "core_version": coreVersion,
//         "bap_id": bapId,
//         "bap_uri": bapUri,
//         "transaction_id": transactionId,
//         "message_id": messageId,
//         "timestamp": timestamp?.toIso8601String(),
//         "ttl": ttl,
//         "bpp_id": bppId,
//         "bpp_uri": bppUri,
//       };
// }

// class Error {
//   final String? type;
//   final String? code;
//   final String? message;

//   Error({
//     this.type,
//     this.code,
//     this.message,
//   });

//   factory Error.fromJson(Map<String, dynamic> json) => Error(
//         type: json["type"],
//         code: json["code"],
//         message: json["message"],
//       );

//   Map<String, dynamic> toJson() => {
//         "type": type,
//         "code": code,
//         "message": message,
//       };
// }

// class Message {
//   final Catalog? catalog;

//   Message({
//     this.catalog,
//   });

//   factory Message.fromJson(Map<String, dynamic> json) => Message(
//         catalog:
//             json["catalog"] == null ? null : Catalog.fromJson(json["catalog"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "catalog": catalog?.toJson(),
//       };
// }

// class Catalog {
//   final List<BppFulfillment>? bppFulfillments;
//   final BppDescriptor? bppDescriptor;
//   final List<dynamic>? bppProviders;

//   Catalog({
//     this.bppFulfillments,
//     this.bppDescriptor,
//     this.bppProviders,
//   });

//   factory Catalog.fromJson(Map<String, dynamic> json) => Catalog(
//         bppFulfillments: json["bpp/fulfillments"] == null
//             ? []
//             : List<BppFulfillment>.from(json["bpp/fulfillments"]!
//                 .map((x) => BppFulfillment.fromJson(x))),
//         bppDescriptor: json["bpp/descriptor"] == null
//             ? null
//             : BppDescriptor.fromJson(json["bpp/descriptor"]),
//         bppProviders: json["bpp/providers"] == null
//             ? []
//             : List<dynamic>.from(json["bpp/providers"]!.map((x) => x)),
//       );

//   Map<String, dynamic> toJson() => {
//         "bpp/fulfillments": bppFulfillments == null
//             ? []
//             : List<dynamic>.from(bppFulfillments!.map((x) => x.toJson())),
//         "bpp/descriptor": bppDescriptor?.toJson(),
//         "bpp/providers": bppProviders == null
//             ? []
//             : List<dynamic>.from(bppProviders!.map((x) => x)),
//       };
// }

// class BppDescriptor {
//   final String? name;
//   final String? symbol;
//   final String? shortDesc;
//   final String? longDesc;
//   final List<String>? images;

//   BppDescriptor({
//     this.name,
//     this.symbol,
//     this.shortDesc,
//     this.longDesc,
//     this.images,
//   });

//   factory BppDescriptor.fromJson(Map<String, dynamic> json) => BppDescriptor(
//         name: json["name"],
//         symbol: json["symbol"],
//         shortDesc: json["short_desc"],
//         longDesc: json["long_desc"],
//         images: json["images"] == null
//             ? []
//             : List<String>.from(json["images"]!.map((x) => x)),
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "symbol": symbol,
//         "short_desc": shortDesc,
//         "long_desc": longDesc,
//         "images":
//             images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
//       };
// }

// class BppFulfillment {
//   final String? id;
//   final String? type;

//   BppFulfillment({
//     this.id,
//     this.type,
//   });

//   factory BppFulfillment.fromJson(Map<String, dynamic> json) => BppFulfillment(
//         id: json["id"],
//         type: json["type"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "type": type,
//       };
// }
