class ApiBaseModel {
  String? authUrl;
  String? commerceUrl;
  String? gatewayUrl;
  String? memberUrl;
  String? peopleManagementUrl;
  String? academicUrl;
  String? imageUploadUrl;
  String? imageResizeUrl;
  int? groupId;
  int? experienceGroupId;
  int? roleId;
  String? version;

  ApiBaseModel({
    this.authUrl,
    this.commerceUrl,
    this.gatewayUrl,
    this.memberUrl,
    this.peopleManagementUrl,
    this.academicUrl,
    this.imageUploadUrl,
    this.imageResizeUrl,
    this.groupId,
    this.experienceGroupId,
    this.roleId,
    this.version,
  });

  factory ApiBaseModel.fromJson(Map<String, dynamic> json) => ApiBaseModel(
        authUrl: json["authUrl"],
        commerceUrl: json["commerceUrl"],
        gatewayUrl: json["gatewayUrl"],
        memberUrl: json["memberUrl"],
        peopleManagementUrl: json["peopleManagementUrl"],
        academicUrl: json["academicUrl"],
        imageUploadUrl: json["imageUploadUrl"],
        imageResizeUrl: json["imageResizeUrl"],
        groupId: json["groupId"],
        experienceGroupId: json["experienceGroupId"],
        roleId: json["roleId"],
        version: json["version"],
      );
}
