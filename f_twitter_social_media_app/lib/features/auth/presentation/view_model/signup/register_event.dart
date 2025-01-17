part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class LoadCoursesAndBatches extends RegisterEvent {


}

final class RegisterStudent extends RegisterEvent {
  final String firstName;
  final String lastName;
  final String phone;
  final String username;
  final String password;
  final String batchId;
  final List<String> courseIds;

  const RegisterStudent({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.username,
    required this.password,
    required this.batchId,
    required this.courseIds,
  });

  @override
  List<Object> get props => [firstName, lastName, phone, username, password, batchId, courseIds];
}

