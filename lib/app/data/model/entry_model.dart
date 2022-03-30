class Entry {
  final String entryId;
  final String cpf;
  final String date;
  //final String datebirth;
  final String photoUrl;
  final String phone;
  final String name;
  final String lastname;
  final String job;
  final String uf;
  final String city;
  final String district;
  final String address;
  final String email;

  Entry(
      {this.entryId,
      this.date,
      this.cpf,
      //this.datebirth,
      this.photoUrl,
      this.phone,
      this.name,
      this.lastname,
      this.job,
      this.uf,
      this.city,
      this.district,
      this.address,
      this.email});

  factory Entry.fromJson(Map<String, dynamic> json) {
    return Entry(
        entryId: json['entryId'],
        cpf: json['cpf'],
        date: json['date'],
        //datebirth: json['datebirth'],
        photoUrl: json['photoUrl'],
        phone: json['phone'],
        name: json['name'],
        lastname: json['lastname'],
        email: json['email'],
        job: json['job'],
        uf: json['uf'],
        city: json['city'],
        district: json['district'],
        address: json['address']);
  }

  Map<String, dynamic> toMap() {
    return {
      'entryId': entryId,
      'cpf': cpf,
      'date': date,
      //'datebirth': datebirth,
      'photoUrl': photoUrl,
      'phone': phone,
      'name': name,
      'lastname': lastname,
      'email': email,
      'job': job,
      'uf': uf,
      'city': city,
      'district': district,
      'address': address,
      //'docsok': false
    };
  }
}
