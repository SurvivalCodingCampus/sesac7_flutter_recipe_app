import 'package:flutter_recipe_app/feature/search_recipes/data/data_source/filter_search_state_data_source.dart';
import 'package:flutter_recipe_app/feature/search_recipes/data/dto/filter_search_state_dto.dart';
import 'package:hive/hive.dart';

class FilterSearchStateDataSourceImpl implements FilterSearchStateDataSource {
  static String boxName = 'FilterSearchStateDataSource';
  static String objectName = 'FilterSearchState';

  final BoxCollection _boxCollection;

  FilterSearchStateDataSourceImpl({required BoxCollection boxCollection})
    : _boxCollection = boxCollection;

  @override
  Future<FilterSearchStateDto?> findFilterSearchState() async {
    final stateBox = await _boxCollection.openBox<Map<String, dynamic>>(
      boxName,
    );
    final json = await stateBox.get(objectName);

    if (json == null) return null;

    return FilterSearchStateDto.fromJson(json);
  }

  @override
  Future<void> saveFilterSeaerchState(FilterSearchStateDto dto) async {
    final stateBox = await _boxCollection.openBox<Map<String, dynamic>>(
      boxName,
    );

    await stateBox.put(objectName, dto.toJson());
  }
}
