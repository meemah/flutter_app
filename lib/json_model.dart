class CategoriesList1{
  List<Categories> categories;

  CategoriesList1({this.categories});

  CategoriesList1.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = new List<Categories>();
      json['categories'].forEach((v) {
        categories.add(new Categories.fromJson(v));
      });
    }
  }

  
}

class Categories {
  String name;
  List<Contents> contents;

  Categories({this.name, this.contents});

  Categories.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['contents'] != null) {
      contents = new List<Contents>();
      json['contents'].forEach((v) {
        contents.add(new Contents.fromJson(v));
      });
    }
  }

  
}

class Contents {
  String name;
  String price;
  String image;

  Contents({this.name, this.price, this.image});

  Contents.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    image = json['image'];
  }


}
