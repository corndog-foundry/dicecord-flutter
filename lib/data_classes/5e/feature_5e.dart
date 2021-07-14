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
  @HiveField(3)
  final bool hasResources;
  @HiveField(4)
  final int resourceCount;

  Feature5e({
    this.name,
    this.source,
    this.description,
    this.hasResources,
    this.resourceCount
  });
}