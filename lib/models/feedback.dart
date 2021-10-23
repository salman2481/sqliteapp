class FeedbackC {  
  late final int id;
  late final int user_id;  
  late final int event_id; 
  late final int date;


   
  FeedbackC({
   required this.id, 
   required this.user_id, 
   required this.event_id, 
   required this.date,
  });  
    
  FeedbackC.fromMap(dynamic obj) { 
   this.id = obj['id'];
   this.user_id = obj['user_id'];
   this.event_id = obj['event_id'];
   this.date = obj['date']; 
   
  } 
  
  Map<String, dynamic> toMap() {  
    var map = new Map<String, dynamic>();  
    map['id'] = id;
    map['user_id'] = user_id;
    map['event_id'] = event_id;
    map['date'] = date;
    
    return map;  
  }  
} 