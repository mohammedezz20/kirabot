class ChatModel{
  final String msg;
  final int chatIndex;

  ChatModel({required this.msg, required this.chatIndex});

  factory ChatModel.fromjson(Map<String,dynamic>json)=>ChatModel(
      msg: json['msg'],
      chatIndex: json['chatindex']);

}