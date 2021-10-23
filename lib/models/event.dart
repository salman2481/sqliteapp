class Events {  
  late final int id;
  late final int user_id;  
  late final String daytime; 
  late final String title;   
  late final String feedback_status;  
  late final String event_date;  
  late final String attendees;
  late final String type;  

   
  Events({
   required this.id,
   required this.user_id, 
   required this.daytime,
   required this.title,
   required this.feedback_status,
   required this.event_date,
   required this.attendees,
   required this.type,
  });  
    
  Events.fromMap(dynamic obj) { 
   this.id = obj['id'];
   this.user_id = obj['user_id'];
   this.daytime = obj['daytime']; 
   this.title = obj['title'];
   this.feedback_status = obj['feedback_status'];
   this.event_date = obj['event_date'];
   this.attendees = obj['attendees']; 
   this.type = obj['type'];
  } 
  
  Map<String, dynamic> toMap() {  
    var map = new Map<String, dynamic>();  
    map['id'] = id;
    map['user_id'] = user_id;
    map['daytime'] = daytime;
    map['title'] = title;
    map['feedback_status'] = feedback_status;
    map['event_date'] = event_date;
    map['attendees'] = attendees;
    map['type'] = type;

    return map;  
  }  
} 