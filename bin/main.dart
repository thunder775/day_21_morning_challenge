// Challenge 1
// Write test cases for the next challenges and make sure to include boundary conditions
// DO THIS FIRST

// Challenge 2
// Track the Robot
// This robot roams around a 2D grid. It starts at (0, 0) facing North.
// After each time it moves, the robot rotates 90 degrees clockwise.
// Given the amount the robot has moved each time, you have to calculate the robot's final position.
// Example
// trackRobot([20, 30, 10, 40]) ➞ [-10, 10]

List<int> trackRobot(List<int> movements) {
  List<int> finalCoordinates = [0, 0];
  bool moveX = false;
  bool moveY = true;
  int count = 0;
  for (int x in movements) {
    if (moveY && count % 2 == 0) {
      // y's positive move with count divisible by 2
      finalCoordinates[1] += x;
      moveY = false;
      moveX = true;
      continue;
    }
    if (moveX && count % 2 == 0) {
      // x's positive move with count divisible by 2
      finalCoordinates[0] += x;

      moveX = false;
      moveY = true;
      count++;
      continue;
    }
    if (moveY && count % 2 != 0) {
      // y's negative move with count !divisible by 2
      finalCoordinates[1] -= x;

      moveX = true;
      moveY = false;
      continue;
    }
    if (moveX && count % 2 != 0) {
      // x's negative move with count !divisible by 2
      finalCoordinates[0] -= x;

      moveX = false;
      moveY = true;
      count++;
      continue;
    }
  }
  return finalCoordinates;
}

// Challenge 3
// Vending Machine
// Your task is to create a function that simulates a vending machine.
// Given an amount of money (in cents ¢ to make it simpler) and a productNumber,
// the vending machine should output the correct product name and give back the
// correct amount of change.

// The coins used for the change are the following: [100, 50, 20, 10, 5]

// The return value is a map with 2 properties:
// product: the product name that the user selected.
// change: a list of coins returned (can be empty, must be sorted in descending order).

List<Map> products = [
  {'number': 1, 'price': 100, 'name': 'Orange juice'},
  {'number': 2, 'price': 200, 'name': 'Soda'},
  {'number': 3, 'price': 150, 'name': 'Chocolate snack'},
  {'number': 4, 'price': 250, 'name': 'Cookies'},
  {'number': 5, 'price': 180, 'name': 'Gummy bears'},
  {'number': 7, 'price': 120, 'name': 'Crackers'},
  {'number': 8, 'price': 220, 'name': 'Potato chips'},
  {'number': 9, 'price': 80, 'name': 'Small snack'},
];

Map changeCalculator(int paidAmount, int productNumber) {
  List currency = [100, 50, 20, 10, 5];
  int change;
  String name;
  for (Map x in products) {
    if (x['number'] == productNumber) {
      change = x['price'];
      name = x['name'];
    }
  }
  change = paidAmount - change;
  if (change < 0) {
    return null;
  }
  List<int> changeReturn = [];
  currency.forEach((value){
//    print(value);

    int coinCount = change~/ value;
    change = change%value;


    changeReturn.addAll(List.generate(coinCount,(int x)=> value));
//    print(changeReturn);
  });
  print({'product':name  ,'change':changeReturn});
return {'product':name  ,'change':changeReturn};
}

main() {
  print(trackRobot([20, 30, 10, 40]));
  changeCalculator(460, 9);
}
