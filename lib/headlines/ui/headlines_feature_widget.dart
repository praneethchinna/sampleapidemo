import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:sampleapidemo/headlines/bloc/headlines_bloc.dart';
import 'package:sampleapidemo/headlines/ui/headlines_presenter.dart';


class HeadLinesFeatureWidget extends StatelessWidget {
  const HeadLinesFeatureWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HeadlinesBloc>(
      create: (_) {
        return HeadlinesBloc();
      },
      child: HeadlinesPresenter(),
    );
  }
}