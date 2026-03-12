import 'package:equatable/equatable.dart';
import 'package:oman_resturant/features/meal/data/preparation_model.dart';

class MealModel extends Equatable {
  final String? image;
  final num? price;
  final String? id;
  final String? name;
  final bool isTrending;
  final bool isMainDish;
  final bool isPriceIncludeService;
  final String? description;
  final List<PreparationModel> preparation;

  const MealModel({
    this.image,
    this.price,
    this.isTrending = false,
    this.isMainDish = false,
    this.id,
    this.name,
    this.isPriceIncludeService = false,
    this.preparation = const [],
    this.description,
  });
  factory MealModel.fromJson(Map<String, dynamic> json) {
    return MealModel(
      image: json['image'],
      price: json['price'],
      isTrending: json['is_trending'],
      isMainDish: json['is_main_dish'],
      isPriceIncludeService: json['is_price_include_service'],
      preparation: json['preparation'] != null
          ? (json['preparation'] as List)
                .map((x) => PreparationModel.fromJson(x))
                .toList()
          : [],
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }
  @override
  List<Object?> get props => [
    image,
    price,
    isTrending,
    isMainDish,
    isPriceIncludeService,
    id,
    name,
    preparation,
    description,
  ];
}
