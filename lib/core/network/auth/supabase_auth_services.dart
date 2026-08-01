import 'package:dartz/dartz.dart';
import '../failure.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SupabaseAuthServices {
  User? getCurrentUser();
  String? getCurrentUid();
  bool isLoggedIn();
  Stream<AuthState> authStateChanges();

  Future<Either<Failure, User>> signUpWithEmailAndPassword(
    String email,
    String password,
    // String? phone,
    Map<String, dynamic>? metadata,
  );
  Future<Either<Failure, User>> signInWithEmailAndPassword(
    String email,
    String password,
  );
  Future<Either<Failure, Unit>> signOut();
  Future<Either<Failure, Unit>> resetPassword(String email);
  Future<Either<Failure, User>> updatePassword(String newPassword);
  Future<Either<Failure, User>> updateEmail(String newEmail);
  Future<Either<Failure, Unit>> deleteAccount();
}

class SupabaseAuthServicesImpl implements SupabaseAuthServices {
  final GoTrueClient _supabaseClient;
  final FunctionsClient _functionsClient;

  SupabaseAuthServicesImpl( SupabaseClient supabaseClient)
    : _supabaseClient = supabaseClient.auth,
      _functionsClient = supabaseClient.functions;

  @override
  User? getCurrentUser() {
    return _supabaseClient.currentUser;
  }

  @override
  String? getCurrentUid() {
    return _supabaseClient.currentUser?.id;
  }

  @override
  bool isLoggedIn() {
    return _supabaseClient.currentSession != null;
  }

  @override
  Stream<AuthState> authStateChanges() {
    return _supabaseClient.onAuthStateChange;
  }

  @override
  Future<Either<Failure, User>> signUpWithEmailAndPassword(
    String email,
    String password,
    // String? phone,
    Map<String, dynamic>? metadata,
  ) async {
    try {
      final res = await _supabaseClient.signUp(
        email: email,
        password: password,
        // phone: phone,
        data: metadata,
      );

      if (res.user == null) {
        return const Left(AuthFailure('failed to sign up'));
      }
      return Right(res.user!);
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final res = await _supabaseClient.signInWithPassword(
        email: email,
        password: password,
      );

      if (res.user == null) {
        return const Left(AuthFailure('failed to login'));
      }
      return Right(res.user!);
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> signOut() async {
    try {
      await _supabaseClient.signOut();
      return const Right(unit);
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> resetPassword(String email) async {
    try {
      await _supabaseClient.resetPasswordForEmail(email);
      return const Right(unit);
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> updateEmail(String newEmail) async {
    try {
      final res = await _supabaseClient.updateUser(
        UserAttributes(email: newEmail),
      );

      if (res.user == null) {
        return const Left(AuthFailure('failed to update email'));
      }
      return Right(res.user!);
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> updatePassword(String newPassword) async {
    try {
      final res = await _supabaseClient.updateUser(
        UserAttributes(password: newPassword),
      );

      if (res.user == null) {
        return const Left(AuthFailure('failed to update password'));
      }
      return Right(res.user!);
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteAccount() async {
    try {
      await _functionsClient.invoke('delete-account');
      return const Right(unit);
    } catch (e) {
      return Left(ServerFailure('Failed to delete account: $e'));
    }
  }
}
