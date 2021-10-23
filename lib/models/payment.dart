class Payment {  
  late final int id;
  late final int user_id;  
  late final int event_id; 
  late final String card_no;   
  late final String holder_name; 
  late final String cvv; 
  late final int amount; 
  late final String expiry_date; 
   
  Payment({
  required this.id, 
   required this.user_id, 
   required this.event_id, 
   required this.card_no,
   required this.holder_name,
   required this.cvv,
   required this.amount,
   required this.expiry_date
  });  
    
  Payment.fromMap(dynamic obj) { 
   this.id = obj['id'];
   this.user_id = obj['user_id'];
   this.event_id = obj['event_id'];
   this.card_no = obj['card_no']; 
   this.holder_name = obj['holder_name'];
   this.cvv = obj['cvv'];
   this.amount = obj['amount']; 
   this.expiry_date = obj['expiry_date'];
  } 
  
  Map<String, dynamic> toMap() {  
    var map = new Map<String, dynamic>();  
    map['id']= id;
    map['user_id'] = user_id;
    map['event_id'] = event_id;
    map['card_no'] = card_no;
    map['holder_name'] = holder_name;
    map['cvv'] = cvv;
    map['amount'] = amount;
    map['expiry_date'] = expiry_date;

    return map;  
  }  
} 