// To parse this JSON data, do
//
//     final productList = productListFromJson(jsonString);

import 'dart:convert';

ProductList productListFromJson(String str) =>
    ProductList.fromJson(json.decode(str));

String productListToJson(ProductList data) => json.encode(data.toJson());

class ProductList {
  ProductList({
    this.status,
    this.msg,
    this.productList,
  });

  final String? status;
  final String? msg;
  final List<ProductListElement>? productList;

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
        status: json["status"] == null ? null : json["status"],
        msg: json["msg"] == null ? null : json["msg"],
        productList: json["product_list"] == null
            ? null
            : List<ProductListElement>.from(json["product_list"]
                .map((x) => ProductListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "msg": msg == null ? null : msg,
        "product_list": productList == null
            ? null
            : List<dynamic>.from(productList!.map((x) => x.toJson())),
      };
}

class ProductListElement {
  ProductListElement({
    this.productId,
    this.subCatId,
    this.subCatName,
    this.subCatImage,
    this.catId,
    this.catName,
    this.catImage,
    this.productName,
    this.description,
    this.mrpPrice,
    this.price,
    this.packingCharge,
    this.shippingCharge,
    this.availableQuantity,
    this.productStatus,
    this.productImage1,
    this.productImage2,
    this.productImage3,
    this.productImage4,
    this.productImage5,
  });

  final String? productId;
  final String? subCatId;
  final String? subCatName;
  final String? subCatImage;
  final String? catId;
  final String? catName;
  final String? catImage;
  final String? productName;
  final String? description;
  final String? mrpPrice;
  final String? price;
  final String? packingCharge;
  final String? shippingCharge;
  final String? availableQuantity;
  final String? productStatus;
  final String? productImage1;
  final String? productImage2;
  final String? productImage3;
  final String? productImage4;
  final String? productImage5;

  factory ProductListElement.fromJson(Map<String, dynamic> json) =>
      ProductListElement(
        productId: json["product_id"] == null ? null : json["product_id"],
        subCatId: json["sub_cat_id"] == null ? null : json["sub_cat_id"],
        subCatName: json["sub_cat_name"] == null ? null : json["sub_cat_name"],
        subCatImage:
            json["sub_cat_image"] == null ? null : json["sub_cat_image"],
        catId: json["cat_id"] == null ? null : json["cat_id"],
        catName: json["cat_name"] == null ? null : json["cat_name"],
        catImage: json["cat_image"] == null ? null : json["cat_image"],
        productName: json["product_name"] == null ? null : json["product_name"],
        description: json["description"] == null ? null : json["description"],
        mrpPrice: json["mrp_price"] == null ? null : json["mrp_price"],
        price: json["price"] == null ? null : json["price"],
        packingCharge:
            json["packing_charge"] == null ? null : json["packing_charge"],
        shippingCharge:
            json["shipping_charge"] == null ? null : json["shipping_charge"],
        availableQuantity: json["available_quantity"] == null
            ? null
            : json["available_quantity"],
        productStatus:
            json["product_status"] == null ? null : json["product_status"],
        productImage1:
            json["product_image1"] == null ? null : json["product_image1"],
        productImage2:
            json["product_image2"] == null ? null : json["product_image2"],
        productImage3:
            json["product_image3"] == null ? null : json["product_image3"],
        productImage4:
            json["product_image4"] == null ? null : json["product_image4"],
        productImage5:
            json["product_image5"] == null ? null : json["product_image5"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId == null ? null : productId,
        "sub_cat_id": subCatId == null ? null : subCatId,
        "sub_cat_name": subCatName == null ? null : subCatName,
        "sub_cat_image": subCatImage == null ? null : subCatImage,
        "cat_id": catId == null ? null : catId,
        "cat_name": catName == null ? null : catName,
        "cat_image": catImage == null ? null : catImage,
        "product_name": productName == null ? null : productName,
        "description": description == null ? null : description,
        "mrp_price": mrpPrice == null ? null : mrpPrice,
        "price": price == null ? null : price,
        "packing_charge": packingCharge == null ? null : packingCharge,
        "shipping_charge": shippingCharge == null ? null : shippingCharge,
        "available_quantity":
            availableQuantity == null ? null : availableQuantity,
        "product_status": productStatus == null ? null : productStatus,
        "product_image1": productImage1 == null ? null : productImage1,
        "product_image2": productImage2 == null ? null : productImage2,
        "product_image3": productImage3 == null ? null : productImage3,
        "product_image4": productImage4 == null ? null : productImage4,
        "product_image5": productImage5 == null ? null : productImage5,
      };
}
