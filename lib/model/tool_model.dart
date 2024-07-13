class Tool {
  final String name;
  final String type;

  Tool({required this.name, required this.type});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Tool &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          type == other.type;

  @override
  int get hashCode => name.hashCode ^ type.hashCode;
}
