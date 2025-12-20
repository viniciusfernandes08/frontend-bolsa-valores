import 'dart:convert';

class HomeModel {
  final String name;
  final String symbol;
  final String openPrice;
  final String price;
  final String changePercent;
  final String minDay;
  final String maxDay;
  final String rangeLastYear;
  final bool? isMarketOpen;
  final String? pl;
  final String? lpa;
  final String? logoUrl;

  HomeModel({
    required this.name,
    required this.symbol,
    required this.openPrice,
    required this.price,
    required this.changePercent,
    required this.minDay,
    required this.maxDay,
    required this.rangeLastYear,
    this.isMarketOpen,
    this.pl,
    this.lpa,
    this.logoUrl,
  });

  factory HomeModel.fromMap(Map<String, dynamic> map) {
    return HomeModel(
      name: map['name'] ?? '',
      symbol: map['symbol'] ?? '',
      openPrice: map['openPrice'] ?? '0.0',
      price: map['price'] ?? '0.0',
      changePercent: map['changePercent'] ?? '0.0',
      minDay: map['minDay'] ?? '0.0',
      maxDay: map['maxDay'] ?? '0.0',
      rangeLastYear: map['rangeLastYear'] ?? '0.0 - 0.0',
      isMarketOpen: map['is_market_open'],
      pl: map['pl'],
      lpa: map['lpa'],
      logoUrl: map['logourl'],
    );
  }

  factory HomeModel.fromJson(String source) =>
      HomeModel.fromMap(json.decode(source));
}
