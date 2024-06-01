class NoteEntity {

  final BigInt id;
  final String owner;
  final String title;
  final String body;

  NoteEntity({required this.id,required this.owner, required this.title, required this.body});

  // copy method

  NoteEntity copy([BigInt? id, String? owner, String? title, String? body]) {
    return NoteEntity(id: id??this.id, owner: owner??this.owner, title: title??this.title, body: body??this.body);
  }
}