import 'package:clean_framework/clean_framework.dart';

class CategoryViewModel extends ViewModel {
  final String status;
  final int totalResults;
  final List<ArticlesViewModel> articlesViewModel;

  CategoryViewModel({
    required this.status,
    required this.totalResults,
    required this.articlesViewModel,
  });

  @override

  List<Object?> get props => [status, totalResults, articlesViewModel];
}

class ArticlesViewModel extends ViewModel {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;

  ArticlesViewModel({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
  });

  @override

  List<Object?> get props => [author, title, description,url,urlToImage];
}
