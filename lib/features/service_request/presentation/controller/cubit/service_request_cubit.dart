import 'package:easy_localization/easy_localization.dart';
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
  double? servicePriceValue;
  String? selectedServiceTitle;
  String? selectedServicePrice;
  String? selectedMethod;
  final ServiceRequestUseCase serviceRequestUseCase;

  String get translatedServiceName => serviceName?.tr() ?? '';
  String get translatedServicePrice => servicePrice?.tr() ?? '';



  void setUserData(
      {required String name, required String phone, required String address}) {
    this.name = name;
    this.phone = phone;
    this.address = address;
  }


  void setServiceData({required String titleKey, required String priceKey, required double priceValue}) {
    serviceName = titleKey;
    servicePrice = priceKey;
    servicePriceValue = priceValue;
    emit(SelectedService());
  }


  void selectMethod(String method) {
    selectedMethod = method;
    emit(SelectedMethod());
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
        paymentMethod: selectedMethod!,
      );

      await serviceRequestUseCase(request);

      emit(ServiceRequestSuccess());
    } catch (e) {
      emit(ServiceRequestFailure(e.toString()));
    }
  }
}

