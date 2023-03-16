import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'category_of_ingredient_model.g.dart';

@JsonSerializable()
class CategoryOfIngredientModel extends INetworkModel<CategoryOfIngredientModel> {
  @JsonKey(name: '_id')
  final String? id;
  @JsonKey(name: 'name')
  final String? categoryName;

  CategoryOfIngredientModel({this.id, this.categoryName});

  @override
  factory CategoryOfIngredientModel.fromJson(Map<String, dynamic> json) => _$CategoryOfIngredientModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CategoryOfIngredientModelToJson(this);

  @override
  CategoryOfIngredientModel fromJson(Map<String, dynamic> json) {
    return _$CategoryOfIngredientModelFromJson(json);
  }
}

@JsonSerializable(explicitToJson: true)
class CategoryOfIngredientListModel extends INetworkModel<CategoryOfIngredientListModel> {
  @JsonKey(name: 'data')
  final List<CategoryOfIngredientModel>? ingredientCategoryList;
  final bool? success;

  CategoryOfIngredientListModel({this.ingredientCategoryList, this.success});

  @override
  factory CategoryOfIngredientListModel.fromJson(Map<String, dynamic> json) => _$CategoryOfIngredientListModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CategoryOfIngredientListModelToJson(this);

  @override
  CategoryOfIngredientListModel fromJson(Map<String, dynamic> json) {
    return _$CategoryOfIngredientListModelFromJson(json);
  }
}
