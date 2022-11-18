import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_one/newApp/models/category.dart';
import 'package:flutter_one/newApp/ui/splash.dart';
import 'package:uuid/uuid.dart';

import '../components/loading_widget.dart';
import '../util/router.dart';

class BookCard extends StatelessWidget {
  final String ref;
  final Entry entry;

  BookCard({Key? key, required this.ref, required this.entry})
      : super(key: key);

  static final uuid = Uuid();
  final String imgTag = uuid.v4();
  final String titleTag = uuid.v4();
  final String authorTag = uuid.v4();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        elevation: 4.0,
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          onTap: () {
            MyRouter.pushPage(
                context,
                // Details(
                //   entry: entry,
                //   imgTag: imgTag,
                //   titleTag: titleTag,
                //   authorTag: authorTag,
                // ),
                SplashScreen());
          },
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            child: Hero(
              tag: imgTag,
              child: CachedNetworkImage(
                imageUrl: ref,
                placeholder: (context, url) => LoadingWidget(
                  isImage: true,
                ),
                errorWidget: (context, url, error) => Image.asset(
                  'assets/images/place.png',
                  fit: BoxFit.cover,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Details {}
