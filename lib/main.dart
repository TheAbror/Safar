import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:safar/core/api/api_provider.dart';
import 'package:safar/core/routes/main_route_generator.dart';
import 'package:safar/core/utils/api_logging.dart';
import 'package:safar/ui_staff/splash_page/bloc/splash_bloc.dart';
import 'package:safar/ui_staff/staff_home_page/bloc/orders_bloc.dart';
import 'package:safar/ui_staff/staff_home_page/model/current_user.dart';
import 'core/app_themes.dart';
import 'core/box/current_user_box.dart';
import 'core/db/shared_keys.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(CurrentUserAdapter());

  boxCurrentUser = await Hive.openBox<CurrentUser>(ShPrefKeys.currentUser);

  ApiProvider.create();

  await FlutterDownloader.initialize(debug: true, ignoreSsl: true);

  /// For logging
  setUpLogging();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) {
      runApp(
        MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => OrdersBloc()),
            BlocProvider(create: (context) => SplashBloc()),
          ],
          child: const MyApp(),
        ),
      );
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          themeMode: ThemeMode.system,
          theme: lightTheme(),
          debugShowCheckedModeBanner: false,
          builder: BotToastInit(),
          navigatorObservers: [BotToastNavigatorObserver()],
          onGenerateRoute: MainRouteGenerator().generateRoute,
        );
      },
    );
  }
}
