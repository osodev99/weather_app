class ServerException implements Exception {
  final String message;
  ServerException([this.message = 'Ocurrio un error en el servidor']);
}

class NetworkException implements Exception {
  final String message;
  NetworkException([this.message = 'Ocurrio un error de red']);
}
