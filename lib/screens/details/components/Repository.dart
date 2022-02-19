// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/services.dart';

class Repository {
  Future<List> fetchDeliveryCompanies() async {
    final String response =
        await rootBundle.loadString('assets/json/deliveryCompanies.json');
    final data = await json.decode(response);
    return data;
  }

  Future<List> fetchEvents() async {
    final String response =
        await rootBundle.loadString('assets/json/events.json');
    final data = await json.decode(response);
    return data;
  }
}
