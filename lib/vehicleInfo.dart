// To parse this JSON data, do
//
//     final vehicleModel = vehicleModelFromJson(jsonString);

import 'dart:convert';

VehicleModel vehicleModelFromJson(String str) => VehicleModel.fromJson(json.decode(str));

String vehicleModelToJson(VehicleModel data) => json.encode(data.toJson());

class VehicleModel {
  VehicleModel({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  Data data;

  factory VehicleModel.fromJson(Map<String, dynamic> json) => VehicleModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.vehicleNumber,
    this.registrationDate,
    this.chassis,
    this.engine,
    this.owner,
    this.vehicleClass,
    this.fuelType,
    this.model,
    this.fitnessDt,
    this.insuranceDate,
    this.pollution,
    this.rcStatus,
    this.vehicleFound,
    this.wahanDatabase,
    this.wheelCount,
    this.brandModelMapping,
    this.alreadyAdded,
    this.userVehicleStatus,
    this.brand,
    this.insuranceSetReminder,
    this.pucSetReminder,
    this.originalInsuranceDate,
    this.vehicleContent,
    this.vehicleNotFoundMsg,
    this.shareContent,
    this.showAckoBanner,
    this.showFeedback,
    this.variantImage,
    this.carSpecifications,
    this.rtoInformation,
    this.documentsExpiry,
    this.ackoData,
    this.carwashBodyType,
  });

  int id;
  String vehicleNumber;
  String registrationDate;
  String chassis;
  String engine;
  String owner;
  String vehicleClass;
  String fuelType;
  String model;
  dynamic fitnessDt;
  String insuranceDate;
  dynamic pollution;
  String rcStatus;
  bool vehicleFound;
  bool wahanDatabase;
  int wheelCount;
  BrandModelMapping brandModelMapping;
  bool alreadyAdded;
  dynamic userVehicleStatus;
  dynamic brand;
  bool insuranceSetReminder;
  bool pucSetReminder;
  String originalInsuranceDate;
  VehicleContent vehicleContent;
  dynamic vehicleNotFoundMsg;
  ShareContent shareContent;
  bool showAckoBanner;
  bool showFeedback;
  dynamic variantImage;
  dynamic carSpecifications;
  DocumentsExpiry rtoInformation;
  DocumentsExpiry documentsExpiry;
  AckoData ackoData;
  dynamic carwashBodyType;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    vehicleNumber: json["vehicle_number"],
    registrationDate: json["registration_date"],
    chassis: json["chassis"],
    engine: json["engine"],
    owner: json["owner"],
    vehicleClass: json["vehicle_class"],
    fuelType: json["fuel_type"],
    model: json["model"],
    fitnessDt: json["fitness_dt"],
    insuranceDate: json["insurance_date"],
    pollution: json["pollution"],
    rcStatus: json["rc_status"],
    vehicleFound: json["vehicle_found"],
    wahanDatabase: json["wahan_database"],
    wheelCount: json["wheel_count"],
    brandModelMapping: BrandModelMapping.fromJson(json["brand_model_mapping"]),
    alreadyAdded: json["already_added"],
    userVehicleStatus: json["user_vehicle_status"],
    brand: json["brand"],
    insuranceSetReminder: json["insurance_set_reminder"],
    pucSetReminder: json["puc_set_reminder"],
    originalInsuranceDate: json["original_insurance_date"],
    vehicleContent: VehicleContent.fromJson(json["vehicle_content"]),
    vehicleNotFoundMsg: json["vehicle_not_found_msg"],
    shareContent: ShareContent.fromJson(json["share_content"]),
    showAckoBanner: json["show_acko_banner"],
    showFeedback: json["show_feedback"],
    variantImage: json["variant_image"],
    carSpecifications: json["car_specifications"],
    rtoInformation: DocumentsExpiry.fromJson(json["rto_information"]),
    documentsExpiry: DocumentsExpiry.fromJson(json["documents_expiry"]),
    ackoData: AckoData.fromJson(json["acko_data"]),
    carwashBodyType: json["carwash_body_type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "vehicle_number": vehicleNumber,
    "registration_date": registrationDate,
    "chassis": chassis,
    "engine": engine,
    "owner": owner,
    "vehicle_class": vehicleClass,
    "fuel_type": fuelType,
    "model": model,
    "fitness_dt": fitnessDt,
    "insurance_date": insuranceDate,
    "pollution": pollution,
    "rc_status": rcStatus,
    "vehicle_found": vehicleFound,
    "wahan_database": wahanDatabase,
    "wheel_count": wheelCount,
    "brand_model_mapping": brandModelMapping.toJson(),
    "already_added": alreadyAdded,
    "user_vehicle_status": userVehicleStatus,
    "brand": brand,
    "insurance_set_reminder": insuranceSetReminder,
    "puc_set_reminder": pucSetReminder,
    "original_insurance_date": originalInsuranceDate,
    "vehicle_content": vehicleContent.toJson(),
    "vehicle_not_found_msg": vehicleNotFoundMsg,
    "share_content": shareContent.toJson(),
    "show_acko_banner": showAckoBanner,
    "show_feedback": showFeedback,
    "variant_image": variantImage,
    "car_specifications": carSpecifications,
    "rto_information": rtoInformation.toJson(),
    "documents_expiry": documentsExpiry.toJson(),
    "acko_data": ackoData.toJson(),
    "carwash_body_type": carwashBodyType,
  };
}

class AckoData {
  AckoData({
    this.ackoBannerImage,
    this.ackoBannerContent,
    this.ackoRedirectUrl,
    this.ackoCtaImage,
  });

  String ackoBannerImage;
  String ackoBannerContent;
  String ackoRedirectUrl;
  String ackoCtaImage;

  factory AckoData.fromJson(Map<String, dynamic> json) => AckoData(
    ackoBannerImage: json["acko_banner_image"],
    ackoBannerContent: json["acko_banner_content"],
    ackoRedirectUrl: json["acko_redirect_url"],
    ackoCtaImage: json["acko_cta_image"],
  );

  Map<String, dynamic> toJson() => {
    "acko_banner_image": ackoBannerImage,
    "acko_banner_content": ackoBannerContent,
    "acko_redirect_url": ackoRedirectUrl,
    "acko_cta_image": ackoCtaImage,
  };
}

class BrandModelMapping {
  BrandModelMapping({
    this.brandName,
    this.brandIcon,
    this.modelName,
  });

  String brandName;
  String brandIcon;
  String modelName;

  factory BrandModelMapping.fromJson(Map<String, dynamic> json) => BrandModelMapping(
    brandName: json["brand_name"],
    brandIcon: json["brand_icon"],
    modelName: json["model_name"],
  );

  Map<String, dynamic> toJson() => {
    "brand_name": brandName,
    "brand_icon": brandIcon,
    "model_name": modelName,
  };
}

class DocumentsExpiry {
  DocumentsExpiry({
    this.title,
    this.items,
  });

  String title;
  List<Item> items;

  factory DocumentsExpiry.fromJson(Map<String, dynamic> json) => DocumentsExpiry(
    title: json["title"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Item {
  Item({
    this.id,
    this.title,
    this.value,
    this.unit,
    this.titleColor,
    this.valueColor,
    this.unitColor,
    this.background,
    this.iconUrl,
    this.statusText,
  });

  int id;
  String title;
  String value;
  String unit;
  String titleColor;
  String valueColor;
  String unitColor;
  String background;
  String iconUrl;
  String statusText;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"] == null ? null : json["id"],
    title: json["title"],
    value: json["value"] == null ? null : json["value"],
    unit: json["unit"],
    titleColor: json["title_color"],
    valueColor: json["value_color"],
    unitColor: json["unit_color"],
    background: json["background"],
    iconUrl: json["icon_url"],
    statusText: json["status_text"] == null ? null : json["status_text"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "title": title,
    "value": value == null ? null : value,
    "unit": unit,
    "title_color": titleColor,
    "value_color": valueColor,
    "unit_color": unitColor,
    "background": background,
    "icon_url": iconUrl,
    "status_text": statusText == null ? null : statusText,
  };
}

class ShareContent {
  ShareContent({
    this.content,
    this.shareImage,
    this.shareUrl,
  });

  String content;
  String shareImage;
  String shareUrl;

  factory ShareContent.fromJson(Map<String, dynamic> json) => ShareContent(
    content: json["content"],
    shareImage: json["share_image"],
    shareUrl: json["share_url"],
  );

  Map<String, dynamic> toJson() => {
    "content": content,
    "share_image": shareImage,
    "share_url": shareUrl,
  };
}

class VehicleContent {
  VehicleContent({
    this.heading,
    this.contentList,
  });

  String heading;
  List<ContentList> contentList;

  factory VehicleContent.fromJson(Map<String, dynamic> json) => VehicleContent(
    heading: json["heading"],
    contentList: List<ContentList>.from(json["content_list"].map((x) => ContentList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "heading": heading,
    "content_list": List<dynamic>.from(contentList.map((x) => x.toJson())),
  };
}

class ContentList {
  ContentList({
    this.icon,
    this.content,
  });

  String icon;
  String content;

  factory ContentList.fromJson(Map<String, dynamic> json) => ContentList(
    icon: json["icon"],
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "icon": icon,
    "content": content,
  };
}
