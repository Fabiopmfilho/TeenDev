import 'package:http/http.dart' as http;

const baseUrl = 'https://console.firebase.google.com/project/kidsdev-954b0/firestore/data/~2F';

class API {
  static Future getFuncao() async {
    String url = baseUrl + "/funcao";
    return await http.get(Uri.parse(url));
  }
  static Future getIF() async {
    String url = baseUrl + "/if_else";
    return await http.get(Uri.parse(url));
  }
  static Future getLaco() async {
    String url = baseUrl + "/laco";
    return await http.get(Uri.parse(url));
  }
  static Future getList() async {
    String url = baseUrl + "/list";
    return await http.get(Uri.parse(url));
  }
  static Future getOperadores() async {
    String url = baseUrl + "/operadores";
    return await http.get(Uri.parse(url));
  }
  static Future getVariaveis() async {
    String url = baseUrl + "/variaveis";
    return await http.get(Uri.parse(url));
  }
}