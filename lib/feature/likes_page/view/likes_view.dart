import 'package:flutter/material.dart';
import 'package:recipe_finder/core/extension/context_extension.dart';
import 'package:recipe_finder/product/widget/button/go_to_top_fab_button.dart';

import '../../../core/base/view/base_view.dart';
import '../../../core/constant/navigation/navigation_constants.dart';
import '../../../core/init/language/locale_keys.g.dart';
import '../../../core/init/navigation/navigation_service.dart';
import '../../../core/widget/text/locale_bold_text.dart';
import '../../../product/widget/card/animated_saved_recipe_card.dart';
import '../../../product/widget/list_view/category_list_view.dart';
import '../../../product/widget/modal_bottom_sheet/add_to_basket_bottom_sheet/view/add_to_basket_bottom_sheet.dart';
import '../../../product/widget/text_field/search_text_field.dart';
import '../cubit/likes_cubit.dart';

class LikesView extends StatelessWidget {
  const LikesView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LikesCubit>(
      init: (cubitRead) {
        cubitRead.init();
      },
      visibleProgress: false,
      onPageBuilder: (BuildContext context, cubitRead, cubitWatch) => Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: GoToTopFabButton(
          scrollController: cubitRead.scrollController,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            controller: cubitRead.scrollController,
            child: Padding(
              padding: EdgeInsets.only(
                top: context.mediumValue,
                left: context.normalValue,
                right: context.normalValue,
                bottom: context.highValue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LocaleBoldText(
                    text: LocaleKeys.mySavedRecipes,
                    fontSize: 29,
                  ),
                  context.normalSizedBox,
                  SearchTextField(
                    controller: TextEditingController(),
                    width: context.screenWidth,
                  ),
                  context.normalSizedBox,
                  CategoryListView(
                    categoryList: [],
                    categoryIdList: [],
                  ),
                  context.normalSizedBox,
                  buildLikesRecipeGrid(cubitRead),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  GridView buildLikesRecipeGrid(LikesCubit cubitRead) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: cubitRead.recipeList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          childAspectRatio: 3 / 4,
        ),
        itemBuilder: (BuildContext context, int cardIndex) {
          return AnimatedLikesRecipeCard(
            model: cubitRead.recipeList[cardIndex],
            addToBasketOnPressed: () {
              AddToBasketBottomSheet.instance.show(context, cubitRead.recipeList![cardIndex]);
            },
            onPressed: () {
              NavigationService.instance.navigateToPage(path: NavigationConstants.RECIPE_DETAIL, data: cubitRead.recipeList[cardIndex]);
              /* recipeBottomSheet(
                              context, cubitRead, cardIndex);*/
            },
            likeIconOnPressedYes: () {
              cubitRead.deleteItemFromLikedRecipeList(cubitRead.recipeList[cardIndex]);
            },
          );
        });
  }
}
