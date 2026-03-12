import 'package:equatable/equatable.dart';

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

class PaginationParams extends Equatable {
  final int? page;
  final int? limit;
  final bool? isActive;
  final List<FilterParam> filterList;

  // final CancelToken? cancelToken;

  const PaginationParams({
    this.limit = 20,
    this.page = 1,
    this.isActive = true,
    this.filterList = const [],
    // this.cancelToken,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      if (page != null) 'page': page,
      if (limit != null) 'limit': limit,
      if (isActive != null) 'isActive': isActive,
    };

    for (final filter in filterList) {
      filter.isActive && filter.value != null
          ? data[filter.key] = filter.value
          : null;
    }

    return data;
  }

  @override
  List<Object?> get props => [limit, page];
}

class FilterParam extends Equatable {
  final String key;
  final dynamic value;
  final bool isActive;

  const FilterParam({
    required this.key,
    required this.value,
    this.isActive = true,
  });

  @override
  List<Object?> get props => [key, value];
}

class Params extends Equatable {
  @override
  List<Object?> get props => [];
}
