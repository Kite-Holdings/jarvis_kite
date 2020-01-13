import 'package:aqueduct/aqueduct.dart';
import 'package:jarvis/Applicatons/models/applications_model.dart';
import 'package:jarvis/Applicatons/serialezers/application_create_serializer.dart';

class ApplicationsCreateController extends ResourceController{
  @Operation.post()
  Future<Response> create(@Bind.body(require: ['name']) ApplicationCreateSerializer applicationCreateSerializer)async{
    final ApplicationsModel applicationsModel = ApplicationsModel(
      name: applicationCreateSerializer.name
    );

    // save application
    final Map<String, dynamic> _dbRes = await applicationsModel.save();
    if(_dbRes['status'] == 0){
      return Response.ok({
        'message': "Application created successfully",
        'name': applicationCreateSerializer.name,
        'consumerKey': applicationsModel.consumerKey,
        'consumerSecret': applicationsModel.consumerSecret,
      });
    } else {
      return Response.serverError(
        body: {
          'error': 'Server Error!'
        }
      );
    }
  }
}