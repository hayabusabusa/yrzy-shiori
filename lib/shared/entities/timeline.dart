import 'package:shiori/shared/entities/point.dart';

/// 予定詳細のタイムラインの状態を表すデータ.
class Timeline {
  /// Firestore に保存されている地点のデータ.
  final Point point;
  /// 現在地かどうか.
  final bool isCurrent;

  Timeline({
    required this.point,
    required this.isCurrent,
  });
}