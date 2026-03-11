// Enum practice inspired by PostsStatus enum in taghyeer_project
// Enums define a fixed set of named constant values

enum PostsStatus { initial, loading, loaded, paginatingLoading, paginationError, error, empty }

enum OrderStatus { pending, confirmed, shipped, delivered, cancelled }

void printPostsStatus(PostsStatus status) {
  switch (status) {
    case PostsStatus.initial:
      print("Status: initial — not yet fetched");
      break;
    case PostsStatus.loading:
      print("Status: loading — fetching data...");
      break;
    case PostsStatus.loaded:
      print("Status: loaded — data ready");
      break;
    case PostsStatus.paginatingLoading:
      print("Status: paginatingLoading — loading more items...");
      break;
    case PostsStatus.paginationError:
      print("Status: paginationError — failed to load more items");
      break;
    case PostsStatus.error:
      print("Status: error — failed to fetch data");
      break;
    case PostsStatus.empty:
      print("Status: empty — no data available");
      break;
  }
}

void printOrderStatus(OrderStatus status) {
  print("Order is: ${status.name}");
}

void main() {
  // Using PostsStatus enum
  printPostsStatus(PostsStatus.initial);
  printPostsStatus(PostsStatus.loading);
  printPostsStatus(PostsStatus.loaded);
  printPostsStatus(PostsStatus.error);

  // Using OrderStatus enum
  printOrderStatus(OrderStatus.pending);
  printOrderStatus(OrderStatus.delivered);

  // Iterating over all enum values
  print("\nAll PostsStatus values:");
  for (var s in PostsStatus.values) {
    print("  ${s.index}: ${s.name}");
  }
}
