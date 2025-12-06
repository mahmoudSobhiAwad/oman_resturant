class Pagination {
  final PaginationResult paginationResult;
  final int results;

  const Pagination({required this.paginationResult, required this.results});

  Pagination copyWith({PaginationResult? paginationResult, int? results}) {
    return Pagination(
      paginationResult: paginationResult ?? this.paginationResult,
      results: results ?? this.results,
    );
  }

  factory Pagination.empty() {
    return const Pagination(
      paginationResult: PaginationResult(
        currentPage: 1,
        numberOfPages: 1,
        limit: 20,
      ),
      results: 0,
    );
  }
}

class PaginationResult {
  final int currentPage;
  final int numberOfPages;
  final int limit;

  const PaginationResult({
    required this.currentPage,
    required this.numberOfPages,
    required this.limit,
  });

  PaginationResult copyWith({
    int? currentPage,
    int? numberOfPages,
    int? limit,
  }) {
    return PaginationResult(
      currentPage: currentPage ?? this.currentPage,
      numberOfPages: numberOfPages ?? this.numberOfPages,
      limit: limit ?? this.limit,
    );
  }
}
