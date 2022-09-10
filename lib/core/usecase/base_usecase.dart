import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';

abstract class BaseUsecase<Type, Parameters> {
  Future<Either<Failure,Type>> call(Parameters parameters);
}

class NoParameters extends Equatable {
  const NoParameters();
  
  @override
  List<Object?> get props => [];
}