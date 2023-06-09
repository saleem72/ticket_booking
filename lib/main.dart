import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_booking/configuration/routing/app_router.dart';
import 'package:ticket_booking/configuration/routing/app_screens.dart';
import 'package:ticket_booking/configuration/theme/app_theme.dart';
import 'package:ticket_booking/core/presentation/reservation_bloc/reservation_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await hideSystemNavigationBar();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    setStatusBarAndNavigationBarColor(ThemeMode.dark);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ReservationBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: darkTheme,
        onGenerateRoute: AppRouter.generate,
        initialRoute: AppScreens.initial,
      ),
    );
  }
}
