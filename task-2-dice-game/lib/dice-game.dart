import 'dart:io';
import 'dart:math';

void main() {
  print("Type exit to quit the game");
  print("Type 'start' to start the round");
  diceGame();
}

diceGame() {
  int round = 0;
  int playerScore = 0;
  int computerScore = 0;
  while (true) {
    String gameCommand = stdin.readLineSync()!;

    if (gameCommand.toLowerCase() == "start") {
      round += 1;
      print("Starting the round");

      // Roll dice for player & computer
      print("Rolling dice twice for player");
      int playerTotal = randomNumber(1, 6, 2);
      print("Rolling dice twice for computer");
      int computerTotal = randomNumber(1, 6, 2);

      // Check winner
      if (playerTotal > computerTotal) {
        playerScore += 1;
        print("Round has concluded, the winner of the round is Player");
      } else if (computerTotal > playerTotal) {
        computerScore += 1;
        print("Round has concluded, the winner of the round is Computer");
      } else {
        print("The round is a tie");
      }
      print("Round is over, type 'start' to start next round or type 'exit' to check ending results.");
      continue;
    } else if (gameCommand.toLowerCase() == "exit") {
      print("Game has concluded!");
      print("Player has total score of $playerScore");
      print("Computer has total score of $computerScore");
      if (playerScore > computerScore) {
        print("Player has won the game!");
      } else if (computerScore > playerScore) {
        print("Computer has won the game!");
      } else {
        print("The game ended in a tie!");
      }
      break;
    }
  }
}


randomNumber(int min, int max, int amt) {
  int total = 0;
  for (var i = 0; i < amt; i++) {
    final random = Random();
    int randNumber = random.nextInt(max) + min;
    total += randNumber;
    print(randNumber);
  }
  return total;
}