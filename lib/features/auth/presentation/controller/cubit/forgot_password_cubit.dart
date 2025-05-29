import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_services_app/core/errors/app_exception.dart';
import 'package:home_services_app/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:home_services_app/features/auth/presentation/controller/states/forgot_password_states.dart';

class ForgotPasswordCubit extends Cubit <ForgotPasswordState>{
ForgotPasswordCubit(this.forgotPasswordUseCase) : super(ForgotPasswordInitial());
static ForgotPasswordCubit get(context) => BlocProvider.of(context);
final ForgotPasswordUseCase forgotPasswordUseCase;

 Future<void>resetPassword(String email)async {
   emit(ForgotPasswordLoading());
   try{
     await forgotPasswordUseCase(email);
     emit(ForgotPasswordSuccess());
   }catch (e) {
     emit(ForgotPasswordFailure(e is AppException ? e.message : e.toString()));
   }
 }
}