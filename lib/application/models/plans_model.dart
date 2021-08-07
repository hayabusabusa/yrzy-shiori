import 'package:rxdart/rxdart.dart';

import 'package:shiori/domain/domain.dart';
import 'package:shiori/shared/shared.dart';

abstract class PlansModelable {
  /// ロード中かどうかが流れてくる `Stream<bool>`.
  Stream<bool> get isLoading;
  /// Firestore から取得してきた予定一覧 `Stream<List<Plan>>`.
  Stream<List<Plan>> get plans;
  /// 発生したエラーを流す `Stream<Error>`.
  Stream<Error> get error;
  /// 予定一覧を取得する.
  void fetch();
  /// リソースの解放.
  void dispose();
}

class PlansModel extends PlansModelable {

  // MARK: Dependency

  FirestoreService _firestoreService;

  PlansModel({
    required FirestoreService firestoreService,
  }) : this._firestoreService = firestoreService;

  // MARK: Properties

  final BehaviorSubject<bool> _isLoadingSubject = BehaviorSubject<bool>.seeded(true);
  Stream<bool> get isLoading => _isLoadingSubject.stream;
  final BehaviorSubject<List<Plan>> _plansSubject = BehaviorSubject<List<Plan>>.seeded([]);
  Stream<List<Plan>> get plans => _plansSubject.stream;
  final PublishSubject<Error> _errorSubject = PublishSubject<Error>();
  Stream<Error> get error => _errorSubject.stream;

  // MARK: Public

  void fetch() async {
    _isLoadingSubject.add(true);
    try {
      // final snapshot = await _firestoreService.getDocuments(collection: Collection.Plans);
      // final decoded = snapshot.docs.map((e) => Plan.fromData(id: e.id, data: e.data())).toList();
      // _plansSubject.add(decoded);
      final plan = Plan(
        id: '', 
        createdBy: '小林くん', 
        createdDate: DateTime.now(), 
        departure: '川名駅', 
        departureDate: DateTime.now(), 
        destination: '名古屋駅', 
        homeDate: DateTime.now(), 
        totalPrice: 480,
      );
      await _firestoreService.setDocument(collection: Collection.Plans, data: plan.data);
    } on Error catch(error) {
      _errorSubject.add(error);
    } catch (error) {
      print(error);
    }
    _isLoadingSubject.add(false);
  }

  void dispose() {
    _isLoadingSubject.close();
    _plansSubject.close();
    _errorSubject.close();
  }
}