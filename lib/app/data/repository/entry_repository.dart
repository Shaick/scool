import 'package:get_storage/get_storage.dart';
import 'package:scool/app/data/model/entry_model.dart';
import 'package:scool/app/data/provider/firestore_provider.dart';

class EntryRepository {
  final entryProvider = FirestoreProvider();
  final box = GetStorage('login_firebase');

  Stream<List<Entry>> getEntries() {
    return entryProvider.getEntries();
  }

  Future<void> setAluno() async {
    Map<String, dynamic> entry = {
      "id": entryProvider.user.uid,
      "nome": entryProvider.user.displayName,
      "email": entryProvider.user.email
    };

    return await entryProvider.setEntry(entry);
  }

  Future<void> setProf() async {
    Map<String, dynamic> entry = {
      "id": entryProvider.user.uid,
      "nome": entryProvider.user.displayName,
      "email": entryProvider.user.email,
      "cpf": box.read("entry")["cpf"],
      "rp": box.read("entry")["rp"],
      "fone": box.read("entry")["fone"],
      "uf": box.read("entry")["uf"],
      "cidade": box.read("entry")["cidade"],
      "cep": box.read("entry")["cep"],
      "bairro": box.read("entry")["bairro"],
      "endereco": box.read("entry")["endereco"],
      "complemento": box.read("entry")["complemento"]
    };

    return await entryProvider.setEntry(entry);
  }

  Future<void> setCia() async {
    Map<String, dynamic> entry = {
      "id": entryProvider.user.uid,
      "nome": entryProvider.user.displayName,
      "email": entryProvider.user.email,
      "cnpj": box.read("entry")["cnpj"],
      "rp": box.read("entry")["rp"],
      "fone": box.read("entry")["fone"],
      "uf": box.read("entry")["uf"],
      "cidade": box.read("entry")["cidade"],
      "cep": box.read("entry")["cep"],
      "bairro": box.read("entry")["bairro"],
      "endereco": box.read("entry")["endereco"],
      "complemento": box.read("entry")["complemento"]
    };

    return await entryProvider.setCia(entry);
  }

  Future<void> removeEntry(String entryId) async {
    return await entryProvider.removeEntry(entryId);
  }
}
