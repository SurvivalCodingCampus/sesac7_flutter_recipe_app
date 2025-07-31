import 'package:flutter_recipe_app/feature/search_recipes/data/data_source/filter_search_state_data_source.dart';
import 'package:flutter_recipe_app/feature/search_recipes/data/dto/filter_search_state_dto.dart';
import 'package:hive/hive.dart';

class FilterSearchStateDataSourceImpl implements FilterSearchStateDataSource {
  static String boxName = 'FilterSearchStateDataSource';
  static String objectName = 'FilterSearchState';

  final Future<CollectionBox> _stateBoxFuture;

  FilterSearchStateDataSourceImpl({required BoxCollection boxCollection})
    : _stateBoxFuture = boxCollection.openBox<Map>(boxName);

  @override
  Future<FilterSearchStateDto?> findFilterSearchState() async {
    final stateBox = await _stateBoxFuture;
    final Map? json = await stateBox.get(objectName);

    if (json == null) return null;

    return FilterSearchStateDto.fromJson(json.cast<String, dynamic>());
  }

  @override
  Future<void> saveFilterSeaerchState(FilterSearchStateDto dto) async {
    final stateBox = await _stateBoxFuture;

    await stateBox.put(objectName, dto.toJson());
  }
}
