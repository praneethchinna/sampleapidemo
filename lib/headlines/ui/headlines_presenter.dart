import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sampleapidemo/category/ui/category_feature_widget.dart';
import 'package:sampleapidemo/headlines/bloc/headlines_bloc.dart';
import 'package:sampleapidemo/headlines/model/headlines_viewmodel.dart';
import 'package:sampleapidemo/headlines/ui/headlines_screen.dart';


class HeadlinesPresenter extends Presenter<HeadlinesBloc, HeadlinesViewModel, HeadlinesScreen> {
   HeadlinesPresenter({Key? key}) : super();

  @override
  HeadlinesScreen buildScreen(
      BuildContext context, HeadlinesBloc bloc, HeadlinesViewModel viewModel) {
    return HeadlinesScreen(
        entertainmentPage: () {},
        updateCategory: (String data) {
          bloc.updateCategoryData.send(data);

          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      const CategoryFeatureWidget(),
                  maintainState: false),
              (Route<dynamic> route) => false);
        });
  }

  @override
  void sendViewModelRequest(HeadlinesBloc bloc) {
    bloc.requestUserLoginViewModelEvent.launch();
  }

  @override
  Stream<HeadlinesViewModel> getViewModelStream(HeadlinesBloc bloc) {
    return bloc.responseLoginViewModelPipe.receive;
  }

  @override
  Widget buildLoadingScreen(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }

  @override
  Widget buildErrorScreen(BuildContext context, Object? error) {
    return Container();
  }
}
