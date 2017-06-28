// This is the menu code for C++ in a Bloodshed compiler.
// Last updated in 2/10/2011, copyright 6/28/2017 boaromayo
#include <iostream>
#include <math.h>

int menu();
void bank();
void tip();
void letter(int, char);
void wage();
float currencyformat(float);

// main function
int main() {
    int choose;
    while (choose != 5) {
        choose = menu();
        switch(choose) {
                       case 1:
                            bank();
                            break;
                       case 2:
                            tip();
                            break;
                       case 3:
                            letter(10, 'X');
                            break;
                       case 4:
                            wage();
                            break;
                       case 5:
                            std::cout << std::endl;
                            break;
                       default:
                            std::cout << "Type in another number please." << "\n\n";
                            break;
                       }
    }
    return 0;
}

// main menu function
int menu() {    
    int choose;

    std::cout << "**** Menu ****";
    std::cout << "\n" << "(1) Bank deposit.";
    std::cout << "\n" << "(2) Tip calculator.";
    std::cout << "\n" << "(3) 100 X's.";
    std::cout << "\n" << "(4) Wage calculator.";
    std::cout << "\n" << "(5) Quit." << std::endl;

    std::cin >> choose;
    std::cout << "\n";

    return choose;
}

// bank deposit function
void bank() {
      float princ, rate;
      int year;
      float result;

      std::cout << "Type in a deposit rate (000.00): ";
      std::cin >> princ;
      std::cout << "Type in the interest rate: ";
      std::cin >> rate;

      rate = (rate / 100);

      std::cout << "Type in the number of years: ";
      std::cin >> year;

      result = princ * pow(1 + rate, year);
      rate = (rate * 100);

      // formatting total to two decimal places
      currencyformat(result);

      // display the answer
      std::cout << "The amount you will have in " << year
           << " years with " << rate << "% interest is $" 
           << result << ".\n\n";
     
}

// tipping calc function
void tip() {
      float bill, tippct, tip;

      std::cout << "Type in the total cost of the bill: ";
      std::cin >> bill;
      std::cout << "Type in the tipping rate: ";
      std::cin >> tippct;

      tippct = (tippct / 100);

      tip = (bill * tippct);
      if (tip < 1)
         tip = 1.00;

      // formatting total cost of the tip   
      currencyformat(tip);

      // print out results
      std::cout << "The tip will be $" << tip << ".\n\n";
      
}

// letter matrix function
void letter(int x, char c) {
     for (int d = 0; d < x; d++) {
         for (int e = 0; e < x; e++) {
             std::cout << c;
         }
         std::cout << "\n";
     }
     std::cout << "\n";
}

// the function for wage calculator
void wage() {
      float wage;
      int weekly;
      float grosspay;

      std::cout << "Put in your weekly working hours: ";
      std::cin >> weekly;
      
      // if weekly working hours are 40 or below, put "not enough hours."
      if (weekly <= 40) {
         std::cout << "Not enough hours worked." << "\n\n";
      } else {
         std::cout << "What is your hourly wage: ";
         std::cin >> wage;

         grosspay = (40 * wage) + (1.5 * wage * (weekly - 40));

         // format the grosspay
         currencyformat(grosspay);

         std::cout << "Your gross pay is $" << grosspay << ".\n\n";
     }
}


// function for formatting currency.
float currencyformat(float x) {     
      // format the answer into two places after the decimal
      std::cout.setf(ios_base::fixed);
      std::cout.setf(ios_base::showpoint);
      std::cout.precision(2);

      return x;
}
