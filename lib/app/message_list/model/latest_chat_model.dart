import 'package:json_annotation/json_annotation.dart';

part 'latest_chat_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetLatestChats {
  List<Datum>? data;

  GetLatestChats({
    this.data,
  });

  factory GetLatestChats.fromJson(Map<String, dynamic> json) => _$GetLatestChatsFromJson(json);

  Map<String, dynamic> toJson() => _$GetLatestChatsToJson(this);
}

@JsonSerializable()
class Datum {
  String? id;
  String? receiver;
  String? sender;
  String? message;
  dynamic groupId;
  int? receiverId;
  int? senderId;
  DateTime? timestamp;
  int? v;
  String? formattedDateTime;
  String? handledBy;
  String? userId;
  int? communicationId;

  Datum({
    this.id,
    this.receiver,
    this.sender,
    this.message,
    this.groupId,
    this.receiverId,
    this.senderId,
    this.timestamp,
    this.v,
    this.formattedDateTime,
    this.handledBy,
    this.userId,
    this.communicationId,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
