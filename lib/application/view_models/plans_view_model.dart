import 'package:flutter/foundation.dart';

import 'package:shiori/application/models/models.dart';
import 'package:shiori/shared/shared.dart';

class PlansViewModel extends ChangeNotifier {

  // MARK: Dependency

  late PlansModelable _model;

  PlansViewModel({
    required PlansModelable model,
  }) {
    _model = model;
    _model.isLoading.listen((event) { 
      _isLoading = event;
      notifyListeners();
    });
    _model.plans.listen((event) {
      _plans = event;
      notifyListeners();
    });

    _model.fetch();
  }

  // MARK: Properties

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Plan> _plans = [];
  List<Plan> get plans => _plans;

  // MARK: Public

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }
}