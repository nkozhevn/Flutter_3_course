class Dog {
  final String url;

  const Dog({
    required this.url,
  });

  factory Dog.fromJson(Map<String, dynamic> json) {
    return Dog(
      url: json['url'],
    );
  }
}