class ResponseModel {
  final bool status;
  final String message;
  ResponseModel({required this.status, required this.message});
  factory ResponseModel.fromMap(Map<String, dynamic> map) {
    return ResponseModel(
      status: map['status'] as bool,
      message: map['message'] as String,
    );
  }
}
