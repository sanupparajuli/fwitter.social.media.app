import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:softwarica_student_management_bloc/app/usecase/usecase.dart';
import 'package:softwarica_student_management_bloc/core/error/failure.dart';
import 'package:softwarica_student_management_bloc/features/auth/domain/entity/auth_entity.dart';
import 'package:softwarica_student_management_bloc/features/auth/domain/repository/auth_repository.dart';
import 'package:softwarica_student_management_bloc/features/batch/domain/entity/batch_entity.dart';
import 'package:softwarica_student_management_bloc/features/course/domain/entity/course_entity.dart';

class CreateStudentsParams extends Equatable {
  final String? authId;
  final String fName;
  final String lName;
  final String phoneNo;
  final BatchEntity batch;
  final List<CourseEntity> courses;
  final String username;
  final String password;

  const CreateStudentsParams({
    this.authId,
    required this.fName,
    required this.lName,
    required this.phoneNo,
    required this.batch,
    required this.courses,
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [
        authId,
        fName,
        lName,
        phoneNo,
        batch,
        courses,
        username,
        password,
      ];
}

class CreateStudentUsecase
    implements UsecaseWithParams<void, CreateStudentsParams> {
  final IAuthRepository repository;

  CreateStudentUsecase(this.repository);

  @override
  Future<Either<Failure, Either<Failure, void>>> call(
      CreateStudentsParams params) async {
    try {
      final studentEntity = AuthEntity(
          authId: params.authId,
          fName: params.fName,
          lName: params.lName,
          password: params.password,
          phoneNo: params.phoneNo,
          batchEntity: params.batch,
          username: params.username,
          courses: params.courses);

      final result = await repository.createStudent(studentEntity);
      return Right(result);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
