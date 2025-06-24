import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_services_app/features/service_request/domain/entities/service_request_entity.dart';
import 'package:home_services_app/features/service_request/domain/usecases/service_request_usecase.dart';
import 'package:home_services_app/features/service_request/presentation/controller/states/service_request_state.dart';

class ServiceRequestCubit extends Cubit<ServiceRequestState> {
  ServiceRequestCubit() : super(ServiceRequestInitial());

  static ServiceRequestCubit get(context) => BlocProvider.of(context);

  String? name, phone, address, serviceName, paymentMethod;
  double? servicePrice;


  void setUserData(
      {required String name, required String phone, required String address}) {
    this.name = name;
    this.phone = phone;
    this.address = address;
  }

  void setServiceData({required String name, required double price}) {
    serviceName = name;
    servicePrice = price;
  }
  void setPaymentMethod(String method) {
    paymentMethod = method;
  }

  Future<void> submitRequest() async {
    emit(ServiceRequestLoading());

    try {
      final userId = FirebaseAuth.instance.currentUser?.uid ?? '';

      final request = ServiceRequestEntity(
        userId: userId,
        name: name!,
        phone: phone!,
        address: address!,
        serviceName: serviceName!,
        servicePrice: servicePrice!,
        paymentMethod: paymentMethod!,
      );

      await ServiceRequestUseCase(request);

      emit(ServiceRequestSuccess());
    } catch (e) {
      emit(ServiceRequestFailure(e.toString()));
    }
  }
}

}