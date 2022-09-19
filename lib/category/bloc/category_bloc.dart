import 'package:clean_framework/clean_framework.dart';
import 'package:sampleapidemo/category/bloc/category_usecase.dart';
import 'package:sampleapidemo/category/model/view_models/category_viewmodel.dart';

class CategoryBloc extends Bloc {
  late final CategoryUseCase _useCase;
  final categoryViewModelPipe = Pipe<CategoryViewModel>();
  final initializeNewsEvent = EventPipe();

  CategoryBloc() {
    _useCase = CategoryUseCase((viewModel) {
      categoryViewModelPipe.send(viewModel);
    });
    initializeNewsEvent.listen(_initializeNewsEventListener);
  }

  @override
  void dispose() {
    categoryViewModelPipe.dispose();
    initializeNewsEvent.dispose();
  }

  void _initializeNewsEventListener() {
    _useCase.initializeNewsEvent();
  }
}
