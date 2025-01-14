import 'package:flutter/material.dart';
import 'package:flutter_app/components/bottom_bar.dart';
import 'package:flutter_app/helper/widget_helper.dart';
import 'package:flutter_app/ui/pages/home_page/home_page.dart';
import 'package:flutter_app/ui/pages/navigation_page/navigation_page_cubit.dart';
import 'package:flutter_app/ui/pages/navigation_page/navigation_page_state.dart';
import 'package:flutter_app/ui/pages/second_page/second_page.dart';
import 'package:flutter_app/ui/pages/third_page/third_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationPage extends StatefulWidget {
  final int startPageIndex;
  const NavigationPage({super.key, this.startPageIndex = 0});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  NavigationPageCubit cubit = NavigationPageCubit();
  bool filterFavorites = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationPageCubit, NavigationPageState>(
      bloc: cubit,
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Stack(
              children: [
                getSelectedPageContent(state),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    spacerAdaptive(),
                    BottomBar(
                      selectedIndex: state.screenIndex,
                      onSelectedChange: cubit.updateSelectedPage,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  getSelectedPageContent(NavigationPageState state) {
    switch (state.screenIndex) {
      case 0:
        return MyHomePage();
      case 1:
        return SecondPage();
      default:
        return const ThirdPage();
    }
  }
}
