import 'package:movie_app/features/account/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel(
    super.id,
    super.name,
    super.email,
    super.created,
    super.updated,
  );

  factory UserModel.fromMapJson(Map<String, dynamic> jsobObject) {
    return UserModel(
      jsobObject['id'],
      jsobObject['name'],
      jsobObject['email'],
      jsobObject['created_at'],
      jsobObject['updated_at'],
    );
  }
}
