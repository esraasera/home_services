import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_services_app/core/errors/app_exception.dart';
import 'package:home_services_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:home_services_app/features/auth/presentation/controller/states/login_states.dart';


class LoginCubit extends Cubit <LoginStates>{
  LoginCubit(this.loginUseCase) : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);
  final LoginUseCase loginUseCase;

  Future<void> loginUser(String email ,String password) async{
    emit(LoginLoading());
    try{
     final user = await loginUseCase(email,password);
      emit(LoginSuccess(user.name));
    }catch (e) {
      emit(LoginFailure(e is AppException ? e.message : e.toString()));
    }
  }
}