import 'dart:developer';

import 'package:flutter/material.dart';

/// A mixin that provides common pagination functionality for cubits
mixin PaginationMixin {
  bool isPagination = false;
  bool isLoadingMore = false;
  int currentPage = 1;
  int limit = 20;

  /// Reset pagination state to initial values
  void resetPagination() {
    isPagination = false;
    isLoadingMore = false;
    currentPage = 1;
  }

  /// Check if more data can be loaded
  bool canLoadMore() {
    return isPagination && !isLoadingMore;
  }

  /// Update pagination state after successful data load
  void updatePaginationState({
    required List<dynamic> newData,
    required bool isInitial,
  }) {
    if (isInitial) {
      currentPage = 1;
    } else {
      currentPage++;
    }
    
    isPagination = newData.isNotEmpty;
    isLoadingMore = false;
    
    log("Pagination updated: page=$currentPage, hasMore=$isPagination, itemsLoaded=${newData.length}");
  }

  /// Set loading more state
  void setLoadingMore(bool loading) {
    isLoadingMore = loading;
  }

  /// Calculate scroll threshold for triggering load more
  double get scrollThreshold => 0.9;

  /// Check if scroll position should trigger load more
  bool shouldLoadMore(ScrollController scrollController) {
    return scrollController.position.pixels >=
        scrollController.position.maxScrollExtent * scrollThreshold;
  }
}