

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.status,
    this.message,
    this.data,
  });

  bool ?status;
  String? message;
  Data? data;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.storeId,
    this.storeName,
    this.storeTypeId,
    this.activation,
    this.token,
  });

  int? storeId;
  String? storeName;
  int? storeTypeId;
  bool ?activation;
  String? token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    storeId: json["store_id"],
    storeName: json["store_name"],
    storeTypeId: json["store_type_id"],
    activation: json["activation"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "store_id": storeId,
    "store_name": storeName,
    "store_type_id": storeTypeId,
    "activation": activation,
    "token": token,
  };
}
