import 'package:recipe_finder/product/model/recipe/recipe_model.dart';

import '../../../product/model/ingredient/ingredient_model.dart';

abstract class IBasketState {
  IBasketState();
}

class BasketsInit extends IBasketState {
  BasketsInit();
}

class OnBasketLoading extends IBasketState {
  late bool isLoading;
  OnBasketLoading(this.isLoading);
}

class BasketRecipeItemListLoad extends IBasketState {
  late List<RecipeModel> basketRecipeItemList;
  BasketRecipeItemListLoad(this.basketRecipeItemList);
}

class MyFrizeListLoad extends IBasketState {
  late List<IngredientModel> myFrizeList;
  MyFrizeListLoad(this.myFrizeList);
}

class ChangeSelectedCardModel extends IBasketState {
  RecipeModel? model;
  ChangeSelectedCardModel(this.model);
}

class ChangeSelectedColorIndex extends IBasketState {
  int? index;
  ChangeSelectedColorIndex(this.index);
}

class BasketsError extends IBasketState {
  String errorMessage;
  BasketsError(this.errorMessage);
}
