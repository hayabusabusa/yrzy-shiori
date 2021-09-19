import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'package:shiori/domain/domain.dart';
import 'package:shiori/shared/shared.dart';

abstract class PlanDetailModelable {
  /// ロード中かどうかが流れてくる `Stream<bool>`.
  Stream<bool> get isLoading;
  /// Firestore から取得した予定のデータを流す `Stream<Plan>`.
  Stream<Plan> get plan;
  /// Firestore から取得した地点一覧のデータを流す `Stream<List<Point>>`.
  Stream<List<Point>> get points;
  /// 発生したエラーを流す `Stream<Error>`.
  Stream<Error> get error;
  /// Firestore に地点のデータを取りに行く.
  void fetch();
  /// リソースの解放.
  void dispose();
}

class PlanDetailModel extends PlanDetailModelable {

  // MARK: Dependency

  late Plan _plan;
  late FirestoreService _firestoreService;

  // MARK: Properties

  // late StreamSubscription<int> _timerStream;
  late BehaviorSubject<Plan> _planSubject;
  Stream<Plan> get plan => _planSubject.stream;

  final BehaviorSubject<bool> _isLoadingSubject = BehaviorSubject<bool>.seeded(true);
  Stream<bool> get isLoading => _isLoadingSubject.stream;
  final BehaviorSubject<List<Point>> _pointsSubject = BehaviorSubject<List<Point>>.seeded([]);
  Stream<List<Point>> get points => _pointsSubject.stream;
  final PublishSubject<Error> _errorSubject = PublishSubject<Error>();
  Stream<Error> get error => _errorSubject.stream;

  PlanDetailModel({
    required Duration duration,
    required Plan plan,
    required FirestoreService firestoreService,
  }) {
    _plan = plan;
    _firestoreService = firestoreService;
    // 現在地を更新するためにタイマーで監視.
    // _timerStream = Stream<int>.periodic(duration)
    //   .listen((event) { 
    //     print(event);
    //   });
    _planSubject = BehaviorSubject<Plan>.seeded(plan);
  }

  // MARK: Public

  void fetch() async {
    _isLoadingSubject.add(true);
    try {
      final snapshot = await _firestoreService.getNestedDocuments(collection: Collection.Plans, path: _plan.id, subCollection: SubCollection.Points);
      final decoded = snapshot.docs.map((e) => Point.fromData(id: e.id, data: e.data())).toList();
      // TODO: 予定から自動で出発地のデータと到着地のデータを作るのかどうか決める.
      // 今回は手動で出発地と到着地のデータを `points` コレクションに入れるようにしたので、以下のコードをコメントアウト.
      final points = decoded; //+ [Point.home(arrivalDate: _plan.arrivalDate)];
      // 地点のデータを到着時間で降順にソートする.
      points.sort((lhs, rhs) => lhs.arrivalDate.compareTo(rhs.arrivalDate));
      _pointsSubject.add(points);
    } on Error catch(error) {
      _errorSubject.add(error);
    } catch(error) {
      print(error);
    }
    _isLoadingSubject.add(false);
  }

  void dispose() {
    // _timerStream.cancel();
    _planSubject.close();
    _isLoadingSubject.close();
    _pointsSubject.close();
    _errorSubject.close();
  }

  // MARK: Private
}