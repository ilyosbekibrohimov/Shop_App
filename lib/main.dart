import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/auth_provider.dart';
import 'package:shop_app/providers/add_product_provider.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/product.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/screens/add_product_screen.dart';
import 'package:shop_app/screens/auth_screen.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/screens/orders_screen.dart';
import 'package:shop_app/screens/products overview screen.dart';
import 'package:shop_app/screens/settings_screen.dart';
import 'screens/product_detail_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final cameras = await availableCameras();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => Authentication(),
        ),
        ChangeNotifierProvider(
          create: (context) => Product(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => AddProductProvider(),
        ),
        StreamProvider(create: (context) => context.read<Authentication>().user)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Roboto',
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: ProductsOverview.routeName,
        routes: {
          ProductsOverview.routeName: (context) => ProductsOverview(),
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
          CartScreen.routName: (context) => CartScreen(),
          MyOrders.routeName: (context) => MyOrders(),
          AddProduct.routeName: (context) => AddProduct(),
          AuthScreen.routeName: (context) => AuthScreen(),
          SettingsScreen.routeName: (context) => SettingsScreen(),
        },
      ),
    );
  }
}
