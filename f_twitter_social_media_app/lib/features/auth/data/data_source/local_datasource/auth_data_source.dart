import 'package:softwarica_student_management_bloc/core/network/hive_service.dart';
import 'package:softwarica_student_management_bloc/features/auth/data/data_source/auth_data_source.dart';
import 'package:softwarica_student_management_bloc/features/auth/data/model/auth_hive_model.dart';
import 'package:softwarica_student_management_bloc/features/auth/domain/entity/auth_entity.dart';

class AuthLocalDataSource implements IAuthDataSource {
  final HiveService hiveService;

  AuthLocalDataSource({required this.hiveService});
  @override
  Future<void> createStudent(AuthEntity entity) async {
    try {
      var studentModel = AuthHiveModel.fromEntity(entity);
      await hiveService.addStudent(studentModel);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<AuthEntity>> getAllStudents() {
    try{
      // await _hiveService.getAllBatches();
      return hiveService.getAllStudents().then(
        (value){
          return value.map((e)=>e.toEntity()).toList();
        }
      );
    }
    catch(e){ 
      throw Exception(e);
    }
}
}
