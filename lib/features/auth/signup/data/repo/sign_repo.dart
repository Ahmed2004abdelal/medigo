import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import '../../../../../core/network/auth/supabase_auth_services.dart';
import '../../../../../core/network/failure.dart';
import '../model/signup_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SignUpRepo {
  Future<Either<Failure, User>> signUp({
    required String email,
    required String password,
    // required String? phone,
    required SignupModel metadata,
  });
}

class SignUpRepoImpl implements SignUpRepo {
  final SupabaseAuthServices _authServices;

  SignUpRepoImpl(this._authServices);

  @override
Future<Either<Failure, User>> signUp({
  required String email,
  required String password,
  // required String? phone,
  required SignupModel metadata,
}) async {
  try {
    final result = await _authServices.signUpWithEmailAndPassword(
      email,
      password,
      // phone,
      metadata.toJson(),
    );

    return result.fold(
      (failure) => Left(failure),
      (user) {
        debugPrint('User signed up: ${user.email}');
        return Right(user);
      },
    );
  } on Exception catch (e) {
    return Left(ServerFailure(e.toString()));
  } catch (e) {
    return Left(ServerFailure('An unexpected error occurred.'));
  }
}
}