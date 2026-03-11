// fromJson factory constructor practice
// Inspired by PostModel in taghyeer_project/lib/features/posts/data/models/

// ──────────────────────────────────────────────────────────────
// ENTITY — plain data class with no serialization logic
// ──────────────────────────────────────────────────────────────

class PostEntity {
  final int id;
  final String title;
  final String body;
  final int userId;
  final List<String> tags;
  final int views;

  const PostEntity({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
    required this.tags,
    required this.views,
  });

  @override
  String toString() =>
      "PostEntity(id: $id, title: $title, userId: $userId, views: $views, tags: $tags)";
}

// ──────────────────────────────────────────────────────────────
// MODEL — extends entity and adds JSON deserialization
// ──────────────────────────────────────────────────────────────

class PostModel extends PostEntity {
  const PostModel({
    required super.id,
    required super.title,
    required super.body,
    required super.userId,
    required super.tags,
    required super.views,
  });

  // Factory constructor: creates a PostModel from a JSON map
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      body: json['body'] ?? '',
      userId: json['userId'] ?? 0,
      tags: List<String>.from(json['tags'] ?? []),
      views: json['views'] ?? 0,
    );
  }
}

void main() {
  // Simulated JSON response from an API
  final Map<String, dynamic> json = {
    'id': 1,
    'title': 'Introduction to Clean Architecture',
    'body': 'Clean Architecture separates code into layers for better maintainability.',
    'userId': 42,
    'tags': ['flutter', 'dart', 'architecture'],
    'views': 1200,
  };

  // Deserialize JSON into a model
  final PostModel post = PostModel.fromJson(json);
  print(post);

  // The model IS-A entity, so it can be used wherever an entity is expected
  PostEntity entity = post;
  print("\nAs entity: $entity");

  // Simulated list of posts from API
  final List<Map<String, dynamic>> jsonList = [
    {'id': 2, 'title': 'Dart Generics', 'body': '...', 'userId': 1, 'tags': ['dart'], 'views': 300},
    {'id': 3, 'title': 'GetX State Management', 'body': '...', 'userId': 2, 'tags': ['flutter', 'getx'], 'views': 800},
  ];

  final List<PostModel> posts =
      jsonList.map((j) => PostModel.fromJson(j)).toList();

  print("\nAll posts:");
  for (var p in posts) {
    print("  $p");
  }
}
