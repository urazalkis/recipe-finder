import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_finder/core/base/model/base_view_model.dart';
import 'package:recipe_finder/core/constant/enum/image_path_enum.dart';
import 'package:recipe_finder/feature/finder_page/cubit/finder_state.dart';
import 'package:recipe_finder/feature/finder_page/model/image_model.dart';
import 'package:recipe_finder/feature/finder_page/service/finder_service.dart';
import 'package:recipe_finder/feature/likes_page/model/like_recipe_model.dart';
import 'package:recipe_finder/product/model/ingradient_model.dart';
import 'package:recipe_finder/product/model/recipe_model.dart';
import 'package:video_player/video_player.dart';


class FinderCubit extends Cubit<IFinderState> implements IBaseViewModel {
  IFinderService? service;
  late List<LikeRecipeModel> finderRecipeItems;
  late List<IngredientModel> myFinderFrizeItems;
 late VideoPlayerController videoPlayerController;
  String directionText =
      """Whisk egg, ketchup, Worcestershire sauce, salt, brown sugar, onion powder, garlic powder, thyme, and cayenne pepper together in a bowl. Add breadcrumbs and chopped cooked bacon. Crumble in the ground beef. Mix with your fingers until bacon and breadcrumbs are distributed evenly.
  Form mixture into 4 burgers with your wet hands. Cover with plastic wrap and refrigerate until chilled thoroughly, about 3 hours.
  Preheat an outdoor grill for medium-high heat and lightly oil the grate.
  Place burgers on the grate and cook, turing occasionally, until firm and cooked to your desired doneness. """;

  FinderCubit() : super(FinderInit());

  @override
  void init() {
    service = FinderService();
      videoPlayerController = VideoPlayerController.network(
        'https://file-examples.com/storage/fe88dacf086398d1c98749c/2017/04/file_example_MP4_640_3MG.mp4')
      ..initialize().then((value) {});
    finderRecipeItems = [
      LikeRecipeModel(
        missingItems: [
          IngredientModel(
              title: 'egg', imagePath: ImagePath.egg.path, quantity: 5),
          IngredientModel(
              title: 'milk', imagePath: ImagePath.milk.path, quantity: 6),
          IngredientModel(
              title: 'bread', imagePath: ImagePath.bread.path, quantity: 3),
          IngredientModel(
              title: 'salad', imagePath: ImagePath.salad.path, quantity: 2),
          IngredientModel(
              title: 'chicken', imagePath: ImagePath.chicken.path, quantity: 4),
        ],
        recipeModel: RecipeModel(
          imagePath: 'asset/png/image.png',
          title:
              'Cajun spiced Cauliflower Rice with Chicken Sausage',
          ingredients: [
            IngredientModel(title: 'Egg', quantity: 4),
            IngredientModel(title: 'Butter', quantity: 1 / 2),
            IngredientModel(title: 'Butter', quantity: 1 / 2),
            IngredientModel(title: 'Egg', quantity: 4),
            IngredientModel(title: 'Butter', quantity: 1 / 2),
            IngredientModel(title: 'Butter', quantity: 1 / 2),
          ],
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Adipiscing at dolor eu, et faucibus.',
          directions: directionText,
          
        ),
      ),
      LikeRecipeModel(
        missingItems: [
          IngredientModel(
              title: 'milk', imagePath: ImagePath.milk.path, quantity: 5),
          IngredientModel(
              title: 'egg', imagePath: ImagePath.egg.path, quantity: 3),
        ],
        recipeModel: RecipeModel(
            imagePath: 'asset/png/image1.png',
            title: 'Cajun spiced Cauliflower Rice with Chicken Sausage',
            ingredients: [
              IngredientModel(title: 'Egg', quantity: 4),
              IngredientModel(title: 'Butter', quantity: 1 / 2),
              IngredientModel(title: 'Butter', quantity: 1 / 2),
            ],
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Adipiscing at dolor eu, et faucibus.',
            directions: directionText),
      ),
      LikeRecipeModel(
        missingItems: [
          IngredientModel(title: 'somon'),
          IngredientModel(title: 'bread'),
          IngredientModel(title: 'milk'),
        ],
        recipeModel: RecipeModel(
            imagePath: 'asset/png/image.png',
            title: 'Cajun spiced Cauliflower Rice with Chicken Sausage',
            ingredients: [
              IngredientModel(title: 'Egg', quantity: 4),
              IngredientModel(title: 'Butter', quantity: 1 / 2),
              IngredientModel(title: 'Butter', quantity: 1 / 2),
            ],
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Adipiscing at dolor eu, et faucibus.',
            directions: directionText),
      ),
      LikeRecipeModel(
        recipeModel: RecipeModel(
            imagePath: 'asset/png/image1.png',
            title: 'Cajun spiced Cauliflower Rice with Chicken Sausage',
            ingredients: [
              IngredientModel(title: 'Egg', quantity: 4),
              IngredientModel(title: 'Butter', quantity: 1 / 2),
              IngredientModel(title: 'Butter', quantity: 1 / 2),
            ],
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Adipiscing at dolor eu, et faucibus.',
            directions: directionText),
      ),
      LikeRecipeModel(
        recipeModel: RecipeModel(
            imagePath: 'asset/png/image.png',
            title: 'Cajun spiced Cauliflower Rice with Chicken Sausage',
            ingredients: [
              IngredientModel(title: 'Egg', quantity: 4),
              IngredientModel(title: 'Butter', quantity: 1 / 2),
              IngredientModel(title: 'Butter', quantity: 1 / 2),
            ],
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Adipiscing at dolor eu, et faucibus.',
            directions: directionText),
      ),
    ];

    myFinderFrizeItems = [
      IngredientModel(
          title: 'milk', imagePath: ImagePath.milk.path, quantity: 6),
      IngredientModel(
          title: 'bread', imagePath: ImagePath.bread.path, quantity: 3),
      IngredientModel(
          title: 'salad', imagePath: ImagePath.salad.path, quantity: 2),
      IngredientModel(title: 'egg', imagePath: ImagePath.egg.path, quantity: 3),
      IngredientModel(
          title: 'potato', imagePath: ImagePath.potato.path, quantity: 2),
      IngredientModel(
          title: 'chicken', imagePath: ImagePath.chicken.path, quantity: 2),
    ];
  }
 void clickRunVideoButton() {
    print('calisti');
    if (videoPlayerController.value.isPlaying) {
      emit(VideoPlaybackState(videoPlayerController.pause()));
    } else {
      emit(VideoPlaybackState(videoPlayerController.play()));
    }
  }
  @override
  void dispose() {}

  @override
  BuildContext? context;

  @override
  void setContext(BuildContext context) => this.context = context;
}

/**
 * 
  List<RecipeModel> draggableItems = [
    const RecipeModel(
        distance: 'Cajun spiced Cauliflower Rice with Chicken Sausage',
        imageAsset: 'asset/png/image.png'),
    const RecipeModel(
        distance: 'Cajun spiced Cauliflower Rice with Chicken Sausage',
        imageAsset: 'asset/png/image1.png'),
    const RecipeModel(
        distance: 'Cajun spiced Cauliflower Rice with Chicken Sausage',
        imageAsset: 'asset/png/image.png'),
    const RecipeModel(
        distance: 'Cajun spiced Cauliflower Rice with Chicken Sausage',
        imageAsset: 'asset/png/image1.png'),
    const RecipeModel(
        distance: 'Cajun spiced Cauliflower Rice with Chicken Sausage',
        imageAsset: 'asset/png/image.png'),
    const RecipeModel(
        distance: 'Cajun spiced Cauliflower Rice with Chicken Sausage',
        imageAsset: 'asset/png/image1.png'),
    const RecipeModel(
        distance: 'Cajun spiced Cauliflower Rice with Chicken Sausage',
        imageAsset: 'asset/png/image.png'),
    const RecipeModel(
        distance: 'Cajun spiced Cauliflower Rice with Chicken Sausage',
        imageAsset: 'asset/png/image1.png'),
    const RecipeModel(
        distance: 'Cajun spiced Cauliflower Rice with Chicken Sausage',
        imageAsset: 'asset/png/image.png'),
    const RecipeModel(
        distance: 'Cajun spiced Cauliflower Rice with Chicken Sausage',
        imageAsset: 'asset/png/image1.png'),
    const RecipeModel(
        distance: 'Cajun spiced Cauliflower Rice with Chicken Sausage',
        imageAsset: 'asset/png/image.png'),
    const RecipeModel(
        distance: 'Cajun spiced Cauliflower Rice with Chicken Sausage',
        imageAsset: 'asset/png/image1.png'),
  ];

 */