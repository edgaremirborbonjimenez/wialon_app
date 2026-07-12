enum HttpErrorResponse {
  unauthorized(1);

  final int value;
  const HttpErrorResponse(this.value);
}
