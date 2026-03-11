// Clean Architecture pattern in Dart
// Inspired by taghyeer_project — demonstrates Entity, Repository (abstract),
// UseCase, and RepositoryImpl layers

// ──────────────────────────────────────────────────────────────
// DOMAIN LAYER: Entity
// ──────────────────────────────────────────────────────────────

class PostEntity {
  final int id;
  final String title;
  final String body;

  const PostEntity({required this.id, required this.title, required this.body});

  @override
  String toString() => "Post #$id — $title";
}

// ──────────────────────────────────────────────────────────────
// DOMAIN LAYER: Abstract Repository (contract / interface)
// ──────────────────────────────────────────────────────────────

abstract class PostsRepository {
  Future<List<PostEntity>> getPosts({required int limit, required int skip});
}

// ──────────────────────────────────────────────────────────────
// DOMAIN LAYER: Use Case
// Encapsulates a single business action; depends only on the abstract repository
// ──────────────────────────────────────────────────────────────

class GetPostsParams {
  final int limit;
  final int skip;
  GetPostsParams({required this.limit, required this.skip});
}

class GetPostsUseCase {
  final PostsRepository repository;
  GetPostsUseCase(this.repository);

  Future<List<PostEntity>> call(GetPostsParams params) {
    return repository.getPosts(limit: params.limit, skip: params.skip);
  }
}

// ──────────────────────────────────────────────────────────────
// DATA LAYER: Model (extends Entity, adds fromJson)
// ──────────────────────────────────────────────────────────────

class PostModel extends PostEntity {
  const PostModel({
    required super.id,
    required super.title,
    required super.body,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      body: json['body'] ?? '',
    );
  }
}

// ──────────────────────────────────────────────────────────────
// DATA LAYER: Repository Implementation
// Implements the domain abstract; fetches from a fake data source
// ──────────────────────────────────────────────────────────────

// Simulated remote data
final List<Map<String, dynamic>> _fakeApiData = [
  {'id': 1, 'title': 'What is Clean Architecture?', 'body': 'Separation of concerns across layers.'},
  {'id': 2, 'title': 'Dart Abstract Classes', 'body': 'Used to define contracts.'},
  {'id': 3, 'title': 'Factory Constructors', 'body': 'Create instances from JSON maps.'},
  {'id': 4, 'title': 'Async/Await in Dart', 'body': 'Non-blocking asynchronous code.'},
  {'id': 5, 'title': 'GetX State Management', 'body': 'Reactive state with .obs variables.'},
];

class PostsRepositoryImpl implements PostsRepository {
  @override
  Future<List<PostEntity>> getPosts({
    required int limit,
    required int skip,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 200));

    final paginated = _fakeApiData.skip(skip).take(limit).toList();
    return paginated.map((json) => PostModel.fromJson(json)).toList();
  }
}

// ──────────────────────────────────────────────────────────────
// MAIN: wire up and run
// ──────────────────────────────────────────────────────────────

void main() async {
  // Dependency injection (manual)
  final PostsRepository repository = PostsRepositoryImpl();
  final GetPostsUseCase getPostsUseCase = GetPostsUseCase(repository);

  // First page
  print("=== Page 1 (skip: 0, limit: 3) ===");
  final page1 = await getPostsUseCase(GetPostsParams(limit: 3, skip: 0));
  for (var post in page1) {
    print(post);
  }

  // Second page (pagination)
  print("\n=== Page 2 (skip: 3, limit: 3) ===");
  final page2 = await getPostsUseCase(GetPostsParams(limit: 3, skip: 3));
  for (var post in page2) {
    print(post);
  }

  if (page2.isEmpty) {
    print("No more posts.");
  }
}
