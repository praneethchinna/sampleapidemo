import 'package:clean_framework/clean_framework.dart';
import 'package:sampleapidemo/headlines/api/headlines_service.dart';
import 'package:sampleapidemo/headlines/model/headlines_viewmodel.dart';



class HeadlinesUseCase extends UseCase {
  static String? category;

  final Function(dynamic) loginViewModelCallBack;

  HeadlinesUseCase(
      {required this.loginViewModelCallBack, HeadlinesService? loginService});

  void _sendLoginViewModel(
      {bool requestSubmitted = false, bool hasError = false}) {
    loginViewModelCallBack(HeadlinesViewModel(
        requestSubmitted: requestSubmitted,
        hasError: hasError,
        email: '',
        password: ''));
  }

  void getLoginDetails() {
    _sendLoginViewModel();
  }

  void updateCategoryValue(String value) {
    category = value;
  }
}
