abstract class Usecase<Response, Request> {
  Future<Response> call(Request request);
}
