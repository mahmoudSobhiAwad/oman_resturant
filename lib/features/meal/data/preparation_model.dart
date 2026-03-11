import 'package:equatable/equatable.dart';

class PreparationModel extends Equatable {
  final String? id;
  final String? name;

  const PreparationModel({this.id, this.name});
  factory PreparationModel.fromJson(Map<String, dynamic> json) {
    return PreparationModel(id: json['id'], name: json['name']);
  }
  @override
  List<Object?> get props => [id, name];
}
