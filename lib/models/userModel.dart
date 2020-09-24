class UserModel {
  String uid;
  String emailId ;

  UserModel({this.uid, this.emailId});

  String get email{
    return emailId;
  }
}