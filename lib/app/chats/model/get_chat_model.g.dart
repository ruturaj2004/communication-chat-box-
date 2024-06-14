// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatGetModel _$ChatGetModelFromJson(Map<String, dynamic> json) => ChatGetModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChatGetModelToJson(ChatGetModel instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: json['_id'] as String?,
      receiver: json['receiver'] as String?,
      sender: json['sender'] as String?,
      message: json['message'] as String?,
      groupId: (json['groupId'] as num?)?.toInt(),
      receiverId: (json['receiverId'] as num?)?.toInt(),
      senderId: (json['senderId'] as num?)?.toInt(),
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
      v: (json['__v'] as num?)?.toInt(),
      formattedDateTime: json['formattedDateTime'] as String?,
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      '_id': instance.id,
      'receiver': instance.receiver,
      'sender': instance.sender,
      'message': instance.message,
      'groupId': instance.groupId,
      'receiverId': instance.receiverId,
      'senderId': instance.senderId,
      'timestamp': instance.timestamp?.toIso8601String(),
      '__v': instance.v,
      'formattedDateTime': instance.formattedDateTime,
    };
