
class CustomException implements Exception {
  final Map<String,dynamic> _message;
  final String _prefix;

  CustomException(this._message, this._prefix);

  String toString() {
    return "$_prefix$_message";
  }
  Map<String,dynamic> get response => _message ;
}

class FetchDataException extends CustomException {
  FetchDataException([Map<String,dynamic>? message])
      : super(message!, "Error During Communication: ");

}

class BadRequestException extends CustomException {
  BadRequestException([message]) : super(message,'Invalid Request');

}

class UnauthorisedException extends CustomException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InternalServerError extends CustomException{
  InternalServerError([message]) : super(message,"Internal Server: ");
}

class InvalidInputException extends CustomException {
  InvalidInputException([Map<String,dynamic>? message]) : super(message!, "Invalid Input: ");
}

class UnknownResource extends CustomException {
  UnknownResource([Map<String,dynamic>? message]) : super(message!, "Unknown Resource: ");

}