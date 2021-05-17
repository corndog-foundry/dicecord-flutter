import 'package:hive/hive.dart';

part 'feature_5e.g.dart';

@HiveType(typeId: 2)
class Feature5e {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String source;
  @HiveField(2)
  final String description;

  Feature5e({
    this.name,
    this.source,
    this.description
  });
}