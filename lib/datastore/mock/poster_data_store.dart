import 'package:food_delivery_single_template/datastore/mock/mock_data_store.dart';
import 'package:food_delivery_single_template/model/poster.dart';

//Mock data store with fake entities to test.
class PosterDataStore extends MockDataStore<Poster> {
  @override
  List<Poster> items = const [
    Poster(
        id: "ban001",
        image: "banner_food1",
        parameterName: "CategoryId",
        parameterValue: "c005"),
    Poster(
      id: "ban002",
      image: "banner_food2",
      parameterName: "CategoryId",
      parameterValue: "c008",
    ),
  ];
}
