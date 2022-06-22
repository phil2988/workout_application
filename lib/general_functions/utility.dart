import '../app_configs.dart';

String getImageUrl({String exerciseUrl = ""}){
  return storrageAccountUrl + "images/" + (exerciseUrl == "" ? "big-guns.jpg" : exerciseUrl);
}