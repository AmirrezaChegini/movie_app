/*all usecase classed implement  this class and specift type of T and P
and override call method*/
abstract class Usecase<T, P> {
  Future<T> call(P params);
}
