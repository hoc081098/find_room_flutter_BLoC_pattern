import 'package:find_room/models/firebase_model.dart';
import 'package:find_room/models/room_entity.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'banner_entity.g.dart';

@JsonSerializable()
@immutable
class BannerEntity implements FirebaseModel {
  final String image;
  final String description;
  final String documentID;

  BannerEntity({
    this.image,
    this.description,
    this.documentID,
  });

  factory BannerEntity.fromDocument(DocumentSnapshot doc) => _$BannerEntityFromJson(withId(doc));

  Map<String, dynamic> toJson() => _$BannerEntityToJson(this);

  @override
  String get id => documentID;

  @override
  String toString() => 'BannerEntity{image: $image, description: $description, documentID: $documentID}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is BannerEntity &&
              runtimeType == other.runtimeType &&
              image == other.image &&
              description == other.description &&
              documentID == other.documentID;

  @override
  int get hashCode =>
      image.hashCode ^
      description.hashCode ^
      documentID.hashCode;
}
