//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_booking/configuration/constants/constants.dart';
import 'package:ticket_booking/features/home_screen/presentation/home_bloc/home_bloc.dart';

import 'presentation/bottom_bar_cubit/bottom_bar_cubit.dart';
import 'presentation/widgets/home_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HomeBloc()..add(HomeEvent.fetchMovies()),
        ),
        BlocProvider(
          create: (context) => BottomBarCubit(),
        )
      ],
      child: const HomeScreenContent(),
    );
  }
}

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Choose Movie'),
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          const HomeBackground(),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.paddingLarge),
                  child: HomeSearchBar(onChange: (value) {}),
                ),
                const Expanded(child: MoviesGrid()),
              ],
            ),
          ),
          const BottomBar(),
        ],
      ),
    );
  }
}
