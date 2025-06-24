import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:home_services_app/features/service_request/data/models/service_request_model.dart';

abstract class ServiceRequestDataSource {
  Future<void> submitRequest(ServiceRequestModel model);
}

class ServiceRequestDataSourceImpl implements ServiceRequestDataSource {

  @override
  Future<void> submitRequest(ServiceRequestModel model)async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(model.userId)
        .collection('request')
        .add(model.toMap());
  }
  }