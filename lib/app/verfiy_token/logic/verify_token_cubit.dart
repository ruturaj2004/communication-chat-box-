import 'package:baap_communication_app/app/verfiy_token/model/verfiy_token_model.dart';
import 'package:baap_communication_app/main.dart';
import 'package:baap_communication_app/utils/api/api_base.dart';
import 'package:baap_communication_app/utils/preferences/local_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'verify_token_state.dart';

class VerfiyTokenCubit extends Cubit<VerifyTokenState> {
  final ApiBase _apiBase = ApiBase();
  VerfiyTokenCubit() : super(VerifyTokenInitial());

  void fetchToken(String? token, int? groupId) async {
    emit(VerifyTokenLoading());
    var data = {"token": token, "groupId": groupId};
    try {
      await _apiBase.post(
        '${apiEndPoints.gatewayBaseUrl}${apiEndPoints.verifyToken}',
        data,
        (data) {
          var jsonData = RefreshTokenModel.fromJson(data);
          if ((jsonData.data?.userExists ?? false) &&
              (jsonData.token?.isNotEmpty ?? false)) {
            var refreshToken = jsonData.token;
            LocalStorageUtils.saveUserDetails(refreshToken ?? "");
            LocalStorageUtils.saveGroupId(groupId ?? 0);
            emit(VerifyTokenLoaded());
          } else {
            emit(VerifyTokenFailure(errorMesage: jsonData.message));
          }
        },
        (error) {
          emit(VerifyTokenFailure(errorMesage: error));
        },
      );
    } catch (e) {
      emit(VerifyTokenFailure(errorMesage: e.toString()));
    }
  }
}
