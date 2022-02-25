List<MenuObj> mainMenu = [];

class MenuObj {
  String text;
  String navigatorCode;
  List<Object>? parameters;

  MenuObj({required this.text, required this.navigatorCode, this.parameters});
  MenuObj.fromForm(this.text, this.navigatorCode, this.parameters);
}
