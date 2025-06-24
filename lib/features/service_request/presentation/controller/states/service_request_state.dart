abstract class ServiceRequestState {}

class ServiceRequestInitial extends ServiceRequestState {}

class ServiceRequestLoading extends ServiceRequestState {}

class ServiceRequestSuccess extends ServiceRequestState {}

class ServiceRequestFailure extends ServiceRequestState {
  final String error;

  ServiceRequestFailure(this.error);
}
