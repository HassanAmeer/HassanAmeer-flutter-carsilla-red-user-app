import 'dart:convert';

import 'package:flutter/material.dart';
import '../resources/urls.dart';
import '../services/NetworkApiService.dart';
import 'package:http/http.dart' as http;

import '../services/exception.dart';

class CarListingRepC {
  static getCarListingDataRepF(context) async {
    try {
      final checkrepsonse =
          await ApiClass().getApiData(ApiUrls.baseUrl + ApiUrls.getlisting);
      return checkrepsonse;
    } catch (e) {
      debugPrint(
          '$e-------- 🎈 try catch when getCarListingDataRepF api in repo ------------------------------');
    }
  }

  ////////
  static getDealersDataRepF(context) async {
    try {
      final checkrepsonse =
          await ApiClass().getApiData(ApiUrls.baseUrl + ApiUrls.getdealers);
      return checkrepsonse;
    } catch (e) {
      debugPrint(
          '$e-------- 🎈 try catch when getDealersDataRepF api in repo ------------------------------');
    }
  }

  ////////
  addCarListingDataRepF(context,
      {String? user_id,
      String? listing_type,
      String? listing_year,
      String? listing_model,
      String? listing_desc,
      String? listing_title,
      List? imagesList,
      String? listing_price,
      String? features_gear,
      String? features_speed,
      String? features_seats,
      String? features_fuel_type,
      String? features_door,
      String? features_climate_zone,
      String? features_cylinders,
      List? features_others,
      String? features_bluetooth}) async {
    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse(ApiUrls.baseUrl + ApiUrls.addlisting));
      // Set headers, including Content-Type and Authorization
      request.headers['Content-Type'] = 'application/json';

      if (imagesList!.isNotEmpty) {
        for (int i = 0; i < imagesList.length; i++) {
          var image = await http.MultipartFile.fromPath(
            'listing_img${i + 1}', // Using i + 1 to match the keys "listing_img1", "listing_img2", ...
            imagesList[i],
          );
          request.files.add(image);
        }
      }

      request.fields['user_id'] = user_id ?? '';
      request.fields['listing_type'] = listing_type ?? '';
      request.fields['listing_year'] = listing_year ?? '';
      request.fields['listing_model'] = listing_model ?? '';
      request.fields['listing_desc'] = listing_desc ?? '';
      request.fields['listing_title'] = listing_title ?? '';
      request.fields['listing_price'] = listing_price ?? '';
      request.fields['features_gear'] = features_gear ?? '';
      request.fields['features_speed'] = features_speed ?? '';
      request.fields['features_seats'] = features_seats ?? '';
      request.fields['features_fuel_type'] = features_fuel_type ?? '';
      request.fields['features_door'] = features_door ?? '';
      request.fields['features_climate_zone'] = features_climate_zone ?? '';
      request.fields['features_cylinders'] = features_cylinders ?? '';
      request.fields['features_bluetooth'] = features_bluetooth ?? '';

// Add features_others as a JSON string
      if (features_others != null && features_others.isNotEmpty) {
        request.fields['features_others'] = jsonEncode(features_others);
      } else {
        // If features_others is null or empty, you might want to set a default value or handle it accordingly
        request.fields['features_others'] =
            ''; // or any default value you prefer
      }

      // Send the request and get the response
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      return returnResponse(response);
    } catch (e) {
      debugPrint(
          '$e-------- try catch when addCarListingDataRepF api in repo ------------------------------');
    }

    // try {
    //   final checkrepsonse = await ApiClass()
    //       .postImageWithData(ApiUrls.baseUrl + ApiUrls.addlisting, data);
    //   return checkrepsonse;
    // } catch (e) {
    //   debugPrint(
    //       '$e-------- try catch when addCarListingDataRepF api in repo ------------------------------');
    // }
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 201:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
      case 502:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException(
            'Error accured while communicating with serverwith status code${response.statusCode}');
    }
  }
}
