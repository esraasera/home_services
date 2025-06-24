import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_services_app/features/service_request/presentation/controller/states/service_request_state.dart';

class ServiceRequestCubit extends Cubit<ServiceRequestState>{
  ServiceRequestCubit() : super(ServiceRequestInitial());
  static ServiceRequestCubit get(context) => BlocProvider.of(context);


}