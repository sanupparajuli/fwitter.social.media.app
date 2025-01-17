// //esma table create update delete haru CRUD ko queries hunxa

// //import 'package:hive_flutter/adapters.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:softwarica_student_management_bloc/app/constants/hive_table_constant.dart';
// import 'package:softwarica_student_management_bloc/features/auth/data/model/auth_hive_model.dart';
// import 'package:softwarica_student_management_bloc/features/batch/data/model/batch_hive_model.dart';
// import 'package:softwarica_student_management_bloc/features/course/data/model/course_hive_model.dart';

// class HiveService {
//   Future<void> init() async {
//     var directory = await getApplicationDocumentsDirectory();
//     var path = '${directory.path}softwarica_student_management.db';

//     Hive.init(path);

//     Hive.registerAdapter(CourseHiveModelAdapter());
//     Hive.registerAdapter(BatchHiveModelAdapter());
//   }

//   // Batch Queries
//   Future<void> addBatch(BatchHiveModel batch) async {
//     var box = await Hive.openBox<BatchHiveModel>(HiveTableConstant.batchBox);
//     await box.put(batch.batchId, batch);
//   }

//   Future<void> deleteBatch(String id) async {
//     var box = await Hive.openBox<BatchHiveModel>(HiveTableConstant.batchBox);
//     await box.delete(id);
//   }

//   Future<List<BatchHiveModel>> getAllBatches() async {
//     var box = await Hive.openBox<BatchHiveModel>(HiveTableConstant.batchBox);
//     var batches = box.values.toList();
//     return batches;
//   }

// // Course Queries
//   Future<void> addCourse(CourseHiveModel course) async {
//     var box = await Hive.openBox<CourseHiveModel>(HiveTableConstant.courseBox);
//     await box.put(course.courseId, course);
//   }

//   Future<void> deleteCourse(String id) async {
//     var box = await Hive.openBox<CourseHiveModel>(HiveTableConstant.courseBox);
//     await box.delete(id);
//   }

//   Future<List<CourseHiveModel>> getAllCourses() async {
//     var box = await Hive.openBox<CourseHiveModel>(HiveTableConstant.courseBox);
//     var courses = box.values.toList();
//     return courses;
//   }

// // Student Queries
//   Future<void> addStudent(AuthHiveModel model) async {
//     var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.student);
//     await box.put(model.userId, model);
//   }

//   Future<void> deleteStudent() async {}

//   Future<List<AuthHiveModel>> getAllStudents() async {
//     var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.student);
//     var students = box.values.toList();
//     return students;
//   }

//   Future<void> loginStudent(String username, String password) async {}

//   // auth Queries
//   // Future<void> addAuth(AuthHiveModel auth) async {
//   //   var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.studentBox);
//   //   await box.put(auth.userId, auth);

//   // }

//   // Future<void> deleteAuth(String id) async {
//   //   var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.studentBox);
//   //   await box.delete(id);
//   // }

//   // Future<List<AuthHiveModel>> getAllAuth() async {
//   //   var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.studentBox);
//   //   return box.values.toList();
//   // }

//   // Future<AuthHiveModel?> login(String username, String password) async {
//   //   var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.batchBox);
//   //   var auth = box.values.firstWhere(
//   //     (element)=>element.username == username&& element.password == password,
//   //     orElse: () => AuthHiveModel.initial(),
//   //   );
//   //   return auth;

//   // }
// }
