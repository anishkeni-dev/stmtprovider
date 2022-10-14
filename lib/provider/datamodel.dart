class DataModel{
  int id;
  String price;
  String image;
  String title;
  String rating;
  String desc;
  bool isincart;

  DataModel({required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.rating,
    required this.desc,
    this.isincart = false,

  });


  factory DataModel.fromJson(Map<String,dynamic> json){
    return DataModel(id: json['id'],title: json['title'], price: json['price'].toString(), rating: json['rating']['rate'].toString(), image: json['image'], desc: json['description']);
  }


}


