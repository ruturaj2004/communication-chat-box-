import '../utils/api_base_model/api_base_model.dart';

class ApiEndPoints {
  ApiBaseModel? apiBaseModel;

  ApiEndPoints({this.apiBaseModel}) {
    if (apiBaseModel == null) {}
  }

  late String baseUrl = apiBaseModel?.commerceUrl ?? "";
  late String authBaseUrl = apiBaseModel?.authUrl ?? "";
  late String gatewayBaseUrl = apiBaseModel?.gatewayUrl ?? "";
  late String memberBaseUrl = apiBaseModel?.memberUrl ?? "";
  late String peopleManagementBaseUrl = apiBaseModel?.peopleManagementUrl ?? "";

  late String academicUrl = apiBaseModel?.academicUrl ?? "";
  late String imageUploadBaseUrl = apiBaseModel?.imageUploadUrl ?? "";
  late String imageResizeBaseUrl = apiBaseModel?.imageResizeUrl ?? "";
  late String version = apiBaseModel?.version ?? "";
  late int groupId = apiBaseModel?.groupId ?? 1709987550657;

  late String getCategoryByGroupId = "${academicUrl}category/all/getByGroupId/";
  late String searchMessageList =
      "$peopleManagementBaseUrl/members/searchquery/";
  late String sendMessgeChat = "$academicUrl/communication/send-customer";
  late String getmessage = "$academicUrl/communication/all-chats/";
  late String verifyToken = "authgw/verify-token";
  late String  getLastMessageAndMember="$academicUrl/communication/latest-from-each-chat";

}
