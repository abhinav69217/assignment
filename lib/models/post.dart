import 'package:flutter/material.dart';

class Comment {
  final String username;
  final String content;
  final String date;

  Comment({
    required this.username,
    required this.content,
    required this.date,
  });
}

class Post {
  final String username;
  final String date;
  final String title;
  final String caption;
  final String? imageUrl;
  final List<Comment> comments;

  Post({
    required this.username,
    required this.date,
    required this.title,
    required this.caption,
    this.imageUrl,
    required this.comments,
  });
}
