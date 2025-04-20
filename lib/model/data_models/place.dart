abstract class Place{
  int? id;
  String? name;
  String? classType;
  int? averagePricePerAdult;
  int? score;
  int? placeType;
  int? rating;
  Null imageSource;

  Place(
      {this.id,
        this.name,
        this.classType,
        this.averagePricePerAdult,
        this.score,
        this.placeType,
        this.rating,
        this.imageSource});

  Place.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    classType = json['classType'];
    averagePricePerAdult = json['averagePricePerAdult'];
    score = json['score'];
    placeType = json['placeType'];
    rating = json['rating'];
    imageSource = json['imageSource'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['classType'] = classType;
    data['averagePricePerAdult'] = averagePricePerAdult;
    data['score'] = score;
    data['placeType'] = placeType;
    data['rating'] = rating;
    data['imageSource'] = imageSource;
    return data;
  }
}