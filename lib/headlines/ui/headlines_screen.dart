import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class HeadlinesScreen extends Screen {
  final Function updateCategory;

  final VoidCallback entertainmentPage;
  const HeadlinesScreen(
      {Key? key, required this.entertainmentPage, required this.updateCategory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.account_circle_rounded,
          color: Colors.blueGrey,
          size: 35,
        ),
        title: const Text(
          "Top-HeadLines",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          //add
          IconButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => SearchPage())),
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ))
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Center(
          child: GridView.extent(
        primary: false,
        padding: const EdgeInsets.all(16),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        maxCrossAxisExtent: 200.0,
        children: <Widget>[
          InkWell(
            splashColor: Colors.black26,
            onTap: () {
              updateCategory('business');
            },
            child: Column(
              children: [
                Ink.image(
                  image: const AssetImage('images/business.png'),
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 6,
                ),
                const Text(
                  'business',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          InkWell(
            splashColor: Colors.black26,
            onTap: () {
              updateCategory('entertainment');
            },
            child: Column(
              children: [
                Ink.image(
                  image: const AssetImage('images/entertainment.png'),
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 6,
                ),
                const Text(
                  'entertainment',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          InkWell(
            splashColor: Colors.black26,
            onTap: () {
              updateCategory('health');
            },
            child: Column(
              children: [
                Ink.image(
                  image: const AssetImage('images/health.png'),
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 6,
                ),
                const Text(
                  'health',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          InkWell(
            splashColor: Colors.black26,
            onTap: () {
              updateCategory('science');
            },
            child: Column(
              children: [
                Ink.image(
                  image: const AssetImage('images/science.png'),
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 6,
                ),
                const Text(
                  'science',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          InkWell(
            splashColor: Colors.black26,
            onTap: () {
              updateCategory('sports');
            },
            child: Column(
              children: [
                Ink.image(
                  image: const AssetImage('images/sports.png'),
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 6,
                ),
                const Text(
                  'sports',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          InkWell(
            splashColor: Colors.black26,
            onTap: () {
              updateCategory('technology');
            },
            child: Column(
              children: [
                Ink.image(
                  image: const AssetImage('images/technology.png'),
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 6,
                ),
                const Text(
                  'technology',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}

class SearchPage extends StatelessWidget {
  final textEditingControllr = TextEditingController();
  SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // The search area here
          title: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: TextField(
            controller: textEditingControllr,
            decoration: InputDecoration(
                prefixIcon:  IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    /* Clear the search field */

                  },
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    /* Clear the search field */
                  },
                ),
                hintText: 'Search...',
                border: InputBorder.none),
          ),
        ),
      )),
    );
  }
}
