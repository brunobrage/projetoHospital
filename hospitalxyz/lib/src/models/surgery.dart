// ignore_for_file: unnecessary_null_comparison, file_names

class Surgery {
  String surgeryId;
  String surgeryName;
  String doctorName;
  String patientName;

  Surgery({
    this.surgeryId = '',
     this.surgeryName = '',
     this.doctorName,
     this.patientName,
  });
  factory Surgery.fromjson(Map<String, dynamic> json) {
    return Surgery(
      surgeryId: json['surgeryId'] as String,
      surgeryName: json['surgeryName'] as String,
      doctorName: json['doctorName'] as String,
      patientName: json['patientName'] as String,
    );
  }
  Map<String, dynamic> toJsonAdd() {
    return {
      "surgeryName": surgeryName != null ? surgeryName.toString() : '',
      "doctorName": doctorName != null ? doctorName.toString() : '',
      "patientName": patientName != null ? patientName.toString() : '',
    };
  }

  Map<String, dynamic> toJsonUpdate() {
    return {
      "surgeryId": surgeryId != null ? surgeryId.toString() : '',
      "surgeryName": surgeryName != null ? surgeryName.toString() : '',
      "doctorName": doctorName != null ? doctorName.toString() : '',
      "patientName": patientName != null ? patientName.toString() : '',
    };
  }
}
