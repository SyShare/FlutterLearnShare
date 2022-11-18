import 'package:flutter/cupertino.dart';
import 'package:flutter_one/newApp/components/loading_widget.dart';

import '../util/enum/api_request_status.dart';
import 'error_widget.dart';

class BodyBuilder extends StatelessWidget {
  final APIRequestStatus apiRequestStatus;
  final Widget child;
  final Function reload;

  const BodyBuilder(
      {Key? key,
      required this.apiRequestStatus,
      required this.child,
      required this.reload})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildBodyBuilder();
  }

  Widget _buildBodyBuilder() {
    switch (apiRequestStatus) {
      case APIRequestStatus.loading:
        return LoadingWidget();
      case APIRequestStatus.loaded:
        return child;
      case APIRequestStatus.error:
        return MyErrorWidget(
          refreshCallBack: reload,
          isConnection: true,
        );
      case APIRequestStatus.unInitialized:
        return LoadingWidget();
      case APIRequestStatus.connectionError:
        return MyErrorWidget(
          refreshCallBack: reload,
          isConnection: false,
        );
      default:
        return LoadingWidget();
    }
  }
}
