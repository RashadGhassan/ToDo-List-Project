import 'package:firebase_database/firebase_database.dart';
import 'package:to_do_list/models/user_details.dart';
import 'package:to_do_list/models/to_do_item.dart';

class FirebaseService {
  Future<UserDetails?> getUserDetails(String useruid) async {
    try {
      DatabaseReference refh = FirebaseDatabase.instance.ref().child("users");
      DatabaseEvent event = await refh.child(useruid).once();
      if (event.snapshot.value != null) {
        Map<dynamic, dynamic> snapdata = event.snapshot.value as dynamic;
        return UserDetails.fromMap(snapdata);
      } else {
        return null;
      }
    } catch (e) {
      // ignore: avoid_print
      print("here ---> ${e.toString()}");
    }
    return null;
  }

  Future<List> getTodos(String useruid) async {
    try {
      DatabaseReference refh = FirebaseDatabase.instance.ref().child("task");
      DatabaseEvent event = await refh.child(useruid).once();
      if (event.snapshot.value != null) {
        dynamic temp = event.snapshot.value;
        List<dynamic> tempList = [];
        for (dynamic x in temp.keys) {
          if (temp[x]['done'] == "true") {
            temp[x]["done"] = true;
          } else {
            temp[x]["done"] = false;
          }
          tempList.add(ToDo.fromMap(temp[x]));
        }
        List snapdata = tempList as dynamic;
        return snapdata;
      } else {
        return [];
      }
    } catch (e) {
      // ignore: avoid_print
      print("here ---> ${e.toString()}");
    }
    return [];
  }
}
