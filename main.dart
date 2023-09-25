void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Flutter',
      initialRoute: '/',
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
