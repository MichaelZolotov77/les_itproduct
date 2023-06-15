class ResponsModel {
  final dynamic error;
  final dynamic data;
  final dynamic message;

  ResponsModel({this.error, this.data, this.message});

  Map<String, dynamic> toJson() => {
        "error": error ?? "",
        "data": data ?? "",
        "message": message ?? "",
      };
}
