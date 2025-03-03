class Student {
  // data members
  final int? id;
  final String name;
  final String course;
  final String mobile;
  final int totalFee;
  final int feePaid;

  // constructor
  Student({
    this.id,
    required this.name,
    required this.course,
    required this.mobile,
    required this.totalFee,
    required this.feePaid,
  });

  // named constructor
  // Student.fromMap(Map<String, dynamic> map) {
  //
  //       id = map['id'];
  //       name= map['name'];
  //       course= map['course'];
  //       mobile = map['mobile'];
  //       totalFee =  map['totalFee'];
  //       feePaid = map['feePaid'];
  // }

  // Convert object to Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> studentMap = {
      'id': id,
      'name': name,
      'course': course,
      'mobile': mobile,
      'totalFee': totalFee,
      'feePaid': feePaid,
    };

    return studentMap;
  }
}