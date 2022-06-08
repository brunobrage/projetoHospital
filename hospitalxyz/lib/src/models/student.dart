// ignore_for_file: unnecessary_null_comparison, file_names

class Student {
  String studentId;
  String studentName;
  String studentCpf;
  String studentEmail;

  Student({
    this.studentId = '',
     this.studentName = '',
     this.studentCpf,
     this.studentEmail,
  });
  factory Student.fromjson(Map<String, dynamic> json) {
    return Student(
      studentId: json['studentId'] as String,
      studentName: json['studentName'] as String,
      studentEmail: json['studentEmail'] as String,
      studentCpf: json['studentCpf'] as String,
    );
  }
  Map<String, dynamic> toJsonAdd() {
    return {
      "studentName": studentName != null ? studentName.toString() : '',
      "studentEmail": studentEmail != null ? studentEmail.toString() : '',
      "studentCpf": studentCpf != null ? studentCpf.toString() : '',
    };
  }

  Map<String, dynamic> toJsonUpdate() {
    return {
      "studentId": studentId != null ? studentId.toString() : '',
      "studentName": studentName != null ? studentName.toString() : '',
      "studentEmail": studentEmail != null ? studentEmail.toString() : '',
      "studentCpf": studentCpf != null ? studentCpf.toString() : '',
    };
  }
}
