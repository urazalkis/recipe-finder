import 'package:flutter/material.dart';
import 'package:recipe_finder/feature/login_page/view/login_view.dart';
import 'package:recipe_finder/product/widget/bottom_nav_bar_controller/bottom_nav_bar_view.dart';

import '../../../product/component/no_navigation/no_navigation_view.dart';
import '/core/constant/navigation/navigation_constants.dart';
import '../../../feature/basket_page/view/basket_view.dart';
import '../../../feature/discover_page/view/discover_view.dart';
import '../../../feature/home_page/view/home_view.dart';
import '../../../feature/likes_page/view/likes_view.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();

  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.LOGIN:
        return normalNavigate(const LoginView(), NavigationConstants.LOGIN);
      case NavigationConstants.NAV_CONTROLLER:
        return normalNavigate(const RecipeNavigationBarController(),
            NavigationConstants.NAV_CONTROLLER);
      case NavigationConstants.HOME:
        return normalNavigate(const HomeView(), NavigationConstants.HOME);
      case NavigationConstants.DISCOVER:
        return normalNavigate(
            const DiscoverView(), NavigationConstants.DISCOVER);
      case NavigationConstants.LIKES:
        return normalNavigate(const LikesView(), NavigationConstants.LIKES);
      case NavigationConstants.BASKET:
        return normalNavigate(const BasketView(), NavigationConstants.BASKET);
      default:
        return MaterialPageRoute(
          builder: (context) => const NotFoundNavigationView(),
        );
    }
  }

  String? initialRoute() {
    return NavigationConstants.LOGIN;
  }

  MaterialPageRoute normalNavigate(Widget widget, String pageName) {
    return MaterialPageRoute(
        builder: (context) => widget,
        //analytciste görülecek olan sayfa ismi için pageName veriyoruz
        settings: RouteSettings(name: pageName));
  }
}