class WishModel {
  int? id;
  String? primaryImage;
  String? name;
  double? defaultPrice;

  WishModel({this.id, this.primaryImage, this.name, this.defaultPrice});

  WishModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    primaryImage = json['primary_image'];
    name = json['name'];
    defaultPrice = json['default_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['primary_image'] = primaryImage;
    data['name'] = name;
    data['default_price'] = defaultPrice;
    return data;
  }
}
