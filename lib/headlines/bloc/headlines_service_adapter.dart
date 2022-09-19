import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:sampleapidemo/headlines/api/headlines_response.dart';
import 'package:sampleapidemo/headlines/api/headlines_service.dart';
import 'package:sampleapidemo/headlines/model/headlines_entities.dart';


class HeadlinesServiceAdapter extends ServiceAdapter<HeadlinesEntity,
    JsonRequestModel, HeadlinesResponse, HeadlinesService> {
  HeadlinesServiceAdapter(super.service);

  @override
  HeadlinesEntity createEntity(
      HeadlinesEntity initialEntity, HeadlinesResponse responseModel) {
    throw UnimplementedError();
  }
}
