// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageListResponseModel _$MessageListResponseModelFromJson(
        Map<String, dynamic> json) =>
    MessageListResponseModel(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MessageListResponseModelToJson(
        MessageListResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: json['id'] as String?,
      name: json['name'] as String?,
      groupId: (json['groupId'] as num?)?.toInt(),
      roleId: (json['roleId'] as num?)?.toInt(),
      phoneNumber: (json['phoneNumber'] as num?)?.toInt(),
      empId: (json['empId'] as num?)?.toInt(),
      status: json['status'] as String?,
      membership: json['membership'] as List<dynamic>?,
      accountDetails: json['accountDetails'] as List<dynamic>?,
      experiences: json['experiences'] as List<dynamic>?,
      location: (json['location'] as num?)?.toInt(),
      profileImg: json['profileImg'] as String?,
      title: json['title'] as String?,
      firstName: json['firstName'] as String?,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      gender: json['gender'] as String?,
      religion: (json['religion'] as num?)?.toInt(),
      caste: (json['caste'] as num?)?.toInt(),
      email: json['email'] as String?,
      academicYear: (json['academicYear'] as num?)?.toInt(),
      password: json['password'],
      addmissionId: json['addmissionId'],
      addresses: (json['addresses'] as List<dynamic>?)
          ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: (json['v'] as num?)?.toInt(),
      userId: (json['userId'] as num?)?.toInt(),
      department: (json['department'] as num?)?.toInt(),
      type: json['type'] as String?,
      managerId: (json['managerId'] as num?)?.toInt(),
      rfid: json['rfid'] as String?,
      salutation: json['salutation'] as String?,
      role: json['role'] == null
          ? null
          : Role.fromJson(json['role'] as Map<String, dynamic>),
      reportingManager: json['reportingManager'] as String?,
      designation: json['designation'] as String?,
      appId: (json['appId'] as num?)?.toInt(),
      birthDate: json['birthDate'] as String?,
      imageUrl: json['imageUrl'] as String?,
      joiningDate: json['joiningDate'] as String?,
      deviceId: json['deviceId'],
      shift: (json['shift'] as num?)?.toInt(),
      countryCode: json['countryCode'] as String?,
      course: json['course'],
      courseId: json['courseId'],
      datumClass: json['datumClass'],
      courseDetails: (json['courseDetails'] as List<dynamic>?)
          ?.map((e) => CourseDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      familyDetails: (json['familyDetails'] as List<dynamic>?)
          ?.map((e) => FamilyDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      documents: (json['documents'] as List<dynamic>?)
          ?.map((e) => Document.fromJson(e as Map<String, dynamic>))
          .toList(),
      contactDetails: (json['contactDetails'] as List<dynamic>?)
          ?.map((e) => ContactDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      bloodGroup: json['bloodGroup'] as String?,
      isFaceDetection: json['isFaceDetection'],
      isGeoFencing: json['isGeoFencing'],
      locationId: (json['locationId'] as num?)?.toInt(),
      departmentId: (json['departmentId'] as num?)?.toInt(),
      hostelAdmissionId: (json['hostelAdmissionId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'groupId': instance.groupId,
      'roleId': instance.roleId,
      'phoneNumber': instance.phoneNumber,
      'empId': instance.empId,
      'status': instance.status,
      'membership': instance.membership,
      'accountDetails': instance.accountDetails,
      'experiences': instance.experiences,
      'location': instance.location,
      'profileImg': instance.profileImg,
      'title': instance.title,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'dateOfBirth': instance.dateOfBirth,
      'gender': instance.gender,
      'religion': instance.religion,
      'caste': instance.caste,
      'email': instance.email,
      'academicYear': instance.academicYear,
      'password': instance.password,
      'addmissionId': instance.addmissionId,
      'addresses': instance.addresses,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'v': instance.v,
      'userId': instance.userId,
      'department': instance.department,
      'type': instance.type,
      'managerId': instance.managerId,
      'rfid': instance.rfid,
      'salutation': instance.salutation,
      'role': instance.role,
      'reportingManager': instance.reportingManager,
      'designation': instance.designation,
      'appId': instance.appId,
      'birthDate': instance.birthDate,
      'imageUrl': instance.imageUrl,
      'joiningDate': instance.joiningDate,
      'deviceId': instance.deviceId,
      'shift': instance.shift,
      'countryCode': instance.countryCode,
      'course': instance.course,
      'courseId': instance.courseId,
      'datumClass': instance.datumClass,
      'courseDetails': instance.courseDetails,
      'familyDetails': instance.familyDetails,
      'documents': instance.documents,
      'contactDetails': instance.contactDetails,
      'bloodGroup': instance.bloodGroup,
      'isFaceDetection': instance.isFaceDetection,
      'isGeoFencing': instance.isGeoFencing,
      'locationId': instance.locationId,
      'departmentId': instance.departmentId,
      'hostelAdmissionId': instance.hostelAdmissionId,
    };

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      tag: json['tag'] as String?,
      street: json['street'] as String?,
      locality: json['locality'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      country: json['country'] as String?,
      zip: json['zip'] as String?,
      addressType: json['addressType'] as String?,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'tag': instance.tag,
      'street': instance.street,
      'locality': instance.locality,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'zip': instance.zip,
      'addressType': instance.addressType,
    };

ContactDetail _$ContactDetailFromJson(Map<String, dynamic> json) =>
    ContactDetail(
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      whatsApp: json['whatsApp'] as String?,
      facebook: json['facebook'] as String?,
      instagram: json['instagram'] as String?,
      linkedIn: json['linkedIn'] as String?,
    );

Map<String, dynamic> _$ContactDetailToJson(ContactDetail instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'email': instance.email,
      'whatsApp': instance.whatsApp,
      'facebook': instance.facebook,
      'instagram': instance.instagram,
      'linkedIn': instance.linkedIn,
    };

CourseDetail _$CourseDetailFromJson(Map<String, dynamic> json) => CourseDetail(
      classId: json['classId'],
      courseId: json['courseId'],
      divisionId: json['divisionId'],
    );

Map<String, dynamic> _$CourseDetailToJson(CourseDetail instance) =>
    <String, dynamic>{
      'classId': instance.classId,
      'courseId': instance.courseId,
      'divisionId': instance.divisionId,
    };

Document _$DocumentFromJson(Map<String, dynamic> json) => Document(
      documentTitle: json['documentTitle'] as String?,
      documentUrl: json['documentUrl'],
    );

Map<String, dynamic> _$DocumentToJson(Document instance) => <String, dynamic>{
      'documentTitle': instance.documentTitle,
      'documentUrl': instance.documentUrl,
    };

FamilyDetail _$FamilyDetailFromJson(Map<String, dynamic> json) => FamilyDetail(
      fatherName: json['fatherName'] as String?,
      fatherPhoneNumber: json['fatherPhoneNumber'] as String?,
      motherName: json['motherName'] as String?,
      motherPhoneNumber: json['motherPhoneNumber'],
      guardianName: json['guardianName'] as String?,
      guardianPhoneNumber: json['guardianPhoneNumber'] as String?,
      emergencyContact: (json['emergencyContact'] as List<dynamic>?)
          ?.map((e) => EmergencyContact.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FamilyDetailToJson(FamilyDetail instance) =>
    <String, dynamic>{
      'fatherName': instance.fatherName,
      'fatherPhoneNumber': instance.fatherPhoneNumber,
      'motherName': instance.motherName,
      'motherPhoneNumber': instance.motherPhoneNumber,
      'guardianName': instance.guardianName,
      'guardianPhoneNumber': instance.guardianPhoneNumber,
      'emergencyContact': instance.emergencyContact,
    };

EmergencyContact _$EmergencyContactFromJson(Map<String, dynamic> json) =>
    EmergencyContact(
      contactName: json['contactName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      relationship: json['relationship'],
    );

Map<String, dynamic> _$EmergencyContactToJson(EmergencyContact instance) =>
    <String, dynamic>{
      'contactName': instance.contactName,
      'phoneNumber': instance.phoneNumber,
      'relationship': instance.relationship,
    };

Role _$RoleFromJson(Map<String, dynamic> json) => Role(
      name: json['name'] as String?,
      roleId: (json['roleId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RoleToJson(Role instance) => <String, dynamic>{
      'name': instance.name,
      'roleId': instance.roleId,
    };
