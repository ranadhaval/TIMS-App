import 'package:tims/pages/Training_Matrix_Screen/model/Request/MatrixListRequest.dart';
import 'package:tims/webservices/api_request.dart';
import 'package:tims/webservices/response_model.dart';
import 'package:tims/webservices/url_constants.dart';

class MatrixListProvider {
  void matrixListProvider(
      {MatrixListRequest? matrixListRequest,
      Function()? beforeSend,
      Function(ResponseModel response)? onSuccess,
      Function(ResponseModel response)? onError}) {
    ApiRequest(url: UrlConstants.matrixList, data: matrixListRequest)
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
}
