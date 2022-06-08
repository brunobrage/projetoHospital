// ignore_for_file: unnecessary_null_comparison, file_names

class Patient {
  String patientId;
  String patientName;
  String patientCpf;
  String patientEmail;

  Patient({
    this.patientId = '',
     this.patientName = '',
     this.patientCpf,
     this.patientEmail,
  });
  factory Patient.fromjson(Map<String, dynamic> json) {
    return Patient(
      patientId: json['patientId'] as String,
      patientName: json['patientName'] as String,
      patientEmail: json['patientEmail'] as String,
      patientCpf: json['patientCpf'] as String,
    );
  }
  Map<String, dynamic> toJsonAdd() {
    return {
      "patientName": patientName != null ? patientName.toString() : '',
      "patientEmail": patientEmail != null ? patientEmail.toString() : '',
      "patientCpf": patientCpf != null ? patientCpf.toString() : '',
    };
  }

  Map<String, dynamic> toJsonUpdate() {
    return {
      "patientId": patientId != null ? patientId.toString() : '',
      "patientName": patientName != null ? patientName.toString() : '',
      "patientEmail": patientEmail != null ? patientEmail.toString() : '',
      "patientCpf": patientCpf != null ? patientCpf.toString() : '',
    };
  }
}
