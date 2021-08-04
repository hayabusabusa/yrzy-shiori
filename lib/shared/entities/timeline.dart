import 'package:shiori/shared/entities/point.dart';

/// 予定詳細のタイムラインの状態を表すデータ.
class Timeline {
  /// Firestore に保存されている地点のデータ.
  final Point point;
  /// 通り過ぎた地点かどうか.
  final bool isPassed;

  Timeline({
    required this.point,
    required this.isPassed,
  });
}