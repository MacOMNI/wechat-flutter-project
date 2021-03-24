class CommonItemModel {
  String image;
  String title;
  String type;
  String haveLine;
  String name;
  String sep;
  CommonItemModel({
    this.image,
    this.title,
    this.haveLine,
    this.sep,
    this.type,
    this.name,
  });
  CommonItemModel.fromJson(Map<String, dynamic> json) {
    image = json["avatar"];
    title = json["title"];
    haveLine = json["havline"];
    sep = json["sep"];
    type = json["type"];
    name = json["name"];
  }
}
