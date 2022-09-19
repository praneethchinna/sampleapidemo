import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:sampleapidemo/category/bloc/category_bloc.dart';
import 'package:sampleapidemo/category/model/view_models/category_viewmodel.dart';
import 'package:sampleapidemo/category/ui/category_screen.dart';
import 'package:sampleapidemo/headlines/ui/headlines_feature_widget.dart';

import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:url_launcher/url_launcher.dart';

class CategoryPresenter
    extends Presenter<CategoryBloc, CategoryViewModel, CategoryScreen> {
  CategoryPresenter({Key? key}) : super();

  @override
  CategoryScreen buildScreen(
      BuildContext context, CategoryBloc bloc, CategoryViewModel viewModel) {
    return CategoryScreen(
      viewModel: viewModel,
      urlLoad: (url){
        _urlLauncher(url);
      },
      backPage: () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const HeadLinesFeatureWidget(),
                maintainState: false),
            (Route<dynamic> route) => false);
      },
    );
  }

  @override
  Stream<CategoryViewModel> getViewModelStream(CategoryBloc bloc) {
    return bloc.categoryViewModelPipe.receive;
  }

  @override
  void sendViewModelRequest(CategoryBloc bloc) {
    bloc.initializeNewsEvent.launch();
  }

  @override
  Widget buildErrorScreen(BuildContext context, Object? error) {
    return Container();
  }

  @override
  Widget buildLoadingScreen(BuildContext context) {
    return Shimmer(
      duration: const Duration(seconds: 2), //Default value
      interval:
          const Duration(seconds: 2), //Default value: Duration(seconds: 0)
      color: Colors.white, //Default value
      colorOpacity: 1, //Default value
      enabled: true, //Default value
      direction: const ShimmerDirection.fromLTRB(), //Default Value
      child: Container(
        color: Colors.grey,
      ),
    );
  }

  _urlLauncher(String url) async {
    var uri = Uri.parse(
        '$url');
    // Replace with your own api url
    //final Uri url = Uri.parse(apiEndpoint);


    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'could not launch $uri';
    }
  }
}
