import 'package:api_test/bloc/bloc_events.dart';
import 'package:api_test/bloc/bloc_states.dart';
import 'package:api_test/repository/auth_repository.dart';
import 'package:bloc/bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final accessToken = await authRepository.login(event.user);
        emit(AuthSuccess(accessToken));
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });

    on<SignupEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final accessToken = await authRepository.signup(event.user);
        emit(AuthSuccess(accessToken));
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });
  }
}
