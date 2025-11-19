
import 'dart:convert';

List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));

String productEntryToJson(List<ProductEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
    String id;
    String name;
    int price;
    int stock;
    String category;
    String description;
    String thumbnail;
    bool isFeatured;
    DateTime createdAt;
    DateTime updatedAt;

    ProductEntry({
        required this.id,
        required this.name,
        required this.price,
        required this.stock,
        required this.category,
        required this.description,
        required this.thumbnail,
        required this.isFeatured,
        required this.createdAt,
        required this.updatedAt,
    });

    factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        stock: json["stock"],
        category: json["category"],
        description: json["description"],
        thumbnail: json["thumbnail"],
        isFeatured: json["is_featured"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "stock": stock,
        "category": category,
        "description": description,
        "thumbnail": thumbnail,
        "is_featured": isFeatured,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

// enum Category {
//     INDOOR_ITEMS,
//     OUTDOOR_ITEMS
// }

// final categoryValues = EnumValues({
//     "Indoor Items": Category.INDOOR_ITEMS,
//     "Outdoor Items": Category.OUTDOOR_ITEMS
// });

// class EnumValues<T> {
//     Map<String, T> map;
//     late Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//             reverseMap = map.map((k, v) => MapEntry(v, k));
//             return reverseMap;
//     }
// }
