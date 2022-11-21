import 'package:flutter/material.dart';
import 'package:flutter_one/newApp/models/category.dart';
import 'package:flutter_one/newApp/provider/home_provder.dart';
import 'package:flutter_one/newApp/ui/genre/genre.dart';
import 'package:flutter_one/newApp/ui/splash.dart';
import 'package:flutter_one/newApp/util/api.dart';
import 'package:provider/provider.dart';

import '../components/body_builder.dart';
import '../components/loading_widget.dart';
import '../util/router.dart';
import 'book_card.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  Api api = Api();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, homeProvider, child) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Explore"),
        ),
        body: BodyBuilder(
          apiRequestStatus: homeProvider.apiRequestStatus,
          child: buildBodyBuilder(homeProvider),
          reload: () => homeProvider.getFeeds(),
        ),
      );
    });
  }

  Widget buildBodyBuilder(HomeProvider homeProvider) {
    return ListView.builder(
      itemBuilder: (context, index) {
        Link link = homeProvider.top.feed!.link![index];

        if (index < 10) {
          return const SizedBox();
        }

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            children: [
              _buildSectionTitle(link),
              const SizedBox(height: 10.0),
              _buildNewSection(homeProvider, link),
            ],
          ),
        );
      },
      shrinkWrap: false,
      primary: false,
      cacheExtent: 6,
      itemCount: homeProvider.top.feed?.link?.length ?? 0,
    );
  }

  Widget _buildSectionTitle(Link link) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '${link.title}',
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          GestureDetector(
            onTap: () {
              MyRouter.pushPage(
                  context,
                  Genre(
                    title: '${link.title}',
                    url: link.href!,
                  ),);
            },
            child: Text(
              'See All',
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildNewSection(HomeProvider homeProvider, Link link) {
    return FutureBuilder(
        future: api.getCategory(link.href!),
        builder: (BuildContext context, AsyncSnapshot<CategoryFeed> snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            CategoryFeed categoryFeed = snapshot.data!;
            return SizedBox(
              height: 200.0,
              child: Center(
                child: ListView.builder(
                  primary: false,
                  cacheExtent: 6,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  shrinkWrap: false,
                  itemCount: categoryFeed.feed?.entry?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    Entry entry = categoryFeed.feed!.entry![index];

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5.0,
                        vertical: 10.0,
                      ),
                      child: BookCard(
                        ref: entry.link![1].href!,
                        entry: entry,
                      ),
                    );
                  },
                ),
              ),
            );
          } else {
            return Container(
              height: 200.0,
              alignment: Alignment.center,
              child: LoadingWidget(),
            );
          }
        });
  }
}
