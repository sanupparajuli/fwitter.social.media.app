import 'package:flutter/cupertino.dart';
import 'package:f_twitter_social_media_app/app/app.dart';
import 'package:f_twitter_social_media_app/app/di/di.dart';
import 'package:f_twitter_social_media_app/core/network/hive_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService().init();
  await initDependencies();
  runApp(
    App(),
  );
}
