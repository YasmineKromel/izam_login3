import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:izam_login/presentation/bloc/login_bloc.dart';
import 'package:izam_login/presentation/login/views/login_mobile_screen.dart';


import 'data/common/database/database_helper.dart';
import 'injection_container.dart' ;


final dbHelper = DatabaseHelper();

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  // initialize the database
 // await initDependencies();
  await dbHelper.init();
  runApp(
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => MyApp(), // Wrap your app
    // ),
     const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
        //  useInheritedMediaQuery: true,
        //  locale: DevicePreview.locale(context),
        //  builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginMobileScreen(),
      );

    //   MultiBlocProvider(
    //     providers: [
    //     BlocProvider<LoginBloc>(create: (context)=> injector <LoginBloc>()),
    //     ],
    //     child: MaterialApp(
    //   //  useInheritedMediaQuery: true,
    //   //  locale: DevicePreview.locale(context),
    //   //  builder: DevicePreview.appBuilder,
    //   debugShowCheckedModeBanner: false,
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: const LoginMobileScreen(),
    // )
    //   );


  }
}

