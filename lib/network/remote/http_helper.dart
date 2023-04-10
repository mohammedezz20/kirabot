import 'dart:convert';
import 'dart:io';

import 'package:kirabot/models/chatmodel.dart';
import 'package:kirabot/network/remote/API_constant.dart';
import 'package:http/http.dart' as http;



class HttpHelper {

  static Future<List<ChatModel>> Sendchat(
      {required String url,
      required String key,
      required String msg,
      }) async {
    try {
      var response = await http.post(
        Uri.parse("$url/chat/completions"),
        headers: {
          'Authorization': 'Bearer $key',
          "Content-Type": "application/json"
        },
        body: jsonEncode(
          {
            "model": "gpt-3.5-turbo",
            "messages": [{"role": "user", "content": msg}],
            "temperature": 0.8
          },
        ),
      );
      Map jsonresponse = jsonDecode(utf8.decode(response.bodyBytes));



      if (jsonresponse['error'] != null) {
          throw HttpException(jsonresponse['error']['message']);
      }
      List<ChatModel> chatList=[];
         // print("jsonresponseerror: ${jsonresponse['choices'][0]['message']['content']}");
      chatList.add(ChatModel(msg: jsonresponse['choices'][0]['message']['content'],
          chatIndex: 1));
// print("===================================================");
//      print(chatList[0].msg);
return chatList;
    }catch (error) {
      print(error.toString());
      rethrow;
    }
  }
}
