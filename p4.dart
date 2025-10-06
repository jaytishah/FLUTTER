1.	Input Controllers

TextEditingController();
 
TextEditingController();
 
TextEditingController();
 
2.	EMI Calculation Function

void calculateEMI() {
 double principal = double.tryParse(loanController.text) ?? 0;
 double annualRate = double.tryParse(rateController.text) ?? 0;
 double months = double.tryParse(tenureController.text) ?? 0;

 if (principal <= 0 || annualRate <= 0 || months <= 0) {
 
	totalPayment = null;
	totalInterest = null;
	});
	return;
 }

 double monthlyRate = annualRate / (12 * 100);
 double emiCalc = (principal * monthlyRate * pow(1 + monthlyRate, months)) /
	(pow(1 + monthlyRate, months) - 1);

 setState(() {
	emi = emiCalc;
	totalPayment = emiCalc * months;
	totalInterest = totalPayment! - principal;
 });
}

3.	Displaying Results

if (emi != null)
 Column(
	children: [
	Text("EMI: ₹${emi!.toStringAsFixed(2)}",
	style: const TextStyle(
	fontSize: 22, fontWeight: FontWeight.bold)),
	const SizedBox(height: 10),
 
₹${totalPayment!.toStringAsFixed(2)}",
	style: const TextStyle(fontSize: 18)),
	const SizedBox(height: 10),
 
₹${totalInterest!.toStringAsFixed(2)}",
	style: const TextStyle(fontSize: 18)),
	],
 ),
 
