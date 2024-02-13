class TodoModel {
  final int id;
  final String product;
  final String description;
  final bool check;
  TodoModel({
    required this.id,
    required this.product,
    required this.check,
    required this.description,
  });

  TodoModel copyWith({
    int? id,
    String? product,
    bool? check,
    String? description,
  }) {
    return TodoModel(
      id: id ?? this.id,
      product: product ?? this.product,
      check: check ?? this.check,
      description: description ?? this.description,
    );
  }
}
