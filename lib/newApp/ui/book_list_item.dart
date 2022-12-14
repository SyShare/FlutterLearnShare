import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_one/newApp/models/category.dart';
import 'package:flutter_one/newApp/ui/details/details.dart';
import 'package:flutter_one/newApp/ui/splash.dart';
import 'package:uuid/uuid.dart';

import '../components/loading_widget.dart';
import '../util/router.dart';

class BookListItem extends StatelessWidget {
  final Entry entry;
  static final uuid = Uuid();
  final String imgTag = uuid.v4();
  final String titleTag = uuid.v4();
  final String authorTag = uuid.v4();

  BookListItem({Key? key, required this.entry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        MyRouter.pushPage(
            context,
            Details(
              entry: entry,
              imgTag: imgTag,
              titleTag: titleTag,
              authorTag: authorTag,
            ),);
      },
      child: Container(
        height: 150.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              elevation: 4,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10.0),
                ),
                child: Hero(
                  tag: imgTag,
                  child: CachedNetworkImage(
                    imageUrl: entry.link![1].href!,
                    placeholder: (context, url) => Container(
                      height: 150.0,
                      width: 100.0,
                      child: LoadingWidget(
                        isImage: true,
                      ),
                    ),
                    errorWidget: (context, url, error) => Image.asset(
                      'assets/images/place.png',
                      fit: BoxFit.cover,
                      height: 150.0,
                      width: 100.0,
                    ),
                    fit: BoxFit.cover,
                    height: 150.0,
                    width: 100.0,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10.0),
            Flexible(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: titleTag,
                  child: Material(
                    type: MaterialType.transparency,
                    child: Text(
                      entry.title!.t!.replaceAll(r'\', ''),
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.headline6!.color,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Hero(
                  tag: authorTag,
                  child: Material(
                    type: MaterialType.transparency,
                    child: Text(
                      entry.author!.name!.t!,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  '${entry.summary!.t!.length < 100 ? entry.summary!.t! : entry.summary!.t!.substring(0, 100)}...'
                      .replaceAll(r'\n', '\n')
                      .replaceAll(r'\r', '')
                      .replaceAll(r'\"', '"'),
                  style: TextStyle(
                    fontSize: 13.0,
                    color: Theme.of(context).textTheme.caption!.color,
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
