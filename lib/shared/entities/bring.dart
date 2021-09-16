/// Firestore に保存されている荷物のデータ.
class Bring {
  /// ドキュメントの ID.
  final String id;
  /// 荷物の名前.
  final String name;
  /// 荷物が必須かどうか.
  final bool isRequired;
  /// 荷物の説明.
  final String? description;

  Bring({
    required this.id,
    required this.name,
    required this.isRequired,
    this.description,
  });

  Map<String, dynamic> get data => {
    'name': this.name,
    'isRequired': this.isRequired,
    'description': this.description,
  };

  factory Bring.fromData({
    required String id, 
    required Map<String, dynamic> data
  }) {
    return Bring(
      id: id, 
      name: data['name'], 
      isRequired: data['isRequired'],
      description: data['description'],
    );
  }
}