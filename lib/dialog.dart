import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

Future<bool> showCustomDialog({
  BuildContext context,
  String title = 'INFORMATION',
  String message,
  String positiveLabel = 'OK',
  String negativeLabel = '',
  Function positiveCallBack,
  Function negativeCallBack,
  bool result,
}) async {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.white70, width: 1),
            borderRadius: BorderRadius.circular(30),
          ),
          title: Text(
            title,
            style: TextStyle(fontFamily: 'FuturaMedium'),
          ),
          content: Text(
            message,
            style: TextStyle(fontFamily: 'FuturaMedium'),
          ),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.pop(context, true);
                  if (positiveCallBack != null) positiveCallBack();
                },
                child: Text(
                  positiveLabel,
                  style: TextStyle(
                      color: Color(0xFF248D2C),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                  ),
                )),
            negativeLabel != ''
                ? FlatButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                      if (negativeCallBack != null) negativeCallBack();
                    },
                    child: Text(
                      negativeLabel,
                      style: TextStyle(
                          color: Color(0xFF248D2C),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                    ))
                : null,
          ],
        );
      });
}


Future showLoadingDialog(
    String title, BuildContext context, GlobalKey key) async {
  return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return new WillPopScope(
          onWillPop: () async => true,
          child: Scaffold(
            key: key,
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                Expanded(child: Container()),
                Container(
                  alignment: Alignment.center,
                  child: Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            width: 120,
                            height: 100,
                            child: LoadingIndicator(
                              indicatorType: Indicator.lineScale,
                              color: Colors.white,
                            )),
                        Center(
                          child: Text(
                            title,
                            style: TextStyle(
                                 color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(child: Container()),
              ],
            ),
          ),
        );
      });
}

Future<bool> showExitDialog(
    {BuildContext context,
    String title = 'Information',
    String message,
    bool result}) async {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.white70, width: 1),
            borderRadius: BorderRadius.circular(30),
          ),
          title: Text(
            title,
            style: TextStyle(fontFamily: 'FuturaMedium'),
          ),
          content: Text(
            message,
            style: TextStyle(fontFamily: 'FuturaMedium'),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(
                'Oui',
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'FuturaMedium'),
              ),
            ),
            FlatButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text(
                  'Non',
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'FuturaMedium'),
                )),
          ],
        );
      });
}
