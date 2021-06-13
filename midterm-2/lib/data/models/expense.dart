class Expense {
  String id;
  String title;
  String expenseAmount;
  String description;

  Expense({this.id, this.title, this.expenseAmount, this.description});

  Expense.fromMap(Map snapshot, String id):
    id = id ?? '',
    title = snapshot['title'] ?? '',
    expenseAmount = snapshot['expenseAmount'] ?? '',
    description = snapshot['description'] ?? '';

  toJson() {
    return {
      "title": title,
      "expenseAmount": expenseAmount,
      "description": description,
    };
  }
}