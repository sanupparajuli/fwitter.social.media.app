import 'package:softwarica_student_management_bloc/features/auth/domain/entity/auth_entity.dart';

abstract interface class IAuthDataSource{
  Future<void> createStudent(AuthEntity entity);
  Future<List<AuthEntity>>getAllStudents();
}