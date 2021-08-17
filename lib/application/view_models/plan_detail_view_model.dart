import 'package:flutter/foundation.dart';

import 'package:shiori/application/models/models.dart';

class PlanDetailViewModel extends ChangeNotifier {

  // MARK: Dependency

  late PlanDetailModelable _model;

  PlanDetailViewModel({
    required PlanDetailModelable model,
  }) {
    _model = model;
  }

  // MARK: Public

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }
}