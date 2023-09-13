class QuotesModel {
  String? quotes;
  String? author;
  List<String>? colors;

  QuotesModel(this.quotes, this.author, this.colors);

  factory QuotesModel.fromMap(Map map) {
    return QuotesModel(map["quotes"], map["author"], map["colors"]);
  }
}
