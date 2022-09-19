import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:sampleapidemo/category/api/category_response.dart';
import 'package:sampleapidemo/category/api/category_service.dart';
import 'package:sampleapidemo/category/model/entitys/category_entity.dart';


class CategoryServiceAdapter extends ServiceAdapter<CategoryEntity, JsonRequestModel,
    CategoryResponseModel, CategoryService> {
  CategoryServiceAdapter() : super(CategoryService());

  @override
  CategoryEntity createEntity(
      CategoryEntity initialEntity, CategoryResponseModel responseModel) {
    
    return initialEntity.merge(
        status: responseModel.status,
        totalResults: responseModel.totalResults,
        articlesEntity: responseModel.articles
            .map((e) => ArticlesEntity(
                author: e.author,
                title: e.title,
                description: e.description,
                url: e.url,
                urlToImage: e.urlToImage))
            .toList());
  }
}
