import 'dart:convert';

import 'package:http/http.dart';

class HomeModel {
  final String name;
  final String symbol;
  final double price;
  final double change;
  final String datetime;
  final bool? isMarketOpen;

  HomeModel({
    required this.name,
    required this.symbol,
    required this.price,
    required this.change,
    required this.datetime,
    this.isMarketOpen,
  });

  factory HomeModel.fromMap(Map<String, dynamic> map) {
    return HomeModel(
      name: map['name'],
      symbol: map['symbol'],
      price: map['price'],
      change: map['change'],
      datetime: map['datetime'],
    );
  }

  factory HomeModel.fromJson(Response source) =>
      HomeModel.fromMap(json.decode(source.toString()));
}
