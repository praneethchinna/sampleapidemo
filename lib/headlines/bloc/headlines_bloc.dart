import 'package:clean_framework/clean_framework.dart';
import 'package:sampleapidemo/headlines/api/headlines_service.dart';
import 'package:sampleapidemo/headlines/bloc/headlines_usecase.dart';
import 'package:sampleapidemo/headlines/model/headlines_viewmodel.dart';



class HeadlinesBloc extends Bloc {
  Pipe<HeadlinesViewModel> responseLoginViewModelPipe = Pipe<HeadlinesViewModel>();
  EventPipe requestUserLoginViewModelEvent = EventPipe();

  late final HeadlinesUseCase _loginUseCase;
  Pipe updateCategoryData = Pipe();

  HeadlinesBloc({HeadlinesService? loginService}) {
    _loginUseCase = HeadlinesUseCase(
        loginService: loginService,
        loginViewModelCallBack: (viewModel) {
          responseLoginViewModelPipe.send(viewModel);
        });
    requestUserLoginViewModelEvent.listen(() {
      _loginUseCase.getLoginDetails();
    });
    updateCategoryData.receive.listen((data) {
      _loginUseCase.updateCategoryValue(data);
    });
  }

  @override
  void dispose() {
    responseLoginViewModelPipe.dispose();
  }
}
