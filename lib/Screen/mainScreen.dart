import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kirabot/Cubit/app_cubit.dart';
import 'package:kirabot/Cubit/app_state.dart';
import '../Widgets/Chatwidget.dart';
import '../constant.dart';
import '../network/remote/http_helper.dart';
import '../res/assets_res.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var msgcontroller = TextEditingController();
  late ScrollController listscroll = ScrollController();
  late FocusNode focusnode = FocusNode();
  @override
  void dispose() {
    msgcontroller.dispose();
    focusnode.dispose();
    listscroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, AppState) {
        var cubit = AppCubit.object(context);
        return Scaffold(


          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/Vectorlogo.png'),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "KIRABOT",
                  style: TextStyle(
                      color: Color.fromRGBO(166, 196, 177, 1),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          body: SafeArea(
            child: Column(
              children: [
                Flexible(
                    child: Stack(
                  children: [
                    ListView.builder(
                      controller: listscroll,
                      itemBuilder: (context, index) => Chatwidget(
                          cubit.chatlist![index].msg,
                          cubit.chatlist![index].chatIndex),
                      itemCount: cubit.chatlist?.length,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          cubit.Scrolltoend(listscroll: listscroll);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            alignment: Alignment.center,
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(48, 52, 55, 1),
                            ),
                            child: Icon(
                              Icons.arrow_downward_sharp,
                              size: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )),
                if (AppState is ClickSendButtonState) ...[
                  SpinKitThreeBounce(
                    color: Color.fromRGBO(166, 196, 177, 1),
                    size: 25,
                  ),
                ],
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          focusNode: focusnode,
                          controller: msgcontroller,
                          maxLines: null,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                  color: Color.fromRGBO(48, 52, 55, 1),
                                  width: 2.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                  color: Color.fromRGBO(48, 52, 55, 1),
                                  width: 2.0),
                            ),
                            hintText: 'What\'s on your mind ?',
                            contentPadding: const EdgeInsets.all(15),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: AppState is ClickSendButtonState
                            ? () {}
                            : () {
                                if (msgcontroller.text == '') {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: const Center(
                                        child: Text(
                                      "Type Some Thing to Send",
                                      style: TextStyle(color: Colors.black),
                                    )),
                                    padding: EdgeInsets.all(10),
                                    backgroundColor: fromRobotMSG,

                                  ));
                                } else {
                                  cubit.sendmessage(
                                      msg: msgcontroller.text,
                                      Listscroll: listscroll);
                                  msgcontroller.clear();
                                  focusnode.unfocus();
                                  cubit.Scrolltoend(listscroll: listscroll);
                                }
                              },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            alignment: Alignment.center,
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(48, 52, 55, 1),
                            ),
                            child: AppState is ClickSendButtonState
                                ? Container()
                                : Icon(
                                    Icons.send,
                                    size: 25,
                                    color: Colors.white,
                                  ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
