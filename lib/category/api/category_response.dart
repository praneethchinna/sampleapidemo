import 'package:clean_framework/clean_framework_defaults.dart';

class CategoryResponseModel extends JsonResponseModel {
  final String status;
  final int totalResults;
  final List<Articles> articles;



  CategoryResponseModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] ?? '',
        totalResults = json['totalResults'] ?? 0,
        articles = (json['articles'] as List)
            .map((dynamic e) => Articles.fromJson(e as Map<String, dynamic>))
            .toList();

  @override

  List<Object?> get props => [status, totalResults, articles];
}

class Articles  extends JsonResponseModel{
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;



  Articles.fromJson(Map<String, dynamic> json)
      : author = json['author'] ??'',
        title = json['title'] ??'',
        description = json['description'] ??'',
        url = json['url'] ??'',
        urlToImage = json['urlToImage'] ??'';

  @override

  List<Object?> get props => [author, title, description, url, urlToImage];
}
