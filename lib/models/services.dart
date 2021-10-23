class Services {  
  late final int service_id;  
  late final String service_name; 
  late final int service_price;   
   
  Services({
   required this.service_id, 
   required this.service_name, 
   required this.service_price,
  });  
    
  Services.fromMap(dynamic obj) { 
   this.service_id = obj['service_id'];
   this.service_name = obj['service_name'];
   this.service_price = obj['service_price']; 
  } 
  
  Map<String, dynamic> toMap() {  
    var map = new Map<String, dynamic>();  
    map['service_id'] = service_id;
    map['service_name'] = service_name;
    map['service_price'] = service_price;


    return map;  
  }  
} 