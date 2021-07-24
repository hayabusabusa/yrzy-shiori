import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:shiori/utils/utils.dart';

class Point extends FirestoreCodable<Point> {
  /// ドキュメントの ID.
  final String id;
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
    required this.description,
    required this.isStopby,
    required this.imageURLs,
    required this.arrivalDate,
    required this.departureDate,
  });

  @override
  Map<String, dynamic> get data => {
    'description': this.description,
    'isStopby': this.isStopby,
    'imageURLs': this.imageURLs,
    'arrivalDate': this.arrivalDate,
    'departureDate': this.departureDate,
  };

  @override
  Point decode(Map<String, dynamic> data, String id) {
    return Point(
      id: id, 
      description: data['description'], 
      isStopby: data['isStopby'], 
      imageURLs: data['imageURLs'], 
      arrivalDate: (data['arrivalDate'] as Timestamp).toDate(), 
      departureDate: (data['departureDate'] as Timestamp).toDate(),
    );
  }
}