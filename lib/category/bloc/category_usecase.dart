import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:sampleapidemo/category/bloc/category_service_adapter.dart';
import 'package:sampleapidemo/category/model/entitys/category_entity.dart';
import 'package:sampleapidemo/category/model/view_models/category_viewmodel.dart';

import 'package:sampleapidemo/testapplication_locator.dart';

class CategoryUseCase extends UseCase {
  final Function(dynamic) viewModelCallBack;
  CategoryUseCase(this.viewModelCallBack) {
    create();
  }

  Future<void> create() async {
    RepositoryScope? scope =
        TestApplicationLocator().repository.containsScope<CategoryEntity>();
    if (scope == null) {
      final rootEntity = CategoryEntity();
      scope = TestApplicationLocator()
          .repository
          .create<CategoryEntity>(rootEntity, (_) {}, deleteIfExists: true);
    }
  }

  CategoryViewModel getNewsViewModel(CategoryEntity newsEntity) {
    CategoryViewModel newsViewModel = CategoryViewModel(
        status: newsEntity.status,
        totalResults: newsEntity.totalResults,
        articlesViewModel: getArticlesViewModelList(newsEntity.articles));
    return newsViewModel;
  }

  List<ArticlesViewModel> getArticlesViewModelList(
      List<ArticlesEntity> newsEntity) {
    List<ArticlesViewModel> articlesViewModel = [];
    for (var counts in newsEntity) {
      articlesViewModel.add(ArticlesViewModel(
          author: counts.author,
          title: counts.title,
          description: counts.description,
          url: counts.url,
          urlToImage: counts.urlToImage));
    }
    return articlesViewModel;
  }

  void initializeNewsEvent() async {
    RepositoryScope? scope =
        TestApplicationLocator().repository.containsScope<CategoryEntity>()!;
    scope.subscription = _notifySubscribers;
    await TestApplicationLocator()
        .repository
        .runServiceAdapter(scope, CategoryServiceAdapter());
  }

  void _notifySubscribers(entity) {
    viewModelCallBack(buildViewModelForServiceUpdate(entity));
  }

  CategoryViewModel buildViewModelForServiceUpdate(CategoryEntity entity) {
    return CategoryViewModel(
        status: entity.status,
        totalResults: entity.totalResults,
        articlesViewModel: getArticlesViewModelList(entity.articles));
  }
}
