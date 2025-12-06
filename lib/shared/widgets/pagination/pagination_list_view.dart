import 'package:flutter/material.dart';

/// A reusable ListView widget that handles pagination automatically
class PaginationListView<T> extends StatefulWidget {
  final List<T> items;
  final bool isAlwaysScrollable ;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final Widget Function(BuildContext context, int index)? shimmerBuilder;
  final VoidCallback onLoadMore;
  final VoidCallback onRefresh;
  final bool isLoading;
  final bool isLoadingMore;
  final bool hasMore;
  final EdgeInsetsGeometry? padding;
  final ScrollController? controller;
  final Widget? emptyWidget;
  final int shimmerCount;

  const PaginationListView({
    super.key,
    required this.items,
    required this.itemBuilder,
    required this.onLoadMore,
    required this.onRefresh,
    required this.isLoading,
    required this.isLoadingMore,
    required this.hasMore,
    this.isAlwaysScrollable = false,
    this.shimmerBuilder,
    this.padding,
    this.controller,
    this.emptyWidget,
    this.shimmerCount = 3,
  });

  @override
  State<PaginationListView<T>> createState() => _PaginationListViewState<T>();
}

class _PaginationListViewState<T> extends State<PaginationListView<T>> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = widget.controller ?? ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _scrollController.dispose();
    }
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.9) {
      if (widget.hasMore && !widget.isLoadingMore) {
        widget.onLoadMore();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isLoading) {
      return _buildShimmerList();
    }

    if (widget.items.isEmpty) {
      return widget.emptyWidget ?? const SizedBox.shrink();
    }

    return RefreshIndicator(
      onRefresh: () async {
        widget.onRefresh();
      },
      child: ListView.builder(
        controller: _scrollController,
        padding: widget.padding,
        physics:widget.isAlwaysScrollable? const AlwaysScrollableScrollPhysics(): null,
        itemCount: widget.items.length + (widget.isLoadingMore ? widget.shimmerCount : 0),
        itemBuilder: (context, index) {
          if (index >= widget.items.length) {
            // Show shimmer for loading more
            return widget.shimmerBuilder?.call(context, index) ??
              (  (index != widget.items.length) ?
                  const SizedBox.shrink():


                const SizedBox(height: 50, child: Center(child: CircularProgressIndicator())));
          }

          return widget.itemBuilder(context, widget.items[index], index);
        },
      ),
    );
  }

  Widget _buildShimmerList() {
    return ListView.builder(
      padding: widget.padding,
      itemCount: 6,
      itemBuilder: (context, index) {
        return widget.shimmerBuilder?.call(context, index) ??
            const SizedBox(height: 50, child: Center(child: CircularProgressIndicator()));
      },
    );
  }
}