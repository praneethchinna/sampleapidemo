import 'package:clean_framework/clean_framework.dart';

class CategoryEntity extends Entity {
  final String status;
  final int totalResults;
  final List<ArticlesEntity> articles;

  CategoryEntity({
    List<EntityFailure> errors = const [],
    this.status = '',
    this.totalResults = 0,
    List<ArticlesEntity>? articlesEntity,
  })  : articles = articlesEntity ?? [],
        super(errors: errors);

  @override
  List<Object> get props {
    return [errors, status, totalResults, articles];
  }

  @override
  CategoryEntity merge({
    List<EntityFailure>? errors,
    String? status,
    int? totalResults,
    List<ArticlesEntity>? articlesEntity,
  }) {
    return CategoryEntity(
        errors: errors ?? this.errors,
        status: status ?? this.status,
        totalResults: totalResults ?? this.totalResults,
        articlesEntity: articlesEntity ?? articles);
  }
}

class ArticlesEntity extends Entity {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;

  ArticlesEntity({
    List<EntityFailure> errors = const [],
    this.author = '',
    this.title = '',
    this.description = '',
    this.url = '',
    this.urlToImage = '',
  }) : super(errors: errors);

  @override
  List<Object> get props => [author, title, description, url, urlToImage];

  @override
  Entity merge(
      {List<EntityFailure>? errors,
      String? author,
      String? title,
      String? description,
      String? url,
      String? urlToImage}) {
    return ArticlesEntity(
        author: author ?? this.author,
        title: title ?? this.title,
        description: description ?? this.description,
        url: url ?? this.url,
        urlToImage: urlToImage ?? this.urlToImage);
  }
}
