import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ─────────────────────────────────────────────────────────────────────────────
// SimpleFetchMixin — for non-paginated APIs
//
// Use when the API returns all data in one call.
// Provides: isFetching (full-page loader), isLoadingMore is NOT needed here.
//
// Usage:
//   class CategoryController extends GetxController with SimpleFetchMixin {
//     @override
//     Future<void> fetchData() async { ... }
//   }
// ─────────────────────────────────────────────────────────────────────────────

mixin SimpleFetchMixin on GetxController {
  /// True while the full-page fetch is in progress.
  /// Drives the full-screen loader in the widget.
  bool isFetching = true;

  /// Override this to implement your API call.
  Future<void> fetchData();
}

// ─────────────────────────────────────────────────────────────────────────────
// PaginatedFetchMixin — for paginated APIs
//
// Use when the API supports limit/skip or page-based pagination.
// Provides: isFetching (full-page loader) + isLoadingMore (bottom indicator)
//           + scrollController + pagination state.
//
// Usage:
//   class ProductsController extends GetxController with PaginatedFetchMixin {
//     @override
//     Future<void> fetchData({bool isRefresh = true}) async { ... }
//   }
// ─────────────────────────────────────────────────────────────────────────────

mixin PaginatedFetchMixin on GetxController {
  /// True while the full-page fetch or refresh is in progress.
  /// Drives the full-screen loader in the widget.
  bool isFetching = true;

  /// True while the next page is being fetched.
  /// Drives the bottom load-more indicator in the widget.
  final isLoadingMore = false.obs;

  /// True when all pages have been loaded — stops further scroll triggers.
  bool isEndPage = false;

  /// Number of items per page — override in your controller if needed.
  int pagination = 10;

  /// Current page index — used to calculate skip offset.
  final currentPage = 0.obs;

  /// Owned here for safe lifecycle management.
  /// Pass to PaginatedGridView / PaginatedListView via scrollController param.
  final scrollController = ScrollController();

  /// Override this to implement your paginated API call.
  Future<void> fetchData({bool isRefresh = true});

  /// Internal scroll listener — wired in onInit, removed in onClose.
  void onScrollListener() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 200 &&
        !isEndPage &&
        !isLoadingMore.value) {
      fetchData(isRefresh: false);
    }
  }

  @override
  void onInit() {
    scrollController.addListener(onScrollListener);
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.removeListener(onScrollListener);
    scrollController.dispose();
    super.onClose();
  }
}