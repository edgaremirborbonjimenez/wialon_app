class AuthResponse {
  final String sessionId;

  AuthResponse({required this.sessionId});

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      AuthResponse(sessionId: json['eid']);
}
