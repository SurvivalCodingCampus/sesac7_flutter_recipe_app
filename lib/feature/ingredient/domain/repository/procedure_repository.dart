abstract interface class ProcedureRepository {
  Future<List<String>> fetchProcedure(String recipeId);
}
