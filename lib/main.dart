import 'package:auto_size/auto_size.dart';
import 'package:boohee_flutter/views/app.dart';

Future main() async =>
    runAutoSizeApp(await createApp(), width: 375, height: 667);
//  runAutoSizeApp(RouteComponent(), width: 375, height: 667);
