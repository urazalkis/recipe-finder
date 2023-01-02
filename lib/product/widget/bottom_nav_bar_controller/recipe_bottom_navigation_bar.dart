import 'package:flutter/material.dart';
import 'package:recipe_finder/core/constant/design/color_constant.dart';
import 'package:recipe_finder/core/constant/enum/image_path_enum.dart';
import 'package:recipe_finder/core/extension/string_extension.dart';
import 'package:recipe_finder/core/init/language/locale_keys.g.dart';
import 'package:recipe_finder/product/widget_core/image_format/image_svg.dart';

import '../../../core/base/view/base_view.dart';
import 'bottom_nav_bar_cubit.dart';

typedef IntParameterFunction = void Function(int data);

class RecipeBottomNavigationBar extends StatelessWidget {
  const RecipeBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<RecipeNavigationBarCubit>(
      init: (cubitRead) {
        cubitRead.clear();
      },
      onPageBuilder: (BuildContext context, cubitRead, cubitWatch) => Scaffold(
        bottomNavigationBar: Stack(
          alignment: AlignmentDirectional.topCenter,
          clipBehavior: Clip.none,
          fit: StackFit.loose,
          children: [
            SizedBox(
              height: 105,
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                selectedIconTheme:
                    IconThemeData(color: ColorConstants.instance.russianViolet),
                unselectedIconTheme: IconThemeData(
                  color: ColorConstants.instance.roboticgods,
                ),
                selectedItemColor: ColorConstants.instance.russianViolet,
                unselectedItemColor: ColorConstants.instance.roboticgods,
                backgroundColor: ColorConstants.instance.white,
                iconSize: 24,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                selectedLabelStyle: const TextStyle(
                  fontSize: 13,
                ),
                onTap: (index) {
                  cubitRead.changeCurrentIndex(index);
                },
                currentIndex: cubitRead.selectedPageIndex,
                items: [
                  BottomNavigationBarItem(
                      label: LocaleKeys.home.locale,
                      icon: Padding(
                        padding: bottomNavBarLabelPadding(),
                        child: ImageSvg(
                          path: cubitRead.selectedPageIndex == 0
                              ? ImagePath.homeBlack.path
                              : ImagePath.home.path,
                          color: cubitRead.itemColor(0),
                          height: 24,
                        ),
                      )),
                  BottomNavigationBarItem(
                      label: LocaleKeys.discover.locale,
                      icon: Padding(
                        padding: bottomNavBarLabelPadding(),
                        child: ImageSvg(
                          path: cubitRead.selectedPageIndex == 1
                              ? ImagePath.discoverBlack.path
                              : ImagePath.discover.path,
                          color: cubitRead.itemColor(1),
                          height: 24,
                        ),
                      )),
                  BottomNavigationBarItem(
                      label: LocaleKeys.finder.locale,
                      icon: Padding(
                        padding: bottomNavBarLabelPadding(),
                        child: const SizedBox(
                          height: 24,
                          child: Icon(
                            Icons.home,
                            size: 0,
                            color: Colors.transparent,
                          ),
                        ),
                      )),
                  BottomNavigationBarItem(
                      label: LocaleKeys.likes.locale,
                      icon: Padding(
                        padding: bottomNavBarLabelPadding(),
                        child: ImageSvg(
                          path: cubitRead.selectedPageIndex == 3
                              ? ImagePath.likeBlack.path
                              : ImagePath.like.path,
                          color: cubitRead.itemColor(3),
                          height: 24,
                        ),
                      )),
                  BottomNavigationBarItem(
                      label: LocaleKeys.basket.locale,
                      icon: Padding(
                        padding: bottomNavBarLabelPadding(),
                        child: ImageSvg(
                          path: cubitRead.selectedPageIndex == 4
                              ? ImagePath.shoppingBagBlack.path
                              : ImagePath.shoppingBag.path,
                          color: cubitRead.itemColor(4),
                          height: 24,
                        ),
                      )),
                ],
              ),
            ),
            Positioned(
              top: -20,
              child: InkWell(
                onTap: () {
                  cubitRead.clickFinderButton();
                },
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: cubitRead.selectedPageIndex == 2
                        ? ColorConstants.instance.russianViolet
                        : ColorConstants.instance.oriolesOrange,
                  ),
                  child: ImageSvg(
                    path: ImagePath.search.path,
                    height: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: cubitRead.pageController,
          children: cubitRead.pageList,
        ),
      ),
    );
  }
}

EdgeInsets bottomNavBarLabelPadding() => EdgeInsets.only(bottom: 7);
