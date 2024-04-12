class Topic{
  int? id;
  String name;

  Topic({this.id, required this.name});

  Map<String,Object?> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  @override
  String toString() {
    return 'Topic{id: $id, name: $name}';
  }
}