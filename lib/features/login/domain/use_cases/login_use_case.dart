import 'package:dartz/dartz.dart';
import 'package:mobile_app/core/failures.dart';
import 'package:mobile_app/core/use_case.dart';
import 'package:mobile_app/features/login/domain/repositories/login_repo.dart';

class LoginUseCase implements UseCase<bool, Tuple3> {
  final LoginRepo repo;

  LoginUseCase(this.repo);

  @override
  Future<Either<Failure, bool>> call(Tuple3 param) async {
    return repo.login(param);
  }
}
