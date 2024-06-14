import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'get_chat_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ChatGetModel {
    List<Datum>? data;

    ChatGetModel({
        this.data,
    });

    factory ChatGetModel.fromJson(Map<String, dynamic> json) => _$ChatGetModelFromJson(json);

    Map<String, dynamic> toJson() => _$ChatGetModelToJson(this);

    static ChatGetModel fromJsonString(String str) => ChatGetModel.fromJson(json.decode(str));

    String toJsonString() => json.encode(toJson());
}

@JsonSerializable(explicitToJson: true)
class Datum {
    @JsonKey(name: "_id")
    String? id;
    String? receiver;
    String? sender;
    String? message;
    int? groupId;
    int? receiverId;
    int? senderId;
    DateTime? timestamp;
    @JsonKey(name: "__v")
    int? v;
    String? formattedDateTime;

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
    });

    factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

    Map<String, dynamic> toJson() => _$DatumToJson(this);
}
