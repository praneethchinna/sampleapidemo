import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:sampleapidemo/category/api/category_response.dart';
import 'package:sampleapidemo/headlines/bloc/headlines_usecase.dart';


import 'package:sampleapidemo/testapplication_locator.dart';

class CategoryService
    extends EitherService<JsonRequestModel, CategoryResponseModel> {
  CategoryService()
      : super(
            method: RestMethod.get,
            restApi: TestApplicationLocator().api,
            path:
                '${'v2/top-headlines?country=in&category='}${HeadlinesUseCase.category}${'&apiKey=0af3d7704b9140f5bad702b6183a6e0d'}');

  @override
  CategoryResponseModel parseResponse(Map<String, dynamic> jsonResponse) {
    return CategoryResponseModel.fromJson(jsonResponse);
  }
}

// '${'v2/top-headlines?country=in&category='}${HomeUseCase.catogery}${'&apiKey=0af3d7704b9140f5bad702b6183a6e0d'}');
