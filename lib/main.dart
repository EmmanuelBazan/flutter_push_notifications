import 'package:flutter/material.dart';
import 'package:flutter_push_notifications/services/pages/shoppingCartPage/shopping_cart_page.dart';
import 'package:flutter_push_notifications/services/push_notification_service.dart';

import 'services/pages/homePage/home_view.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //& esperar hasta que la app este inicializada para ejecutar initializeApp de firebase
  await PushNotificationService.initializeApp();

  runApp(const MyApp());
}

// 9C:14:E1:DD:98:16:FF:F4:93:98:06:12:BF:E5:B6:F3:A0:B9:76:E9
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
    PushNotificationService.messageStream.listen((message) {
      // print('✅✅✅ My app: $message');
      final snack = SnackBar(content: Text(message));
      messengerKey.currentState?.showSnackBar(snack);
      navigatorKey.currentState?.pushNamed('shoppingCartPage');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        scaffoldMessengerKey: messengerKey,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        initialRoute: 'homePage',
        routes: {
          'homePage': (_) => const MyHomePage(title: 'Flutter Demo Home Page'),
          'shoppingCartPage': (_) => const ShoppingCartPage(),
        });
  }
}
