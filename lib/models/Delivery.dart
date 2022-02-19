// ignore_for_file: file_names

class Delivery {
  DeliveryCompanyId? id;
  String? name;

  Delivery(this.id, this.name);

  Delivery.fromJson(Map<String, dynamic> json) {
    id = DeliveryCompanyId.fromJson(json['DeliveryCompanyId']);
    name = json['Name'];
  }
}

class DeliveryCompanyId {
  int? id;
  DeliveryCompanyId(this.id);

  DeliveryCompanyId.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
  }
}
