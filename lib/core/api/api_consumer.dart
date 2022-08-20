abstract class ApiConsumer<Type> {
  Future<Type> get(String path, {Map<String, dynamic> queryParameters});
  Future<Type> post(String path,
      {Map<String, dynamic>? queryParameters, Map<String, dynamic> body});
  Future<Type> put(String path,
      {Map<String, dynamic>? queryParameters, Map<String, dynamic> body});
}
