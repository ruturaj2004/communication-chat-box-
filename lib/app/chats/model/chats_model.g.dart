// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatsModel _$ChatsModelFromJson(Map<String, dynamic> json) => ChatsModel(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChatsModelToJson(ChatsModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      receiver: json['receiver'] as String?,
      sender: json['sender'] as String?,
      message: json['message'] as String?,
      groupId: (json['groupId'] as num?)?.toInt(),
      receiverId: (json['receiverId'] as num?)?.toInt(),
      senderId: (json['senderId'] as num?)?.toInt(),
      id: json['id'] as String?,
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
      v: (json['v'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'receiver': instance.receiver,
      'sender': instance.sender,
      'message': instance.message,
      'groupId': instance.groupId,
      'receiverId': instance.receiverId,
      'senderId': instance.senderId,
      'id': instance.id,
      'timestamp': instance.timestamp?.toIso8601String(),
      'v': instance.v,
    };
