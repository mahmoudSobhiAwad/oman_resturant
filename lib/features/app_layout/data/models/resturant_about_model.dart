import 'package:equatable/equatable.dart';

class ResturantAboutModel extends Equatable {
  final String? details;
  final String? imageCover;

  const ResturantAboutModel({this.details, this.imageCover});
  factory ResturantAboutModel.fromJson(Map<String, dynamic> json) {
    return ResturantAboutModel(
      details: json['details'],
      imageCover: json['image_cover'],
    );
  }
  ResturantAboutModel copyWith({String? details, String? imageCover}) {
    return ResturantAboutModel(
      details: details ?? this.details,
      imageCover: imageCover ?? this.imageCover,
    );
  }

  @override
  List<Object?> get props => [details, imageCover];
}
