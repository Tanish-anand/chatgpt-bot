class Transaction {
  final int? id;
  final String description;
  final double amount;
  final String date;

  Transaction({this.id, required this.description, required this.amount, required this.date});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'amount': amount,
      'date': date,
    };
  }

  static Transaction fromMap(Map<String, dynamic> map) {
    return Transaction(
      id: map['id'],
      description: map['description'],
      amount: map['amount'],
      date: map['date'],
    );
  }
}
