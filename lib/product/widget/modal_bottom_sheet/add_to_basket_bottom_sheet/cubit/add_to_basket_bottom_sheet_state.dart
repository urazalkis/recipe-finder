import '../../../../../feature/likes_page/model/like_recipe_model.dart';
import '../../../../model/ingradient_model.dart';

abstract class IAddToBasketState {
  IAddToBasketState();
}

class AddToBasketInit extends IAddToBasketState {
  AddToBasketInit();
}

class AddToBasketLoading extends IAddToBasketState {
  late bool isLoading;
  AddToBasketLoading(this.isLoading);
}

class LikesRecipeItemListLoad extends IAddToBasketState {
  late List<LikeRecipeModel> likesRecipeItemList;
  LikesRecipeItemListLoad(this.likesRecipeItemList);
}

class MissingItemListLoad extends IAddToBasketState {
  late List<IngredientModel> missingItemList;
  MissingItemListLoad(this.missingItemList);
}

class MissingItemDragging extends IAddToBasketState {
  late bool isDragging;
  MissingItemDragging(this.isDragging);
}

class MyFrizeItemDragging extends IAddToBasketState {
  late bool isDragging;
  MyFrizeItemDragging(this.isDragging);
}

class MyFrizeListLoad extends IAddToBasketState {
  late List<IngredientModel> myFrizeList;
  MyFrizeListLoad(this.myFrizeList);
}

class AddToBasketError extends IAddToBasketState {
  String errorMessage;
  AddToBasketError(this.errorMessage);
}
