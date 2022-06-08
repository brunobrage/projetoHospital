// ignore_for_file: unnecessary_null_comparison, file_names

class Doctor {
  String doctorId;
  String doctorName;
  String doctorCpf;
  String doctorCrm;

  Doctor({
    this.doctorId = '',
     this.doctorName = '',
     this.doctorCpf,
     this.doctorCrm,
  });
  factory Doctor.fromjson(Map<String, dynamic> json) {
    return Doctor(
      doctorId: json['doctorId'] as String,
      doctorName: json['doctorName'] as String,
      doctorCrm: json['doctorCrm'] as String,
      doctorCpf: json['doctorCpf'] as String,
    );
  }
  Map<String, dynamic> toJsonAdd() {
    return {
      "doctorName": doctorName != null ? doctorName.toString() : '',
      "doctorCrm": doctorCrm != null ? doctorCrm.toString() : '',
      "doctorCpf": doctorCpf != null ? doctorCpf.toString() : '',
    };
  }

  Map<String, dynamic> toJsonUpdate() {
    return {
      "doctorId": doctorId != null ? doctorId.toString() : '',
      "doctorName": doctorName != null ? doctorName.toString() : '',
      "doctorCrm": doctorCrm != null ? doctorCrm.toString() : '',
      "doctorCpf": doctorCpf != null ? doctorCpf.toString() : '',
    };
  }
}
