class User {  
  late final int id;  
  late final String name; 
  late final String email;   
  late final String contact;
  late final String address;
  late final String status;
  late final String username;
  late final String password;
  late final String type;  
   
  User({
   required this.id, 
   required this.name, 
   required this.email,
   required this.contact,
   required this.address,
   required this.status,
   required this.username,
   required this.password,
   required this.type
  });  
    
  User.fromMap(dynamic obj) { 
   this.id = obj['id'];
   this.name = obj['name'];
   this.email = obj['email'];
   this.contact = obj['contact'];
   this.address = obj['address'];  
   this.status = obj['status'];  
   this.username = obj['username'];  
   this.password = obj['password'];  
   this.type = obj['type'];  
  } 
  
  Map<String, dynamic> toMap() {  
    var map = new Map<String, dynamic>();  
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['contact'] = contact;
    map['address'] = address;
    map['status'] = status;
    map['username'] = username;
    map['password'] = password; 
    map['type'] = type;

    return map;  
  }  
 

  @override
  String toString() {
    return 'User{id: $id, name: $name, email: ${email},contact: ${contact}, password: ${password}';
  }
} 