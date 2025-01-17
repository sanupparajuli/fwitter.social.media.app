import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softwarica_student_management_bloc/app/di/di.dart';
import 'package:softwarica_student_management_bloc/features/batch/presentation/view/batch_view.dart';
import 'package:softwarica_student_management_bloc/features/batch/presentation/view_model/batch_bloc.dart';
import 'package:softwarica_student_management_bloc/features/course/presentation/view/course_view.dart';
import 'package:softwarica_student_management_bloc/features/course/presentation/view_model/course_bloc.dart';

class HomeState extends Equatable {
  final int selectedIndex;
  final List<Widget> views;

  const HomeState({
    required this.selectedIndex,
    required this.views,
  });

  // Initial state
  static HomeState initial() {
    return HomeState(
      selectedIndex: 0,
      views: [
        const Center(
          child: Text('Dashboard'),
        ),
       BlocProvider(
          create: (context) => getIt<CourseBloc>(),
          child: CourseView(),
        ),
        BlocProvider(
          create: (context) => getIt<BatchBloc>(),
          child: BatchView(),
        ),

     
        const Center(
          child: Text('Account'),
        ),
      ],
    );
  }

  HomeState copyWith({
    int? selectedIndex,
    List<Widget>? views,
  }) {
    return HomeState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      views: views ?? this.views,
    );
  }

  @override
  List<Object?> get props => [selectedIndex, views];
}
