class CommonItemModel {
  String image;
  String text;
  String haveLine;
  String sep;
  CommonItemModel({
    this.image,
    this.text,
    this.haveLine,
    this.sep,
  });
  CommonItemModel.fromJson(Map<String, dynamic> json) {
    image = json["image"];
    text = json["text"];
    haveLine = json["havline"];
    sep = json["sep"];
  }
}
