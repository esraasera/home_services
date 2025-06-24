import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_services_app/features/service_request/domain/entities/service_request_entity.dart';
import 'package:home_services_app/features/service_request/domain/usecases/service_request_usecase.dart';
import 'package:home_services_app/features/service_request/presentation/controller/states/service_request_state.dart';

class ServiceRequestCubit extends Cubit<ServiceRequestState> {
  ServiceRequestCubit(this.serviceRequestUseCase) : super(ServiceRequestInitial());

  static ServiceRequestCubit get(context) => BlocProvider.of(context);

  String? name, phone, address, serviceName, paymentMethod;
  String? servicePrice;
  String? selectedServiceTitle;
  String? selectedServicePrice;
  String? selectedMethod;
  final ServiceRequestUseCase serviceRequestUseCase;


  void setUserData(
      {required String name, required String phone, required String address}) {
    this.name = name;
    this.phone = phone;
    this.address = address;
  }

  void setServiceData({required String name, required String price}) {
    serviceName = name;
    servicePrice = price;
    emit(SelectedService());
  }

  void selectMethod(String method) {
    selectedMethod = method;
    emit(SelectedMethod());
  }


  void setPaymentMethod(String method) {
    paymentMethod = method;
  }

  void isSelectedService({required String name}) {
    selectedServiceTitle = name;
    emit(SelectedService());
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

      await serviceRequestUseCase(request);

      emit(ServiceRequestSuccess());
    } catch (e) {
      emit(ServiceRequestFailure(e.toString()));
    }
  }
}

