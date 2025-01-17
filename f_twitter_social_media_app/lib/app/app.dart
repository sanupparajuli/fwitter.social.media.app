import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:f_twitter_social_media_app/app/di/di.dart';
import 'package:f_twitter_social_media_app/core/theme/app_theme.dart';
import 'package:f_twitter_social_media_app/features/splash/presentation/view/splash_view.dart';
import 'package:f_twitter_social_media_app/features/splash/presentation/view_model/splash_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Social Media App',
      theme: AppTheme.getApplicationTheme(isDarkMode: false),
      home: BlocProvider.value(
        value: getIt<SplashCubit>(),
        child: SplashView(),
      ),
    );
  }
}
