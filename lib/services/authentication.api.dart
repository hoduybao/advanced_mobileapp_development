
import 'package:advanced_mobileapp_development/model/user/token.dart';
import 'package:advanced_mobileapp_development/model/user/user.dart';
import 'package:advanced_mobileapp_development/services/api_service.dart';
import 'base_repository.dart';

class AuthRepository extends BaseRepository {
  static const String prefix = "auth/";

  AuthRepository() : super(prefix);

  Future<void> loginByAccount({
    required String email,
    required String password,
    required Function(UserModel,Token) onSuccess,
    required Function(String) onFail,
  }) async {
    final response = await service.post(url: 'login', data: {
      "email": email,
      "password": password,
    }) as BoundResource;

    switch (response.statusCode) {
      case 200:
      case 201:
        final user = UserModel.fromJson(response.response['user']);
        final token = Token.fromJson(response.response['tokens']);
        await onSuccess(user, token);
        break;
      default:
        onFail(response.errorMsg.toString());
        break;
    }
  }



}