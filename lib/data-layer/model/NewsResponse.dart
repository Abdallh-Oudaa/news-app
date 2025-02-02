import 'package:news_app/data-layer/model/Source.dart';

import 'Source.dart';

class NewsResponse {
  NewsResponse({
    this.status,
    this.totalResults,
    this.code,
    this.message,
    this.articles,
  });

  NewsResponse.fromJson(dynamic json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];

    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles?.add(News.fromJson(v));
      });
    }
  }
  String? status;
  int? totalResults;
  String? code;
  String? message;
  List<News>? articles;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['code'] = code;
    map['message'] = message;

    map['totalResults'] = totalResults;
    if (articles != null) {
      map['articles'] = articles?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class News {
  News({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  News.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['source'] = source;
    map['author'] = author;
    map['title'] = title;
    map['url'] = url;
    map['description'] = description;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;

    return map;
  }
}
