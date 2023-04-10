import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kirabot/network/remote/API_constant.dart';

import '../models/chatmodel.dart';
import '../network/remote/http_helper.dart';
import 'app_state.dart';
import 'dart:math';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  static AppCubit object(context) => BlocProvider.of(context);

  bool istyping = false;
  List? chatlist = [];



  void Scrolltoend({required ScrollController listscroll}){
    listscroll.animateTo(listscroll.position.maxScrollExtent,
        duration: Duration(milliseconds:600),
        curve: Curves.easeIn);
  }

  sendmessage({required String msg,required ScrollController Listscroll}) async{
    try{
      chatlist?.add(ChatModel(msg: msg, chatIndex: 0));
      emit(ClickSendButtonState());

      chatlist?.addAll(await HttpHelper.Sendchat(
        url: base_URL,
        key: api_KEY,
        msg: msg,
      ));
      emit(getResponsesuccessState());
      emit(SendButtonfunctionendedState());
      // .then((value) {
      //   chatlist?.addAll(value);
      //   emit(getResponsesuccessState());
      // });
    }catch(e){
      emit(getResponsefailState(e.toString()));
    }finally{
      Scrolltoend(listscroll: Listscroll);
      emit(ScrollmessageState());
    }
    Scrolltoend(listscroll: Listscroll);
  }
}
