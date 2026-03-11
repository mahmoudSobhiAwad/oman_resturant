import 'package:equatable/equatable.dart';

class AtmosphereModel extends Equatable {
  final String? id;
  final String? title;
  final String? imageUrl;

  const AtmosphereModel({this.id, this.title, this.imageUrl});

  factory AtmosphereModel.fromJson(Map<String, dynamic> json) {
    return AtmosphereModel(
      id: json['id'],
      title: json['title'],
      imageUrl: json['imageUrl'],
    );
  }

  @override
  List<Object?> get props => [id, title, imageUrl];
}
