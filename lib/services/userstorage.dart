import 'package:shared_preferences/shared_preferences.dart';

class StorageClass {
  static set(id, phone) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('id', id.toString());
    await prefs.setString('phone', phone.toString());
  }

  static getuseridf() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString('id');
    return userid;
  }

  static getuserphonef() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final userphone = prefs.getString('phone');
    return userphone;
  }

  static addCarListingFav(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> getcarlistingfavid =
        prefs.getStringList('carlistingfavid') ?? [];
    if (getcarlistingfavid.contains(id)) {
      getcarlistingfavid.remove(id);
    } else {
      getcarlistingfavid.add(id);
    }
    await prefs.setStringList('carlistingfavid', getcarlistingfavid);
    // getCarListingFav();
  }

  static getCarListingFav() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final carlistingfavid = prefs.getStringList('carlistingfavid');
    return carlistingfavid ?? [];
  }
}
