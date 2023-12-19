class SelectOrderRequestModel {
  final SelectOrder? order;

  SelectOrderRequestModel({
    this.order,
  });

  SelectOrderRequestModel copyWith({
    SelectOrder? order,
  }) =>
      SelectOrderRequestModel(
        order: order ?? this.order,
      );

  factory SelectOrderRequestModel.fromJson(Map<String, dynamic> json) =>
      SelectOrderRequestModel(
        order:
            json["order"] == null ? null : SelectOrder.fromJson(json["order"]),
      );

  Map<String, dynamic> toJson() => {
        "order": order?.toJson(),
      };
}

class SelectOrder {
  final List<SelectItem>? items;
  final SelectProvider? provider;
  final List<SelectFulfillment>? fulfillments;

  SelectOrder({
    this.items,
    this.provider,
    this.fulfillments,
  });

  SelectOrder copyWith({
    List<SelectItem>? items,
    SelectProvider? provider,
    List<SelectFulfillment>? fulfillments,
  }) =>
      SelectOrder(
        items: items ?? this.items,
        provider: provider ?? this.provider,
        fulfillments: fulfillments ?? this.fulfillments,
      );

  factory SelectOrder.fromJson(Map<String, dynamic> json) => SelectOrder(
        items: json["items"] == null
            ? []
            : List<SelectItem>.from(
                json["items"]!.map((x) => SelectItem.fromJson(x))),
        provider: json["provider"] == null
            ? null
            : SelectProvider.fromJson(json["provider"]),
        fulfillments: json["fulfillments"] == null
            ? []
            : List<SelectFulfillment>.from(json["fulfillments"]!
                .map((x) => SelectFulfillment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "provider": provider?.toJson(),
        "fulfillments": fulfillments == null
            ? []
            : List<dynamic>.from(fulfillments!.map((x) => x.toJson())),
      };
}

class SelectFulfillment {
  final End? end;

  SelectFulfillment({
    this.end,
  });

  SelectFulfillment copyWith({
    End? end,
  }) =>
      SelectFulfillment(
        end: end ?? this.end,
      );

  factory SelectFulfillment.fromJson(Map<String, dynamic> json) =>
      SelectFulfillment(
        end: json["end"] == null ? null : End.fromJson(json["end"]),
      );

  Map<String, dynamic> toJson() => {
        "end": end?.toJson(),
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
        areaCode: json["area_code"],
      );

  Map<String, dynamic> toJson() => {
        "area_code": areaCode,
      };
}

class SelectItem {
  final String? id;
  final SelectQuantity? quantity;

  SelectItem({
    this.id,
    this.quantity,
  });

  SelectItem copyWith({
    String? id,
    SelectQuantity? quantity,
  }) =>
      SelectItem(
        id: id ?? this.id,
        quantity: quantity ?? this.quantity,
      );

  factory SelectItem.fromJson(Map<String, dynamic> json) => SelectItem(
        id: json["id"],
        quantity: json["quantity"] == null
            ? null
            : SelectQuantity.fromJson(json["quantity"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quantity": quantity?.toJson(),
      };
}

class SelectQuantity {
  final String? count;

  SelectQuantity({
    this.count,
  });

  SelectQuantity copyWith({
    String? count,
  }) =>
      SelectQuantity(
        count: count ?? this.count,
      );

  factory SelectQuantity.fromJson(Map<String, dynamic> json) => SelectQuantity(
        count: json["count"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
      };
}

class SelectProvider {
  final String? id;
  final List<LocationElement>? locations;

  SelectProvider({
    this.id,
    this.locations,
  });

  SelectProvider copyWith({
    String? id,
    List<LocationElement>? locations,
  }) =>
      SelectProvider(
        id: id ?? this.id,
        locations: locations ?? this.locations,
      );

  factory SelectProvider.fromJson(Map<String, dynamic> json) => SelectProvider(
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



// class SelectOrderRequestModel {
//   final SelectOrder? order;

//   SelectOrderRequestModel({
//     this.order,
//   });

//   factory SelectOrderRequestModel.fromJson(Map<String, dynamic> json) =>
//       SelectOrderRequestModel(
//         order:
//             json["order"] == null ? null : SelectOrder.fromJson(json["order"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "order": order?.toJson(),
//       };
// }

// class SelectOrder {
//   final List<SelectItem>? items;
//   final SelectProvider? provider;
//   final List<SelectFulfillment>? fulfillments;

//   SelectOrder({
//     this.items,
//     this.provider,
//     this.fulfillments,
//   });

//   factory SelectOrder.fromJson(Map<String, dynamic> json) => SelectOrder(
//         items: json["items"] == null
//             ? []
//             : List<SelectItem>.from(
//                 json["items"]!.map((x) => SelectItem.fromJson(x))),
//         provider: json["provider"] == null
//             ? null
//             : SelectProvider.fromJson(json["provider"]),
//         fulfillments: json["fulfillments"] == null
//             ? []
//             : List<SelectFulfillment>.from(json["fulfillments"]!
//                 .map((x) => SelectFulfillment.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "items": items == null
//             ? []
//             : List<dynamic>.from(items!.map((x) => x.toJson())),
//         "provider": provider?.toJson(),
//         "fulfillments": fulfillments == null
//             ? []
//             : List<dynamic>.from(fulfillments!.map((x) => x.toJson())),
//       };
// }

// class SelectFulfillment {
//   final End? end;

//   SelectFulfillment({
//     this.end,
//   });

//   factory SelectFulfillment.fromJson(Map<String, dynamic> json) =>
//       SelectFulfillment(
//         end: json["end"] == null ? null : End.fromJson(json["end"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "end": end?.toJson(),
//       };
// }

// class End {
//   final EndLocation? location;

//   End({
//     this.location,
//   });

//   factory End.fromJson(Map<String, dynamic> json) => End(
//         location: json["location"] == null
//             ? null
//             : EndLocation.fromJson(json["location"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "location": location?.toJson(),
//       };
// }

// class EndLocation {
//   final String? gps;
//   final Address? address;

//   EndLocation({
//     this.gps,
//     this.address,
//   });

//   factory EndLocation.fromJson(Map<String, dynamic> json) => EndLocation(
//         gps: json["gps"],
//         address:
//             json["address"] == null ? null : Address.fromJson(json["address"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "gps": gps,
//         "address": address?.toJson(),
//       };
// }

// class Address {
//   final String? areaCode;

//   Address({
//     this.areaCode,
//   });

//   factory Address.fromJson(Map<String, dynamic> json) => Address(
//         areaCode: json["area_code"],
//       );

//   Map<String, dynamic> toJson() => {
//         "area_code": areaCode,
//       };
// }

// class SelectItem {
//   final String? id;
//   final SelectQuantity? quantity;

//   SelectItem({
//     this.id,
//     this.quantity,
//   });

//   SelectItem copyWith(SelectQuantity? value) {
//     return SelectItem(id: id, quantity: value ?? quantity);
//   }

//   factory SelectItem.fromJson(Map<String, dynamic> json) => SelectItem(
//         id: json["id"],
//         quantity: json["quantity"] == null
//             ? null
//             : SelectQuantity.fromJson(json["quantity"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "quantity": quantity?.toJson(),
//       };
// }

// class SelectQuantity {
//   final String? count;

//   SelectQuantity({
//     this.count,
//   });

//   factory SelectQuantity.fromJson(Map<String, dynamic> json) => SelectQuantity(
//         count: json["count"],
//       );

//   Map<String, dynamic> toJson() => {
//         "count": count,
//       };
// }

// class SelectProvider {
//   final String? id;
//   final List<LocationElement>? locations;

//   SelectProvider({
//     this.id,
//     this.locations,
//   });

//   factory SelectProvider.fromJson(Map<String, dynamic> json) => SelectProvider(
//         id: json["id"],
//         locations: json["locations"] == null
//             ? []
//             : List<LocationElement>.from(
//                 json["locations"]!.map((x) => LocationElement.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "locations": locations == null
//             ? []
//             : List<dynamic>.from(locations!.map((x) => x.toJson())),
//       };
// }

// class LocationElement {
//   final String? id;

//   LocationElement({
//     this.id,
//   });

//   factory LocationElement.fromJson(Map<String, dynamic> json) =>
//       LocationElement(
//         id: json["id"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//       };
// }
