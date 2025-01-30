import 'package:finance_app_michael/models/transaction_model.dart';

class TransactionViewModel {
  List<Transaction> getTodayTransactions() {
    return [
      Transaction(
        title: "Walmart",
        subtitle: "Dec 25",
        dateTime: "11.41 AM",
        amount: "-\$68.00",
        imageUrl: "assets/images/walmart.png",
        isExpense: true,
      ),
      Transaction(
        title: "Uber",
        subtitle: "Dec 25",
        dateTime: "08.48 AM",
        amount: "-\$24.00",
        imageUrl: "assets/images/uber.png",
        isExpense: true,
      ),
      Transaction(
        title: "Lily Brown",
        subtitle: "Dec 25",
        dateTime: "08.12 AM",
        amount: "-\$480.00",
        imageUrl: "assets/images/woman.jpg",
        isExpense: true,
      ),
    ];
  }

  List<Transaction> getYesterdayTransactions() {
    return [
      Transaction(
        title: "Lindsey Bator",
        subtitle: "Dec 24",
        dateTime: "08.20 PM",
        amount: "-\$560.00",
        imageUrl: "assets/images/woman.jpg",
        isExpense: true,
      ),
      Transaction(
        title: "Walmart",
        subtitle: "Dec 24",
        dateTime: "11.31 AM",
        amount: "-\$48.00",
        imageUrl: "assets/images/walmart.png",
        isExpense: true,
      ),
      Transaction(
        title: "Alfonso Dokidis",
        subtitle: "Dec 24",
        dateTime: "09.12 AM",
        amount: "+\$120.00",
        imageUrl: "assets/images/man.png",
        isExpense: false,
      ),
      Transaction(
        title: "Uber",
        subtitle: "Dec 24",
        dateTime: "08.42 AM",
        amount: "-\$24.00",
        imageUrl: "assets/images/girl.png",
        isExpense: true,
      ),
    ];
  }
}