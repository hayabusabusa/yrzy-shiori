/// Firestore に保存されている費用のデータ.
class Price {
  /// ドキュメントの ID.
  final String id;
  /// 値段.
  final int value;
  /// 詳細.
  final String description;

  Price({
    required this.id,
    required this.value,
    required this.description,
  });

  Map<String, dynamic> get data => {
    'value': this.value,
    'description': this.description,
  };

  factory Price.fromData({
    required String id, 
    required Map<String, dynamic> data
  }) {
    return Price(
      id: id,
      value: data['value'], 
      description: data['description'],
    );
  }
}