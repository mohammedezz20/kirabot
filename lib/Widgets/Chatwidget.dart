
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kirabot/res/assets_res.dart';

import '../constant.dart';
import 'Text.dart';

class Chatwidget extends StatelessWidget {
  final String msg;
  final int index;

  Chatwidget(this.msg, this.index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            index == 1 ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Container(

           constraints: BoxConstraints(maxWidth:MediaQuery.of(context).size.width*.9, ),
            decoration: BoxDecoration(
              borderRadius: index == 1
                  ? BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                      topRight: Radius.circular(15))
                  : BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                      topLeft: Radius.circular(15)),
              color: index == 1 ? fromRobotMSG : fromuserMSG,
            ),
            // width: MediaQuery.of(context).size.width * .88,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: IntrinsicWidth(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (index == 1) ...[
                      Image.asset('assets/Vectorlogo.png'),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: TextWidget(
                            label: msg,
                            color: botText,
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(onTap: (){
                        Clipboard.setData(ClipboardData(text: msg));
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(
                          content: const Center(
                              child: Text(
                                "Copied to clipboard",
                                style: TextStyle(color: Colors.black),
                              )),
                          padding: EdgeInsets.all(10),
                          backgroundColor: fromRobotMSG,

                        ));
                      },
                      child: Icon(Icons.copy_outlined),)
                    ],
                    if (index == 0) ...[
                      Expanded(
                          child: TextWidget(
                        label: msg,
                        color: usertext,
                      )),
                      SizedBox(width: 30,)
                    ],
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
