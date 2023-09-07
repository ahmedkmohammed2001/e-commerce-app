// To parse this JSON data, do
//
//     final productshow = productshowFromJson(jsonString);

import 'dart:convert';

Productshow productshowFromJson(String str) => Productshow.fromJson(json.decode(str));

String productshowToJson(Productshow data) => json.encode(data.toJson());

class Productshow {
    Productshow({
    required    this.result,
    });

    List<Result> result;

    factory Productshow.fromJson(Map<String, dynamic> json) => Productshow(
        result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
    };
}

class Result {
    Result({
     required   this.id,
    required    this.name,
     required   this.price,
      required  this.mount,
       required this.user,
       required this.category,
     required   this.image,
   required     this.expire,
    required    this.views,
      required  this.likesCount,
       required this.isLike,
    });

    int id;
    String name;
    int price;
    int mount;
    User user;
    Category category;
    String image;
    DateTime expire;
    int views;
    int likesCount;
    bool isLike;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        mount: json["mount"],
        user: User.fromJson(json["user"]),
        category: Category.fromJson(json["category"]),
        image: json["image"],
        expire: DateTime.parse(json["expire"]),
        views: json["views"],
        likesCount: json["likes_count"],
        isLike: json["isLike"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "mount": mount,
        "user": user.toJson(),
        "category": category.toJson(),
        "image": image,
        "expire": "${expire.year.toString().padLeft(4, '0')}-${expire.month.toString().padLeft(2, '0')}-${expire.day.toString().padLeft(2, '0')}",
        "views": views,
        "likes_count": likesCount,
        "isLike": isLike,
    };
}

class Category {
    Category({
      required  this.id,
       required this.name,
       required this.icon,
    });

    int id;
    String name;
    String icon;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        icon: json["icon"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon": icon,
    };
}

class User {
    User({
       required this.id,
     required   this.firstName,
     required   this.lastName,
       required this.phone,
       required this.image,
    });

    int id;
    String firstName;
    String lastName;
    String phone;
    String image;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "image": image,
    };
}
