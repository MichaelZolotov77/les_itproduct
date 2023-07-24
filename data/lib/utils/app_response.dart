import 'package:data/models/respons_model.dart';
import 'package:conduit_core/conduit_core.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';

class AppResponse extends Response {
  AppResponse.serverError(dynamic error, {String? message})
      : super.serverError(body: _getResponseModel(error, message));

  static ResponsModel _getResponseModel(error, String? message) {
    if (error is QueryException) {
      return ResponsModel(
          error: error.toString(), message: message ?? error.message);
    }

    if (error is JwtException) {
      return ResponsModel(
          error: error.toString(), message: message ?? error.message);
    }

    if (error is AuthorizationParserException) {
      return ResponsModel(
          error: error.toString(),
          message: message ?? "Ошибка парсера авторизации");
    }

    return ResponsModel(
        error: error.toString(), message: message ?? "Неизвестная ошибка");
  }

  AppResponse.ok({dynamic body, String? message})
      : super.ok(ResponsModel(data: body, message: message));

  AppResponse.badRequest({String? message})
      : super.badRequest(
            body: ResponsModel(message: message ?? "Ошибка запроса"));

  AppResponse.unauthorized(dynamic error, {String? message})
      : super.unauthorized(body: _getResponseModel(error, message));
}
