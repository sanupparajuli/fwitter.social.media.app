import 'package:equatable/equatable.dart';
import 'package:softwarica_student_management_bloc/features/batch/domain/entity/batch_entity.dart';
import 'package:softwarica_student_management_bloc/features/course/domain/entity/course_entity.dart';

class AuthEntity extends Equatable {
  final String? authId;
  final String fName;
  final String lName;
  final String phoneNo;
  final BatchEntity batchEntity;
  final List<CourseEntity> courses; // Changed to List
  final String username;
  final String password;

  const AuthEntity({
    this.authId,
    required this.fName,
    required this.lName,
    required this.password,
    required this.phoneNo,
    required this.batchEntity,
    required this.username,
    required this.courses,
  });

  @override
  List<Object?> get props =>
      [authId, fName, lName, phoneNo, batchEntity, courses, username, password];
}
