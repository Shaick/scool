import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:scool/app/data/model/entry_model.dart';

class FirestoreProvider {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _db = FirebaseFirestore.instance;
  //FirebaseStorage _storage = FirebaseStorage.instance;
  GetStorage box = GetStorage('login_firebase');
  bool loading = false;

  User get user => _auth.currentUser;

  //Get Entriers / Obter entradas
  Stream<List<Entry>> getEntries() {
    //Consulta de fluxo instantâneo mapeada /Query stream snapshot map
    return _db.collection('medico').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Entry.fromJson(doc.data())).toList());
  }

  //Upsert = Create/Update -> Se o registro não existir, crie, se já exite, atualize;
  Future<void> setEntry(Map entry) async {
    var options = SetOptions(merge: true);
    return await _db.collection('Professor').doc(user.uid).set(entry, options);
  } // definir entrada

  Future<void> setCia(Map entry) async {
    var options = SetOptions(merge: true);
    return await _db.collection('Empresa').doc(user.uid).set(entry, options);
  }

  //Delete
  Future<void> removeEntry(String entryId) async {
    return await _db.collection('medico').doc(entryId).delete();
  }
}
