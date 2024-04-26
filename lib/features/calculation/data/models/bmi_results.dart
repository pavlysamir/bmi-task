class BmiResultsModel {
  double? height;
  double? weight;
  double? age;
  String? dateTime;

  BmiResultsModel({
    required this.height,
    required this.weight,
    required this.age,
    required this.dateTime,
  });

  BmiResultsModel.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    weight = json['weight'];
    age = json['age'];
    dateTime = json['dateTime'];
  }

  Map<String, dynamic> toMap() {
    return {
      'height': height,
      'weight': weight,
      'age': age,
      'dateTime': dateTime,
    };
  }
}
