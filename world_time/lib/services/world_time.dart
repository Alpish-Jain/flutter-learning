import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location name for the UI
  String time; //the time in that location
  String flag; //url to asset flag icon
  String url; //location url for api endpoint
  bool isDaytime;
  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];

      //create Datetime object
      DateTime now = DateTime.parse(datetime);
      String offset = data['utc_offset'];
      //extracting hours and minutes from offset
      String hours = offset.substring(1, 3);
      String minutes = offset.substring(4, 6);
      //finding the current time
      now = now
          .add(Duration(hours: int.parse(hours), minutes: int.parse(minutes)));
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('caught exception $e');
      time = 'not able to get time!';
    }
  }
}
