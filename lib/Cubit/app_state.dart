abstract class AppState {}

class AppInitial extends AppState {}
class ClickSendButtonState extends AppState {}
class SendButtonfunctionendedState extends AppState {}
class getResponsesuccessState extends AppState {}
class getResponsefailState extends AppState {
  String error;

  getResponsefailState(this.error);
}
class AddyourmessageState extends AppState {}
class ScrollmessageState extends AppState {}

