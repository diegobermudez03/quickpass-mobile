
import 'package:get_it/get_it.dart';
import 'package:mobile_app/features/current/presentation/state/current_bloc.dart';
import 'package:mobile_app/features/login/domain/use_cases/login_use_case.dart';
import 'package:mobile_app/features/login/domain/use_cases/submit_code_use_case.dart';
import 'package:mobile_app/features/login/presentation/state/login_bloc.dart';
import 'package:mobile_app/features/login/presentation/state/submit_code_bloc.dart';

final inst = GetIt.instance;
const uri = "localhost:3000";

Future<void> initLoginDependencies() async{

  //USE CASES
  inst.registerLazySingleton<LoginUseCase>(()=>LoginUseCase());
  inst.registerLazySingleton<SubmitCodeUseCase>(()=>SubmitCodeUseCase());

  //BLOC
  inst.registerFactory<LoginBloc>(()=> LoginBloc(
    inst.get<LoginUseCase>()
  ));
  inst.registerFactory<SubmitCodeBloc>(()=> SubmitCodeBloc(
    inst.get<SubmitCodeUseCase>()
  ));
}

Future<void> initAllDependencies(String token) async{

  //  CURRENT PAGE

  //bloc
  inst.registerFactory<CurrentBloc>(()=>CurrentBloc());
}