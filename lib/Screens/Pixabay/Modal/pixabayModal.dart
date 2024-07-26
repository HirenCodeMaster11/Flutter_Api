class Pixabay
{
  late List http;

  Pixabay({required this.http});

  factory Pixabay.fromJson(Map m1)
  {
    return Pixabay(http: (m1['hits'] as List).map((e) => Hit.fromJson(e),).toList());
  }
}

class Hit
{
  late String web;

  Hit({required this. web});

  factory Hit.fromJson(Map m1)
  {
    return Hit(web: m1['webformatURL']);
  }
}