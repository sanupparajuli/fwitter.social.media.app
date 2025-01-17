import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:softwarica_student_management_bloc/features/auth/data/repository/auth_local_repository.dart';
import 'package:softwarica_student_management_bloc/features/auth/domain/use_case/create_student_usecase.dart';
import 'package:softwarica_student_management_bloc/features/batch/presentation/view_model/batch_bloc.dart';
import 'package:softwarica_student_management_bloc/features/course/presentation/view_model/course_bloc.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {


  final BatchBloc _batchBloc;
  final CourseBloc _courseBloc;
  final CreateStudentUsecase _createStudentUsecase;

RegisterBloc({
    required BatchBloc batchBloc,
    required CourseBloc courseBloc,
    required CreateStudentUsecase createStudentUsecase,
  })  : _batchBloc = batchBloc,
        _courseBloc = courseBloc,
        _createStudentUsecase = createStudentUsecase,
        super(RegisterState.initial()) {
    on<LoadCoursesAndBatches>(_onLoadCoursesAndBatches);
    on<RegisterStudent>(_onRegisterStudent);
    add(LoadCoursesAndBatches());
  }


  Future<void> _onLoadCoursesAndBatches(
    LoadCoursesAndBatches event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    _batchBloc.add(LoadBatches());
    _courseBloc.add(LoadCoursees());
    emit(state.copyWith(isLoading: false));
  }

  Future<void> _onRegisterStudent(
    RegisterStudent event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    try {
      // Get the batch entity from BatchBloc state
      final batchState = _batchBloc.state;
      final batch = batchState.batches.firstWhere(
        (batch) => batch.batchId == event.batchId,
        orElse: () => throw Exception('Batch not found'),
      );

      // Get the course entities from CourseBloc state
      final courseState = _courseBloc.state;
      final courses = courseState.Coursees
          .where((course) => event.courseIds.contains(course.courseId))
          .toList();

      if (courses.isEmpty) {
        throw Exception('No courses found');
      }

      final result = await _createStudentUsecase.call(
        CreateStudentsParams(
          fName: event.firstName,
          lName: event.lastName,
          phoneNo: event.phone,
          username: event.username,
          password: event.password,
          batch: batch,  // Now passing BatchEntity
          courses: courses,  // Now passing List<CourseEntity>
        ),
      );

      result.fold(
      (failure) {
        print('\nRegistration failed:');
        print('Error: ${failure.toString()}');
        emit(state.copyWith(isLoading: false,));
      },
      (success) {
        print('\nRegistration successful');
        emit(state.copyWith(isLoading: false,));
        // Print all students after successful registration
        if (_createStudentUsecase.repository is AuthLocalRepository) {
          (_createStudentUsecase.repository as AuthLocalRepository).printAllStudents();
        }
      },
    );

    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
      ));
    }
  }
}
