import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class BaseModel {
  @JsonProperty(ignoreIfNull: true)
  int? id;

  @JsonProperty(ignoreForSerialization: true)
  int? deleted;

  @JsonProperty(name: 'created_at', ignoreForSerialization: true)
  String? createdAt;

  @JsonProperty(name: 'updated_at', ignoreForSerialization: true)
  String? updatedAt;

  @JsonProperty(name: 'deleted_at', ignoreForSerialization: true)
  String? deletedAt;

  @JsonProperty(name: 'last_updated', ignoreForSerialization: true)
  int? lastUpdated;

  @JsonProperty(ignore: true)
  @override
  String toString() {
    return runtimeType.toString() +
        "{ id: $id, lastUpdated: $lastUpdated, deleted: $deleted, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt,}";
  }
}
