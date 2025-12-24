
class PostModel {
  final String title;
  final String description;
  final String body;
  final String tag;
  final String llmModel;
  final String createdDate;
  final int user_id;
  final int post_id;
  final int likes;

  PostModel({
    required this.title,
    required this.description,
    required this.body,
    required this.tag,
    required this.llmModel,
    required this.createdDate,
    required this.user_id,
    required this.post_id,
    required this.likes,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      title: json['title'],
      description: json['content'],
      body: json['content'],
      tag: json['tags'],
      llmModel: json['llm_model'],
      createdDate: json['created_at'],
      user_id: json['user_id'],
      post_id: json['id'],
      likes: json['likes_count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': post_id,
      'user_id': user_id,
      'title': title,
      'content': body,
      'llm_model': llmModel,
      'created_at': createdDate,
      'tags': tag,
      'lkes_count': likes,
    };
  }
}

class UserModel {
  final String username;
  final String email;
  final String password;
  final String? createdAt;
  final int? id;

  UserModel({
    required this.username,
    required this.email,
    required this.password,
    this.id,
    this.createdAt,
  });

  // UserModel copyWith({})

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      email: json['email'],
      password: json['password'],
      id: json['id'],
      createdAt: json['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'password': password,
    };
  }
}

class LikesModel {
  final int likes;
  final String userId;
  final String postId;

  LikesModel({required this.likes, required this.userId, required this.postId});

  factory LikesModel.fromJson(Map<String, dynamic> json) {
    return LikesModel(
      likes: json['likes'],
      userId: json['user_id'],
      postId: json['post_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id':postId,
      'user_id':userId,
      'likes':likes
    };
  }
}
