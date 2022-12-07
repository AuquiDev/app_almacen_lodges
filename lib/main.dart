
import 'package:app_almacen_lodges/provider/productos_provider.dart';
import 'package:app_almacen_lodges/ui/pages/init_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() => runApp( AppState());


class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        ChangeNotifierProvider(
          lazy: false,
          create: (_){
            return ProductoProvider();
          }
          ),
       
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Andean Lodges App',
      home:  InitPages(),
     theme: ThemeData(
        textTheme: GoogleFonts.nunitoSansTextTheme(),
      ),
    );
  }
}