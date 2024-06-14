// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latest_chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetLatestChats _$GetLatestChatsFromJson(Map<String, dynamic> json) =>
    GetLatestChats(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetLatestChatsToJson(GetLatestChats instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: json['id'] as String?,
      receiver: json['receiver'] as String?,
      sender: json['sender'] as String?,
      message: json['message'] as String?,
      groupId: json['groupId'],
      receiverId: (json['receiverId'] as num?)?.toInt(),
      senderId: (json['senderId'] as num?)?.toInt(),
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
      v: (json['v'] as num?)?.toInt(),
      formattedDateTime: json['formattedDateTime'] as String?,
      handledBy: json['handledBy'] as String?,
      userId: json['userId'] as String?,
      communicationId: (json['communicationId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'receiver': instance.receiver,
      'sender': instance.sender,
      'message': instance.message,
      'groupId': instance.groupId,
      'receiverId': instance.receiverId,
      'senderId': instance.senderId,
      'timestamp': instance.timestamp?.toIso8601String(),
      'v': instance.v,
      'formattedDateTime': instance.formattedDateTime,
      'handledBy': instance.handledBy,
      'userId': instance.userId,
      'communicationId': instance.communicationId,
    };
