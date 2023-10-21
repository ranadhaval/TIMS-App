import 'package:tims/pages/Login/model/request/LoginRequest.dart';
import 'package:tims/webservices/response_model.dart';
import '../../../webservices/api_request.dart';
import '../../../webservices/url_constants.dart';
import '../model/request/OtherLoginModel.dart';

class CheckLoginProvider {
  void othercheckLoginProvider(
      {OtherLoginCheckModel? otherLoginCheckModel,
      Function()? beforeSend,
      Function(ResponseModel response)? onSuccess,
      Function(ResponseModel response)? onError}) {
    ApiRequest(url: UrlConstants.loginOtherurl, data: otherLoginCheckModel)
        .postRequest(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        onSuccess!(data);
      },
      onError: (error) {
        print(error);
      },
    );
  }

  void loginRequestProvider({
    LoginRequest? loginRequest,
    Function()? beforesend,
    Function(ResponseModel responseModel)? onSuccess,
    Function(ResponseModel responseModel)? onError,
  }) {
    ApiRequest(url: UrlConstants.loginUrl, data: loginRequest).postRequest(
        beforeSend: () => {if (beforesend != null) beforesend()},
        onSuccess: (data) {
          onSuccess!(data);
        },
        onError: (error) {
          print('object');
          print(error);
        });
  }
}
