import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_services_app/features/auth/domain/entities/user_entity.dart';
import 'package:home_services_app/features/auth/domain/usecases/register_useCase.dart';
import 'package:home_services_app/features/auth/presentation/controller/register_states.dart';


class RegisterCubit extends Cubit <RegisterStates>{
  RegisterCubit(this.registerUseCase) : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);
  final RegisterUseCase registerUseCase;

  Future<void> registerUser(String email , String name ,String password) async{
    emit(RegisterLoading());
    try{
      final user = UserEntity(email: email, name: name);
      await registerUseCase (user , password);
      emit(RegisterSuccess());
    }catch (e) {
      emit(RegisterFailure(e.toString()));
    }
  }
}