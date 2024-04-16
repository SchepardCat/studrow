class Topic{
  int? id_topic;
  String name;

  Topic({this.id_topic, required this.name});

  Map<String,Object?> toMap() {
    return {
      'id_topic': id_topic,
      'name': name,
    };
  }

  @override
  String toString() {
    return 'Topic{id_topic: $id_topic, name: $name}';
  }
}