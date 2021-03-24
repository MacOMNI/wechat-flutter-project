class CommonItemModel {
  String image;
  String title;
  String haveLine;
  String sep;
  CommonItemModel({
    this.image,
    this.title,
    this.haveLine,
    this.sep,
  });
  CommonItemModel.fromJson(Map<String, dynamic> json) {
    image = json["avatar"];
    title = json["title"];
    haveLine = json["havline"];
    sep = json["sep"];
  }
}
