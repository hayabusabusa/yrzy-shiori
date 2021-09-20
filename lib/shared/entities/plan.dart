import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:shiori/shared/shared.dart';

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
  /// 到着時間.
  final DateTime arrivalDate;
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
    required this.arrivalDate,
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
    'arrivalDate': arrivalDate,
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
      arrivalDate: (data['arrivalDate'] as Timestamp).toDate(), 
      totalPrice: data['totalPrice'],
      url: data['url'],
    );
  }

  /// 整形した出発から到着までの期間の文字列を返す.
  String formattedDurationString() {
    final today = DateTime.now();
    final isAnotherYear = this.departureDate.year != today.year || this.arrivalDate.year != today.year;

    final duration = this.departureDate.difference(this.arrivalDate).inDays;
    final isSameDay = duration <= 0;
    
    // 違う年の1日の予定 2021年01月01日
    if (isAnotherYear && isSameDay) {
      return this.departureDate.formattedString('yyyy年MM月dd日');
    }

    // 違う年の予定 2021年01月01日 - 2021年01月02日
    if (isAnotherYear) {
      return this.departureDate.formattedString('yyyy年MM月dd日') + '-' + this.arrivalDate.formattedString('yyyy年MM月dd日');
    }

    // 同じ年の1日の予定 01月01日
    if (isSameDay) {
      return this.departureDate.formattedString('MM月dd日');
    }

    // その他 01月01日 - 01月02日
    return this.departureDate.formattedString('MM月dd日') + '-' + this.arrivalDate.formattedString('MM月dd日');
  }
}