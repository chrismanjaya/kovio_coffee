import 'package:flutter/material.dart';
import 'package:kovio_coffee/presentation/core/widget_color.dart';
import 'package:kovio_coffee/presentation/core/widget_path.dart';
import 'package:kovio_coffee/presentation/core/widget_size.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: sIconLauncher,
              child: Image(
                image: AssetImage(pathIconLauncher),
              ),
            ),
            SizedBox(
              height: sPaddingExtraLarge,
            ),
            Container(
              width: sIconLauncher * 3,
              child: LinearProgressIndicator(
                backgroundColor: kSecondColor,
                valueColor: const AlwaysStoppedAnimation<Color>(kAccentColor),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
