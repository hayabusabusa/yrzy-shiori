import 'package:cloud_firestore/cloud_firestore.dart';

/// Firestore に保存されている予定のデータ.
class Plan {
  /// ドキュメントの ID.
  final String id;
  /// 予定のタイトル.
  final String title;
  /// 作成者.
  final String createdBy;
  /// 作成日時.
  final DateTime createdDate;
  /// 出発地点.
  final String departure;
  /// 出発日時.
  final DateTime departureDate;
  /// 予定の説明.
  final String? description;
  /// 目的地.
  final String destination;
  /// 帰宅時間.
  final DateTime homeDate;
  /// トータルで必要になる料金.
  final int totalPrice;
  /// 他サービスの URL.
  final String? url;

  Plan({
    required this.id,
    required this.title,
    required this.createdBy,
    required this.createdDate,
    required this.departure,
    required this.departureDate,
    required this.destination,
    required this.homeDate,
    required this.totalPrice,
    this.description,
    this.url,
  });

  Map<String, dynamic> get data => {
    'createdBy': createdBy,
    'createdDate': createdDate,
    'departure': departure,
    'departureDate': departureDate,
    'description': description,
    'destination': destination,
    'homeDate': homeDate,
    'title': title,
    'totalPrice': totalPrice,
    'url': url,
  };

  factory Plan.fromData({
    required String id,
    required Map<String, dynamic> data
  }) {
    return Plan(
      id: id, 
      title: data['title'],
      createdBy: data['createdBy'], 
      createdDate: (data['createdDate'] as Timestamp).toDate(), 
      departure: data['departure'], 
      departureDate: (data['departureDate'] as Timestamp).toDate(), 
      description: data['description'],
      destination: data['destination'], 
      homeDate: (data['homeDate'] as Timestamp).toDate(), 
      totalPrice: data['totalPrice'],
    );
  }
}