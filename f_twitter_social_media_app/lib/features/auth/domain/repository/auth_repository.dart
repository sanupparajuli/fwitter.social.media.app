import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:f_twitter_social_media_app/core/error/failure.dart';
import 'package:f_twitter_social_media_app/features/auth/domain/entity/auth_entity.dart';

abstract interface class IAuthRepository {
  Future<Either<Failure, void>> registerCustomer(AuthEntity customer);

  Future<Either<Failure, String>> loginCustomer(String email, String password);

  Future<Either<Failure, String>> uploadProfilePicture(File file);

  Future<Either<Failure, AuthEntity>> getCurrentUser();
}
