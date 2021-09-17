import 'package:flutter/foundation.dart';

import 'package:shiori/application/models/models.dart';
import 'package:shiori/shared/shared.dart';

class BringsViewModel extends ChangeNotifier {

  // MARK: Dependency

  late BringsModelable _model;

  BringsViewModel({
    required BringsModelable model,
  }) {
    _model = model;
    _model.isLoading.listen((event) { 
      _isLoading = event;
      notifyListeners();
    });
    _model.brings.listen((event) { 
      _brings = event;
      notifyListeners();
    });

    _model.fetch();
  }

  // MARK: Properties

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  List<Bring> _brings = [];
  List<Bring> get brings => _brings;

  // MARK: Public

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }
}