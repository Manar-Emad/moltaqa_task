import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bottom_nav_bar/card_screen.dart';
import '../../bottom_nav_bar/favourites_screen.dart';
import '../../bottom_nav_bar/final_winner.dart';
import '../../bottom_nav_bar/home_screen.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> bottomScreens = [
    const HomeScreen(),
    const FavouritiesScreen(),
    const FinalWinnersScreen(),
    const CartScreen(),
  ];

  changeBottom(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }
}
