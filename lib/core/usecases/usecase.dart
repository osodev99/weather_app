import 'package:dartz/dartz.dart';
import '../error/failures.dart';

abstract class UseCase<TypeUseCase, Params> {
  Future<Either<Failure, TypeUseCase>> call(Params params);
}
