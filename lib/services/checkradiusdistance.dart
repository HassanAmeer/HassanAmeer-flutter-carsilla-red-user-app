import 'dart:math';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

//// for check radius without google map api
// geolocator: ^10.1.0
// permission_handler: ^11.0.1

class HelpersC {
  double calculateDistance(
      double startLat, double startLon, double endLat, double endLon) {
    const double earthRadius = 6371; // Earth's radius in kilometers

    // Convert latitude and longitude from degrees to radians
    double startLatRad = radians(startLat);
    double startLonRad = radians(startLon);
    double endLatRad = radians(endLat);
    double endLonRad = radians(endLon);

    // Haversine formula
    double dLat = endLatRad - startLatRad;
    double dLon = endLonRad - startLonRad;
    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(startLatRad) * cos(endLatRad) * sin(dLon / 2) * sin(dLon / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    // Calculate the distance
    double distance = earthRadius * c;

    return distance; // Distance in kilometers
    // For Miles:  devide Kilometers / to 1.609 ;
  }

  double radians(double degrees) {
    return degrees * (pi / 180);
  }

  ////////////////////// 2
  ////// check permission fucntion start
  Future<void> checkLocationPermission(context) async {
    final status = await Permission.location.request();
    if (status.isGranted) {
    } else if (status.isDenied) {
      await Permission.location.request();
    } else if (status.isPermanentlyDenied) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please Enable Location'),
          duration: const Duration(seconds: 5),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {},
          ),
        ),
      );
      await openAppSettings();
    }
  }
  /////// check permission function end
}

///// helpers functions

int random(int min, int max) {
  final random = Random();
  return min + random.nextInt(max - min);
}

// first letter is capital
String capitalizeFirstLetter(String text) {
  if (text.isEmpty) return text;
  return text[0].toUpperCase() + text.substring(1);
}

//// make a title : for every first letter capital like for title
String toTitleCase(String text) {
  if (text.isEmpty) return text;
  final words = text.split(' ');
  final capitalizedWords = words.map((word) => capitalizeFirstLetter(word));
  return capitalizedWords.join(' ');
}

//////
String formatDate(DateTime date) {
  return "${date.year}-${date.month}-${date.day}";
}

String formatDateMfirst(DateTime date) {
  return "${date.month}-${date.day}-${date.year}";
}

//////
Color getRandomColor() {
  final random = Random();
  return Color.fromRGBO(
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
    1.0,
  );
}

int randominrange(int min, int max) {
  final random = Random();
  return min + random.nextInt(max - min);
}

int ageFromBirthDay(DateTime birthdate) {
  final currentDate = DateTime.now();
  var age = currentDate.year - birthdate.year;
  if (currentDate.month < birthdate.month ||
      (currentDate.month == birthdate.month &&
          currentDate.day < birthdate.day)) {
    age--;
  }
  return age;
}

/////
String generateRandomString(int length) {
  const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
  final random = Random();
  String result = '';
  for (var i = 0; i < length; i++) {
    result += chars[random.nextInt(chars.length)];
  }
  return result;
}

////
Color hexToColor(String hexColor) {
  return Color(int.parse(hexColor.substring(1, 7), radix: 16) + 0xFF000000);
}

////  (e.g., 1,000):
String formatNumberWithCommas(int number) {
  return number.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match match) => '${match[1]},');
}

bool isURLValid(String url) {
  final uri = Uri.tryParse(url);
  return uri != null && uri.hasScheme && uri.hasAuthority;
}

String secondsToTimeFormat(int seconds) {
  final hours = (seconds ~/ 3600).toString().padLeft(2, '0');
  final minutes = ((seconds % 3600) ~/ 60).toString().padLeft(2, '0');
  final secs = (seconds % 60).toString().padLeft(2, '0');
  return '$hours:$minutes:$secs';
}

bool generateRandomBool() {
  final random = Random();
  return random.nextBool();
}

Color rgbToColor(int r, int g, int b) {
  return Color.fromARGB(255, r, g, b);
}

List<T> shuffleList<T>(List<T> list) {
  final random = Random();
  List<T> shuffledList = List.from(list);
  for (int i = shuffledList.length - 1; i > 0; i--) {
    int j = random.nextInt(i + 1);
    final temp = shuffledList[i];
    shuffledList[i] = shuffledList[j];
    shuffledList[j] = temp;
  }
  return shuffledList;
}
