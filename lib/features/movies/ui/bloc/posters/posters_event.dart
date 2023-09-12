abstract class PostersEvent {}

class GetPostersEvent extends PostersEvent {
  final int genreID;
  GetPostersEvent({this.genreID = 0});
}
