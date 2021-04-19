class FriendListModel {
  List<FriendModel> list;
  FriendListModel({this.list});
  FriendListModel.fromJson(List jsonList) {
    list = new List<FriendModel>();
    jsonList.forEach((element) {
      list.add(new FriendModel.fromJson(element));
    });
  }
}

class FriendModel {
  String userName;
  String avactor;
  String time;
  String desc;
  List<String> pics;
  List<CommentModel> comments;
  FriendModel.fromJson(Map<String, dynamic> json) {
    userName = json["userName"];
    avactor = json["avactor"];
    time = json["time"];
    desc = json["desc"];
    pics = json["pics"]?.cast<String>();
    comments = new List<CommentModel>();
    for (var item in json["comments"].toList()) {
      comments.add(new CommentModel.fromJson(item));
    }
  }
}

class CommentModel {
  String userName;
  String toUserName;
  String contentMessage;
  CommentModel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    toUserName = json['toUserName'];
    contentMessage = json['contentMessage'];
  }
}
