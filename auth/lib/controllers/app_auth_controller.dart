//отвечает за авторизацию, контроллер
import 'package:auth/models/respons_model.dart';
import 'package:conduit_core/conduit_core.dart';

class AppAuthController extends ResourceController {
  final ManagedContext managedContext;

  AppAuthController(this.managedContext);

  //авторизация
  @Operation.post()
  Future<Response> signIn() async {
    return Response.ok(
      ResponsModel(
        data: {
          "id": "1",
          "refreshToken": "refreshToken",
          "accessToken": "accessToken",
        },
        message: "signIn ok",
      ).toJson(),
    );
  }

  //регистрация
  @Operation.put()
  Future<Response> signUp() async {
    return Response.ok(
      ResponsModel(
        data: {
          "id": "1",
          "refreshToken": "refreshToken",
          "accessToken": "accessToken",
        },
        message: "signUp ok",
      ).toJson(),
    );
  }

  @Operation.post("refresh")
  Future<Response> refreshToken() async {
    return Response.unauthorized(
      body: ResponsModel(error: "token is not valid").toJson(),
    );
  }
}
