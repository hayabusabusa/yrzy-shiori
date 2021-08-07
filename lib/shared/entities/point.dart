import 'package:cloud_firestore/cloud_firestore.dart';

/// Firestore に保存されている地点のデータ.
class Point {
  /// ドキュメントの ID.
  final String id;
  /// 地点名.
  final String name;
  /// 詳細情報.
  final String description;
  /// 寄り道かどうか.
  final bool isStopby;
  /// 画像 URL の配列.
  final List<String> imageURLs;
  /// 到着時刻.
  final DateTime arrivalDate;
  /// 出発時刻.
  final DateTime departureDate;

  Point({
    required this.id,
    required this.name,
    required this.description,
    required this.isStopby,
    required this.imageURLs,
    required this.arrivalDate,
    required this.departureDate,
  });

  Map<String, dynamic> get data => {
    'name': this.name,
    'description': this.description,
    'isStopby': this.isStopby,
    'imageURLs': this.imageURLs,
    'arrivalDate': this.arrivalDate,
    'departureDate': this.departureDate,
  };

  factory Point.fromData({
    required String id, 
    required Map<String, dynamic> data
  }) {
    return Point(
      id: id, 
      name: data['name'],
      description: data['description'], 
      isStopby: data['isStopby'], 
      imageURLs: data['imageURLs'], 
      arrivalDate: (data['arrivalDate'] as Timestamp).toDate(), 
      departureDate: (data['departureDate'] as Timestamp).toDate(),
    );
  }
}