import '../../../../base/model/base_network_model.dart';
import '../interface/error_model_interface.dart';
import '../interface/response_model_interface.dart';

class ResponseModel<T, E extends INetworkModel<E>>
    extends IResponseModel<T, E> {
  @override
  final T? data;

  @override
  final IErrorModel<E>? error;

  ResponseModel({this.data, this.error});
}
