import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final int statusCode;
  final String statusMessage;
  final bool success;

  const ErrorMessageModel({required this.statusCode, required this.statusMessage, required this.success});

  factory ErrorMessageModel.fromJson(Map<String,dynamic> jsonData){
    return ErrorMessageModel(statusCode: jsonData["status_code"], statusMessage: jsonData["status_message"], success: jsonData["success"]);
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => [statusCode,statusMessage,success];
}