import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static Future<List<String>> getProtoPathes() async {
    var prefs = await SharedPreferences.getInstance();
    var protos = prefs.getStringList('protos') ?? [];
    return protos;
  }

  static void removeProto(String path) async {
    var prefs = await SharedPreferences.getInstance();
    var protos = prefs.getStringList('protos') ?? [];
    protos.remove(path);
    prefs.setStringList('protos', protos);
  }

  static Future<String> addProto(String path) async {
    var prefs = await SharedPreferences.getInstance();
    var protos = prefs.getStringList('protos') ?? [];
    if (protos.contains(path)) {
      return 'exists';
    }
    protos.add(path);
    prefs.setStringList('protos', protos);
    return '';
  }

  static Future<List<String>> getAdresses() async {
    var prefs = await SharedPreferences.getInstance();
    var protos = prefs.getStringList('adresses') ?? [];
    return protos;
  }

  static void removeAdress(String adress) async {
    var prefs = await SharedPreferences.getInstance();
    var protos = prefs.getStringList('adresses') ?? [];
    protos.remove(adress);
    prefs.setStringList('adresses', protos);
  }

  static Future<String> addAdress(String adress) async {
    if (adress == '') {
      return 'nothing';
    }
    var prefs = await SharedPreferences.getInstance();
    var adresses = prefs.getStringList('adresses') ?? [];
    if (adresses.contains(adress)) {
      return 'exists';
    }
    adresses.add(adress);
    prefs.setStringList('adresses', adresses);
    return '';
  }
}
