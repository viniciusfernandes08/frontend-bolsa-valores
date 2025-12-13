import 'dart:convert';

class HomeModel {
  final String name;
  final String symbol;
  final String price;
  final String change;
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

  factory HomeModel.fromJson(String source) =>
      HomeModel.fromMap(json.decode(source));
}
