class User{
  int id;
  String firstname;
  String lastname;
  String phone;
  String email;
  String usertype;
  String gender;
  String city;
  String state;

  User({this.id, this.firstname, this.lastname, this.phone, this.email, this.usertype, this.gender, this.city, this.state });

  factory User.fromJson(Map<String, dynamic> data){
    return User(
      id: data['id'],
      firstname: data['firstname'],
      lastname: data['lastname'],
      phone: data['phone'],
      email: data['email'],
      usertype: data['usertype'],
      gender: data['gender'],
      city: data['city'],
      state: data['state']
    );
  }
  
}