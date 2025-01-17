import 'package:dartz/dartz.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:softwarica_student_management_bloc/core/error/failure.dart';
import 'package:softwarica_student_management_bloc/features/auth/data/data_source/local_datasource/auth_local_data_source.dart';
import 'package:softwarica_student_management_bloc/features/auth/data/model/auth_hive_model.dart';
import 'package:softwarica_student_management_bloc/features/auth/domain/entity/auth_entity.dart';
import 'package:softwarica_student_management_bloc/features/auth/domain/repository/auth_repository.dart';

class AuthLocalRepository implements IAuthRepository {
  final AuthLocalDataSource authLocalDataSource;

  AuthLocalRepository(this.authLocalDataSource);

  @override
  Future<Either<Failure, void>> createStudent(AuthEntity entity) {
    try {
      authLocalDataSource.createStudent(entity);
      return Future.value(Right(null));
    } catch (e) {
      return Future.value(Left(LocalDatabaseFailure(message: 'e')));
    }
  }

  Future<void> printAllStudents() async {
    try {
      final box = await Hive.openBox<AuthHiveModel>('student');

      for (var i = 0; i < box.length; i++) {
        final student = box.getAt(i);
        print('\nStudent ${i + 1}:');
        print('Name: ${student?.fname} ${student?.lname}');
        print('Username: ${student?.username}');
        print('Phone: ${student?.phoneNo}');
        print('Batch: ${student?.batch.batchName}');
        print('Courses: ${student?.courses}');
      }
    } catch (e) {
      print('Error viewing students: $e');
    }
  }
}
