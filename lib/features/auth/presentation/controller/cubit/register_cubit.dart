import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_services_app/core/errors/app_exception.dart';
import 'package:home_services_app/core/helpers/shared_prefs_helper.dart';
import 'package:home_services_app/features/auth/domain/entities/user_entity.dart';
import 'package:home_services_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:home_services_app/features/auth/presentation/controller/states/register_states.dart';


class RegisterCubit extends Cubit <RegisterState>{
  RegisterCubit(this.registerUseCase) : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);
  final RegisterUseCase registerUseCase;
  bool showPassword = true ;

  Future<void> registerUser(String email , String name ,String password) async{
    emit(RegisterLoading());
    try{
      final user = UserEntity(email: email, name: name);
      final registeredUser = await registerUseCase(user, password);
      if (registeredUser.uid != null) {
        await CacheHelper.putData(key: 'userId', value: registeredUser.uid);
      } else {
        throw Exception();
      }
      emit(RegisterSuccess());
    }catch (e) {
      emit(RegisterFailure(e is AppException ? e.message : e.toString()));
      print(e.toString());
    }
  }
  void changeSuffixIcon() {
    showPassword = !showPassword;
    emit(ChangePasswordIcon());
  }
}