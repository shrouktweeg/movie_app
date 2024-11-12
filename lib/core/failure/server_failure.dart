import 'package:movie_app/core/failure/failure.dart';

class ServerFailure extends Failure{
String? error,errorCode;
String?message;

  ServerFailure({required super.statusCode,super.messageAr,super.messageEn,this.error,this.message,this.errorCode});
   ServerFailure copyWith({
     String?statusCode,
     String?error,
     String?messageAr,
     String?messageEn,
     String?errorCode,
     String?message}){
    return ServerFailure(statusCode: statusCode??this.statusCode,
    error: error??this.error,
      errorCode: errorCode??this.errorCode,
      message: message??this.message,
      messageAr: messageAr??this.messageAr,
      messageEn: messageEn??this.messageEn,
    );
  }


}