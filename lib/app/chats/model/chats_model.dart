import 'package:json_annotation/json_annotation.dart';

part 'chats_model.g.dart';

@JsonSerializable()
class ChatsModel {
  Data? data;

  ChatsModel({this.data});

  factory ChatsModel.fromJson(Map<String, dynamic> json) =>
      _$ChatsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatsModelToJson(this);
}

@JsonSerializable()
class Data {
  String? receiver;
  String? sender;
  String? message;
  int? groupId;
  int? receiverId;
  int? senderId;
  String? id;
  DateTime? timestamp;
  int? v;

  Data({
    this.receiver,
    this.sender,
    this.message,
    this.groupId,
    this.receiverId,
    this.senderId,
    this.id,
    this.timestamp,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
