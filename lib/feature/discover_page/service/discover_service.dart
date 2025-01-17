import 'package:recipe_finder/product/model/recipe/recipe_model.dart';
import 'package:recipe_finder/product/model/token/token_model.dart';
import 'package:vexana/vexana.dart';

import '../../../core/constant/enum/hive_enum.dart';
import '../../../core/constant/service/service_path.dart';
import '../../../core/init/cache/hive_manager.dart';
import '../../../core/init/network/vexana/vexana_manager.dart';
import '../../../product/model/recipe_category/category_of_recipes.dart';
import '../../../product/model/user_model.dart';

abstract class IDiscoverService {
  Future<IResponseModel<CategoryOfRecipesListModel?, INetworkModel<dynamic>?>> fetchCategoryList();
  Future<IResponseModel<RecipeListModel?, INetworkModel<dynamic>?>> fetchInitialRecipeList();
  Future<IResponseModel<RecipeListModel?, INetworkModel<dynamic>?>> fetchRecipeList({required int page});
}

class DiscoverService implements IDiscoverService {
  static const int pageLimit = 10;
  @override
  Future<IResponseModel<CategoryOfRecipesListModel?, INetworkModel<dynamic>?>> fetchCategoryList() {
    final response = VexanaManager.instance.networkManager.send<CategoryOfRecipesListModel, CategoryOfRecipesListModel>(
      ServicePath.recipeCategory,
      parseModel: CategoryOfRecipesListModel(),
      method: RequestType.GET,
    );
    return response;
  }

  @override
  Future<IResponseModel<RecipeListModel?, INetworkModel?>> fetchRecipeList({required int page}) async {
    final IHiveManager<User> hiveManager = HiveManager<User>(HiveBoxEnum.userModel);
    final user = await hiveManager.get(HiveKeyEnum.user);
    final response = VexanaManager.instance.networkManager.send<RecipeListModel, RecipeListModel>(
      ServicePath.getAllRecipes(page, pageLimit),
      parseModel: RecipeListModel(),
      method: RequestType.GET,
      options: Options(headers: TokenModel(token: user?.token).toJson()),
    );
    return response;
  }

  @override
  Future<IResponseModel<RecipeListModel?, INetworkModel?>> fetchInitialRecipeList() async {
    final IHiveManager<User> hiveManager = HiveManager<User>(HiveBoxEnum.userModel);
    final user = await hiveManager.get(HiveKeyEnum.user);
    final response = VexanaManager.instance.networkManager.send<RecipeListModel, RecipeListModel>(
      ServicePath.getAllRecipes(1, pageLimit),
      parseModel: RecipeListModel(),
      method: RequestType.GET,
      options: Options(headers: TokenModel(token: user?.token).toJson()),
    );
    return response;
  }
}
