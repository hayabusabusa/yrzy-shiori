import 'package:flutter/foundation.dart';

import 'package:shiori/application/models/models.dart';
import 'package:shiori/shared/shared.dart';

class PlanDetailViewModel extends ChangeNotifier {

  // MARK: Dependency

  late PlanDetailModelable _model;

  PlanDetailViewModel({
    required PlanDetailModelable model,
  }) {
    _model = model;
    _model.isLoading.listen((event) {
      _isLoading = event;
      notifyListeners();
    });
    _model.plan.listen((event) { 
      _plan = event;
      notifyListeners();
    });
    // 画面表示用の `Timeline` の配列に変換する.
    _model.points.map((event) {
      final now = DateTime.now();
      return event.map((e) {
        final isPassed = e.arrivalDate.isBefore(now);
        return Timeline(point: e, isPassed: isPassed);
      })
      .toList();
    })
    .listen((event) {
      _timelines = event;
      notifyListeners();
    });

    _model.fetch();
  }

  // MARK: Properties

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  late Plan _plan;
  Plan get plan => _plan;

  List<Timeline> _timelines = [];
  List<Timeline> get timelines => _timelines;

  // MARK: Public

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }
}