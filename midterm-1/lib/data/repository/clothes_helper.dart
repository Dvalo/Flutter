import 'package:flutter_midterm/data/models/dummy_data.dart';
import 'package:flutter_midterm/data/models/clothes_model.dart';

class ClothesRepository {
  void addClothing(Clothes clothing) {
    DUMMY_DATA.add(clothing);
  }

  void removeClothing(int id) {
    DUMMY_DATA.removeWhere((element) => element.id == id);
  }

  void editClothing(Clothes clothing, int index) {
    DUMMY_DATA.replaceRange(index, index + 1, [clothing]);
  }
}