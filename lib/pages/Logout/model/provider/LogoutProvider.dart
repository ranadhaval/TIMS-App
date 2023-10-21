import 'package:tims/pages/Logout/model/request/LogoutRequest.dart';
import 'package:tims/webservices/api_request.dart';
import 'package:tims/webservices/response_model.dart';
import 'package:tims/webservices/url_constants.dart';

class LogoutProvider {
 logoutProvider(
      {LogoutRequest? logoutRequest,
      Function()? beforeSend,
      Function(ResponseModel response)? onSuccess,
      Function(ResponseModel response)? onError}) {
    ApiRequest(url: UrlConstants.logout, data: logoutRequest).postRequest(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        onSuccess!(data);
      },
      onError: (error) {
        print(error);
      },
    );
  }
}
