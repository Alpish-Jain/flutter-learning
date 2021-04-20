class ChatModel {
  final String name;
  final String time;
  final String message;
  final String avatarUrl;

  ChatModel({this.name, this.message, this.time, this.avatarUrl});
}

List<ChatModel> dummyData = [
  ChatModel(
      name: "Anonymous1",
      message: "Flutter is Amazing",
      time: "15:30",
      avatarUrl:
          "https://yt3.ggpht.com/ytc/AAUvwnh7CHDDIuu6a87VwcIoDe-UeDb-Cfu8Ig8utAcGBDw=s900-c-k-c0x00ffffff-no-rj"),
  ChatModel(
      name: "Anonymous2",
      message: "Hey there!",
      time: "17:30",
      avatarUrl:
          "https://c.ndtvimg.com/2020-08/jo1icln8_amit-shah_650x400_02_August_20.jpg"),
  ChatModel(
      name: "Anonymous3",
      message: "This is sample data",
      time: "20:30",
      avatarUrl:
          "https://in.bmscdn.com/iedb/artist/images/website/poster/large/irrfan-khan-861-13-09-2017-03-40-54.jpg"),
  ChatModel(
      name: "Anonymous4",
      message: "Flutter is cool",
      time: "21:30",
      avatarUrl:
          "https://cdn.psychologytoday.com/sites/default/files/styles/article-inline-half-caption/public/field_blog_entry_images/2018-09/shutterstock_648907024.jpg?itok=0hb44OrI"),
  ChatModel(
      name: "Anonymous5",
      message: "Learning flutter is fun!",
      time: "22:30",
      avatarUrl:
          "https://upload.wikimedia.org/wikipedia/commons/a/a0/Pierre-Person.jpg"),
  ChatModel(
      name: "Anonymous6",
      message: "Now is the time to learn",
      time: "23:30",
      avatarUrl:
          "https://in.bmscdn.com/iedb/artist/images/website/poster/large/irrfan-khan-861-13-09-2017-03-40-54.jpg"),
];
