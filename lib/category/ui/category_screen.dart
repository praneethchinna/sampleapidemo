import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:sampleapidemo/category/model/view_models/category_viewmodel.dart';
import 'package:sampleapidemo/headlines/bloc/headlines_usecase.dart';

class CategoryScreen extends Screen {
  final CategoryViewModel viewModel;
  final Function urlLoad;
  final VoidCallback backPage;

  const CategoryScreen(
      {Key? key,
      required this.urlLoad,
      required this.viewModel,
      required this.backPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            backPage();
          },
        ),
        centerTitle: true,
        title: Text("${HeadlinesUseCase.category}"),
      ),
      body: ListView.builder(

        itemCount: viewModel.articlesViewModel.length,
        itemBuilder: (context, index) => ListTile(

            contentPadding: const EdgeInsets.all(0),
            title: Card(
              elevation: 30,
              margin: const EdgeInsets.fromLTRB(0, 15, 0, 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      viewModel.articlesViewModel[index].title,
                      style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.normal),
                    ),
                    const SizedBox(height: 4),
                    Text(viewModel.articlesViewModel[index].author),
                    const SizedBox(height: 4),
                    Text(
                      viewModel.articlesViewModel[index].description,
                      style: const TextStyle(fontStyle: FontStyle.normal),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 200.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: NetworkImage(
                            viewModel.articlesViewModel[index].urlToImage),
                      )),
                    ),
                    const SizedBox(height: 4),
                    ElevatedButton(
                        onPressed: () {
                          urlLoad(viewModel.articlesViewModel[index].url);
                        },
                        child: const Text('show more'))
                  ],
                ),
              ),
            )),
      ),
    );
  }

  // _launcher() async {
  //   var url = Uri.parse(
  //       'https://www.ndtv.com/india-news/bilkis-bano-on-release-of-convicts-full-statement-im-still-numb-3263519');
  //   // Replace with your own api url
  //   //final Uri url = Uri.parse(apiEndpoint);
  //   if (await canLaunchUrl(url)) {
  //     await launchUrl(url);
  //   } else {
  //     throw 'could not launch $url';
  //   }
  // }
}

// Text(viewModel.articlesViewModel[index].title),
