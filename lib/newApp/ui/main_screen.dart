import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_one/newApp/provider/home_provder.dart';
import 'package:flutter_one/newApp/ui/buttons.dart';
import 'package:flutter_one/newApp/ui/explore.dart';
import 'package:flutter_one/newApp/ui/favorites/favorites.dart';
import 'package:flutter_one/newApp/ui/genre/genre.dart';
import 'package:flutter_one/newApp/ui/settings/settings.dart';
import 'package:flutter_one/newApp/util/consts.dart';
import 'package:flutter_one/widget/widget_main.dart';
import 'package:flutter_one/widgets/widget_learn_demo.dart';
import 'package:provider/provider.dart';
import 'package:sidebarx/sidebarx.dart';

import '../components/body_builder.dart';
import '../models/category.dart';
import '../util/router.dart';
import 'book_card.dart';
import 'book_list_item.dart';
const canvasColor = Color(0xFF2E2E48);
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

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<HomeProvider>(builder: (context, homeProvider, child) {
      return Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              Constants.appName,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          body: buildBody(homeProvider),
          drawer: SidebarX(
            headerBuilder: (context,extended){
              return UserAccountsDrawerHeader(
                      accountName: const Text("your name",style: TextStyle(
                        color: Colors.white
                      ),),
                      accountEmail: const Text("your email",style: TextStyle(
                          color: Colors.white
                      )),
                      currentAccountPicture: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(color: Theme.of(context).cardColor, blurRadius: 4.0)
                          ],
                          shape: BoxShape.circle,
                        ),
                        child:  CircleAvatar(
                          child: Image.network(
                              'https://www.itying.com/images/flutter/3.png'),
                        ),
                      ),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://www.itying.com/images/flutter/2.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      otherAccountsPictures: <Widget>[
                        Image.network(
                            'https://www.itying.com/images/flutter/4.png'),
                        Image.network(
                            'https://www.itying.com/images/flutter/5.png'),
                        const Text('data',style: TextStyle(
                            color: Colors.white
                        ))
                      ],
                    );
            },
            controller: SidebarXController(selectedIndex: 0, extended: true),
            items:  [
              SidebarXItem(icon: Icons.home, label: 'Home',onTap: () {
                          _scaffoldKey.currentState?.closeDrawer();
                          // Navigator.of(context).pop(); //隐藏侧边栏
                          MyRouter.pushPage(context, const MainScreen());
              }),
              SidebarXItem(icon: Feather.compass, label: 'Explore',onTap: (){
                            _scaffoldKey.currentState?.closeDrawer();
                            // Navigator.of(context).pop(); //隐藏侧边栏
                            MyRouter.pushPage(context, const Explore());
              }),
              SidebarXItem(icon: Feather.settings, label: 'Settings',onTap: (){
                            _scaffoldKey.currentState?.closeDrawer();
                            // Navigator.of(context).pop(); //隐藏侧边栏
                            MyRouter.pushPage(context, Profile());
              }),
              SidebarXItem(icon: Feather.heart, label: 'Favorites',onTap: (){
                _scaffoldKey.currentState?.closeDrawer();
                // Navigator.of(context).pop(); //隐藏侧边栏
                MyRouter.pushPage(context, Profile());
              }),
              SidebarXItem(icon: Feather.link, label: 'LearnDemo',onTap: (){
                _scaffoldKey.currentState?.closeDrawer();
                // Navigator.of(context).pop(); //隐藏侧边栏
                MyRouter.pushPage(context, ButtonExample());
              }),
              SidebarXItem(icon: Feather.link, label: 'WidgetLearnDemo',onTap: (){
                _scaffoldKey.currentState?.closeDrawer();
                // Navigator.of(context).pop(); //隐藏侧边栏
                MyRouter.pushPage(context, WidgetLearnDemo());
              }),
              SidebarXItem(icon: Feather.link, label: 'GSYWidgetDemo',onTap: (){
                _scaffoldKey.currentState?.closeDrawer();
                // Navigator.of(context).pop(); //隐藏侧边栏
                MyRouter.pushPage(context,  GSYMyApp());
              }),
            ],
            separatorBuilder: (context,index){
              return const Divider();
            },
            theme:   SidebarXTheme(
              margin: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
              textStyle: const TextStyle(color: Colors.white),
              selectedTextStyle: const TextStyle(color: Colors.white),
              itemTextPadding: const EdgeInsets.only(left: 30),
              selectedItemTextPadding: const EdgeInsets.only(left: 30),
              decoration: BoxDecoration(
                color: canvasColor,
                borderRadius: BorderRadius.circular(20),
              ),
              iconTheme: const IconThemeData(
                color: Colors.white,
                size: 20,
              ),
            ),
            extendedTheme: const SidebarXTheme(
              width: 300,
              decoration: BoxDecoration(
                color: canvasColor,
              ),
            ),
          ),
          // drawer: Drawer(
          //   child: Column(
          //     children: [

          //       ListTile(
          //         leading: const CircleAvatar(
          //           child: Icon(Feather.home),
          //         ),
          //         title: const Text('Home'),
          //         onTap: () {
          //           _scaffoldKey.currentState?.closeDrawer();
          //           // Navigator.of(context).pop(); //隐藏侧边栏
          //           MyRouter.pushPage(context, const MainScreen());
          //         },
          //       ),
          //       const Divider(), // 增加一条线
          //       ListTile(
          //           leading: const CircleAvatar(
          //             child: Icon(Feather.compass),
          //           ),
          //           title: const Text('Explore'),
          //           onTap: () {
          //             _scaffoldKey.currentState?.closeDrawer();
          //             // Navigator.of(context).pop(); //隐藏侧边栏
          //             MyRouter.pushPage(context, const Explore());
          //           }),
          //       const Divider(), // 增加一条线
          //       ListTile(
          //           leading: const CircleAvatar(
          //             child: Icon(Feather.settings),
          //           ),
          //           title: const Text('Setting'),
          //           onTap: () {
          //             _scaffoldKey.currentState?.closeDrawer();
          //             // Navigator.of(context).pop(); //隐藏侧边栏
          //             MyRouter.pushPage(context, Profile());
          //           }),
          //       const Divider(), // 增加一条线
          //       ListTile(
          //           leading: const CircleAvatar(
          //             child: Icon(Feather.heart),
          //           ),
          //           title: const Text('Favorites'),
          //           onTap: () {
          //             _scaffoldKey.currentState?.closeDrawer();
          //             // Navigator.of(context).pop(); //隐藏侧边栏
          //             MyRouter.pushPage(context, Favorites());
          //           }),
          //       const Divider(), // 增加一条线
          //       ListTile(
          //           leading: const CircleAvatar(
          //             child: Icon(Feather.link),
          //           ),
          //           title: const Text('LearnDemo'),
          //           onTap: () {
          //             _scaffoldKey.currentState?.closeDrawer();
          //             // Navigator.of(context).pop(); //隐藏侧边栏
          //             MyRouter.pushPage(context, ButtonExample());
          //           }),
          //       const Divider(), // 增加一条线
          //       ListTile(
          //           leading: const CircleAvatar(
          //             child: Icon(Icons.telegram),
          //           ),
          //           title: const Text('WidgetDemo'),
          //           onTap: () {
          //             _scaffoldKey.currentState?.closeDrawer();
          //             // Navigator.of(context).pop(); //隐藏侧边栏
          //             MyRouter.pushPage(context, WidgetLearnDemo());
          //           }),
          //       const Divider(), // 增加一条线
          //       ListTile(
          //           leading: const CircleAvatar(
          //             child: Icon(Icons.telegram),
          //           ),
          //           title: const Text('GSYWidgetDemo'),
          //           onTap: () {
          //             _scaffoldKey.currentState?.closeDrawer();
          //             // Navigator.of(context).pop(); //隐藏侧边栏
          //             MyRouter.pushPage(context,  GSYMyApp());
          //           }),
          //     ],
          //   ),
          // )
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
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
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
