import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:sampleapidemo/category/bloc/category_bloc.dart';
import 'package:sampleapidemo/category/ui/category_presenter.dart';



class CategoryFeatureWidget extends StatelessWidget{
  const CategoryFeatureWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoryBloc>(
        create: (BuildContext context) => CategoryBloc(),
        child: CategoryPresenter());
  }
  
}

