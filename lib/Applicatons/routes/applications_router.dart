import 'package:jarvis/Applicatons/controllers/applications_create_controller.dart';
import 'package:jarvis/jarvis.dart';

Router applicationsRouter(Router router){
  const String baseUrl = '/applications';
  router
    .route('$baseUrl/create')
    .link(()=> ApplicationsCreateController());

  return router;
}