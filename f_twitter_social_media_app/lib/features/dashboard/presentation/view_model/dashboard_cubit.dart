import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moments/app/shared_prefs/shared_prefs.dart';
import 'package:moments/features/dashboard/presentation/view_model/dashboard_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final SharedPrefs sharedPreferences;
  DashboardCubit(this.sharedPreferences) : super(DashboardState.initial());

  void onTabTapped(int index) {
    emit(state.copyWith(selectedIndex: index));
  }

  // Handle logout
  void logout(BuildContext context) async {
    await sharedPreferences.clearToken(); // Clear the stored token

    // Wait for 2 seconds
    // Future.delayed(const Duration(seconds: 2), () async {
    //   if (context.mounted) {
    //     Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => BlocProvider.value(
    //           value: getIt<LoginBloc>(),
    //           child: LoginView(),
    //         ),
    //       ),
    //     );
    //   }
    // });
  }
}
