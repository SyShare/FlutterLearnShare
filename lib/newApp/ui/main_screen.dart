import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_one/newApp/provider/home_provder.dart';
import 'package:flutter_one/newApp/ui/genre/genre.dart';
import 'package:flutter_one/newApp/ui/splash.dart';
import 'package:flutter_one/newApp/util/consts.dart';
import 'package:provider/provider.dart';

import '../components/body_builder.dart';
import '../models/category.dart';
import '../util/router.dart';
import 'book_card.dart';
import 'book_list_item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeProvider>(context, listen: false).getFeeds();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<HomeProvider>(builder: (context, homeProvider, child) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            Constants.appName,
            style: const TextStyle(fontSize: 20),
          ),
        ),
        body: buildBody(homeProvider),
      );
    });
  }

  @override
  bool get wantKeepAlive => true;

  Widget buildBody(HomeProvider homeProvider) {
    return BodyBuilder(
      apiRequestStatus: homeProvider.apiRequestStatus,
      child: _buildBodyList(homeProvider),
      reload: () => homeProvider.getFeeds(),
    );
  }

  Widget _buildBodyList(HomeProvider homeProvider) {
    return RefreshIndicator(
      onRefresh: () => homeProvider.getFeeds(),
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        children: <Widget>[
          _buildFeaturedSection(homeProvider),
          const SizedBox(height: 20.0),
          _buildSectionTitle('Categories'),
          const SizedBox(height: 10.0),
          _buildGenreSection(homeProvider),
          const SizedBox(height: 20.0),
          _buildSectionTitle('Recently Added'),
          const SizedBox(height: 20.0),
          _buildNewSection(homeProvider),
        ],
      ),
    );

    return Container();
  }

  Widget _buildFeaturedSection(HomeProvider homeProvider) {
    return SizedBox(
        height: 200.0,
        child: ListView.builder(
            primary: false,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            scrollDirection: Axis.horizontal,
            itemCount: homeProvider.top.feed?.entry?.length ?? 0,
            shrinkWrap: false,
            itemBuilder: (context, index) {
              Entry entry = homeProvider.top.feed!.entry![index];
              return Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 15, horizontal: 10),
                child: BookCard(ref: entry.link![1].href ?? "", entry: entry),
              );
            }));
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '$title',
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGenreSection(HomeProvider homeProvider) {
    return SizedBox(
      height: 50.0,
      child: Center(
        child: ListView.builder(
          primary: false,
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          scrollDirection: Axis.horizontal,
          itemCount: homeProvider.top.feed?.link?.length ?? 0,
          shrinkWrap: false,
          itemBuilder: (BuildContext context, int index) {
            Link link = homeProvider.top.feed!.link![index];

            // We don't need the tags from 0-9 because
            // they are not categories
            if (index < 10) {
              return const SizedBox();
            }

            return Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 5.0, vertical: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme
                      .of(context)
                      .colorScheme
                      .secondary,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                child: InkWell(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  onTap: () {
                    MyRouter.pushPage(
                        context,
                        Genre(
                          title: '${link.title}',
                          url: link.href!,
                        ),
                    );
                  },
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        '${link.title}',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildNewSection(HomeProvider homeProvider) {
    return ListView.builder(
      primary: false,
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: homeProvider.recent.feed?.entry?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        Entry entry = homeProvider.recent.feed!.entry![index];

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
          child: BookListItem(
            entry: entry,
          ),
        );
      },
    );
  }

}
