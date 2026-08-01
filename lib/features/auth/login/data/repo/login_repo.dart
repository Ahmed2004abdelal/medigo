import 'package:dartz/dartz.dart';
import '../../../../../core/network/auth/supabase_auth_services.dart';
import '../../../../../core/network/failure.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class LoginRepo {
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  });
}

class LoginRepoImpl implements LoginRepo {
  final SupabaseAuthServices _authServices;

  LoginRepoImpl(this._authServices);

  @override
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _authServices.signInWithEmailAndPassword(
        email,
        password,
      );

      return result.fold((failure) => Left(failure), (user) => Right(user));
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      return Left(ServerFailure('An unexpected error occurred.'));
    }
  }
}
