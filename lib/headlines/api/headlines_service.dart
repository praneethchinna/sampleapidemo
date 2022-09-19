import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:sampleapidemo/headlines/api/headlines_response.dart';


import 'package:sampleapidemo/testapplication_locator.dart';

class HeadlinesService extends EitherService<JsonRequestModel,HeadlinesResponse>
{

  HeadlinesService():super(method: RestMethod.post,restApi: TestApplicationLocator().api,
  path: '');
  
  @override
  HeadlinesResponse parseResponse(Map<String, dynamic> jsonResponse) {
    return HeadlinesResponse.fromJson(jsonResponse);
  }

}