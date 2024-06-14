import 'package:json_annotation/json_annotation.dart';

part 'message_list_model.g.dart';

@JsonSerializable()
class MessageListResponseModel {
  String? status;
  List<Datum>? data;

  MessageListResponseModel({
    this.status,
    this.data,
  });

  factory MessageListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MessageListResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$MessageListResponseModelToJson(this);
}

@JsonSerializable()
class Datum {
  String? id;
  String? name;
  int? groupId;
  int? roleId;
  int? phoneNumber;
  int? empId;
  String? status;
  List<dynamic>? membership;
  List<dynamic>? accountDetails;
  List<dynamic>? experiences;
  int? location;
  String? profileImg;
  String? title;
  String? firstName;
  String? middleName;
  String? lastName;
  String? dateOfBirth;
  String? gender;
  int? religion;
  int? caste;
  String? email;
  int? academicYear;
  dynamic password;
  dynamic addmissionId;
  List<Address>? addresses;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  int? userId;
  int? department;
  String? type;
  int? managerId;
  String? rfid;
  String? salutation;
  Role? role;
  String? reportingManager;
  String? designation;
  int? appId;
  String? birthDate;
  String? imageUrl;
  String? joiningDate;
  dynamic deviceId;
  int? shift;
  String? countryCode;
  dynamic course;
  dynamic courseId;
  dynamic datumClass;
  List<CourseDetail>? courseDetails;
  List<FamilyDetail>? familyDetails;
  List<Document>? documents;
  List<ContactDetail>? contactDetails;
  String? bloodGroup;
  dynamic isFaceDetection;
  dynamic isGeoFencing;
  int? locationId;
  int? departmentId;
  int? hostelAdmissionId;

  Datum({
    this.id,
    this.name,
    this.groupId,
    this.roleId,
    this.phoneNumber,
    this.empId,
    this.status,
    this.membership,
    this.accountDetails,
    this.experiences,
    this.location,
    this.profileImg,
    this.title,
    this.firstName,
    this.middleName,
    this.lastName,
    this.dateOfBirth,
    this.gender,
    this.religion,
    this.caste,
    this.email,
    this.academicYear,
    this.password,
    this.addmissionId,
    this.addresses,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.userId,
    this.department,
    this.type,
    this.managerId,
    this.rfid,
    this.salutation,
    this.role,
    this.reportingManager,
    this.designation,
    this.appId,
    this.birthDate,
    this.imageUrl,
    this.joiningDate,
    this.deviceId,
    this.shift,
    this.countryCode,
    this.course,
    this.courseId,
    this.datumClass,
    this.courseDetails,
    this.familyDetails,
    this.documents,
    this.contactDetails,
    this.bloodGroup,
    this.isFaceDetection,
    this.isGeoFencing,
    this.locationId,
    this.departmentId,
    this.hostelAdmissionId,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}

@JsonSerializable()
class Address {
  String? tag;
  String? street;
  String? locality;
  String? city;
  String? state;
  String? country;
  String? zip;
  String? addressType;

  Address({
    this.tag,
    this.street,
    this.locality,
    this.city,
    this.state,
    this.country,
    this.zip,
    this.addressType,
  });

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

@JsonSerializable()
class ContactDetail {
  String? phone;
  String? email;
  String? whatsApp;
  String? facebook;
  String? instagram;
  String? linkedIn;

  ContactDetail({
    this.phone,
    this.email,
    this.whatsApp,
    this.facebook,
    this.instagram,
    this.linkedIn,
  });

  factory ContactDetail.fromJson(Map<String, dynamic> json) =>
      _$ContactDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ContactDetailToJson(this);
}

@JsonSerializable()
class CourseDetail {
  dynamic classId;
  dynamic courseId;
  dynamic divisionId;

  CourseDetail({
    this.classId,
    this.courseId,
    this.divisionId,
  });

  factory CourseDetail.fromJson(Map<String, dynamic> json) =>
      _$CourseDetailFromJson(json);

  Map<String, dynamic> toJson() => _$CourseDetailToJson(this);
}

@JsonSerializable()
class Document {
  String? documentTitle;
  dynamic documentUrl;

  Document({
    this.documentTitle,
    this.documentUrl,
  });

  factory Document.fromJson(Map<String, dynamic> json) => _$DocumentFromJson(json);

  Map<String, dynamic> toJson() => _$DocumentToJson(this);
}

@JsonSerializable()
class FamilyDetail {
  String? fatherName;
  String? fatherPhoneNumber;
  String? motherName;
  dynamic motherPhoneNumber;
  String? guardianName;
  String? guardianPhoneNumber;
  List<EmergencyContact>? emergencyContact;

  FamilyDetail({
    this.fatherName,
    this.fatherPhoneNumber,
    this.motherName,
    this.motherPhoneNumber,
    this.guardianName,
    this.guardianPhoneNumber,
    this.emergencyContact,
  });

  factory FamilyDetail.fromJson(Map<String, dynamic> json) =>
      _$FamilyDetailFromJson(json);

  Map<String, dynamic> toJson() => _$FamilyDetailToJson(this);
}

@JsonSerializable()
class EmergencyContact {
  String? contactName;
  String? phoneNumber;
  dynamic relationship;

  EmergencyContact({
    this.contactName,
    this.phoneNumber,
    this.relationship,
  });

  factory EmergencyContact.fromJson(Map<String, dynamic> json) =>
      _$EmergencyContactFromJson(json);

  Map<String, dynamic> toJson() => _$EmergencyContactToJson(this);
}

@JsonSerializable()
class Role {
  String? name;
  int? roleId;

  Role({
    this.name,
    this.roleId,
  });

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);

  Map<String, dynamic> toJson() => _$RoleToJson(this);
}
