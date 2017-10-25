int[] attack;
int[] defend;
int attackWin, defendWin;

int attackTot, defendTot;
float attackAvg, defendAvg;

int DICE_SIDES = 6;
int ATTACK_DICE = 2;
int DEFEND_DICE = 2;

int TRIES = 1000000;

void setup() {
  attack = new int[ATTACK_DICE];
  defend = new int[DEFEND_DICE];
}

void draw() {
  attackTot = 0;
  defendTot = 0;
  
  for (int i=0; i<TRIES; i++) {
    rollDice(attack);
    sortDice(attack);
    rollDice(defend);
    sortDice(defend);
    evaluateDice(attack, defend);
    
    attackTot += attackWin;
    defendTot += defendWin;
  }
  
  attackAvg = attackTot / (float) TRIES;
  defendAvg = defendTot / (float) TRIES;
  
  print("---\n");
  print("Attack:Defend ( " + attackAvg + " : " + defendAvg + " )\n");
  print("Attack:Defend ( " + attackTot + " : " + defendTot + " )\n");
  
  noLoop();
}

void rollDice(int[] dice) {
  for (int i=0; i<dice.length; i++) {
    dice[i] = int(random(DICE_SIDES)) + 1;
  }
}

void sortDice(int[] dice) {
  int maxValue, maxIndex;
  
  for (int i=0; i<dice.length; i++) {
    maxValue = -1; // -1 is larger than all possible dice values;
    maxIndex = -1; // -1 is an impossible index
    for (int j=i; j<dice.length; j++) {
      if (maxValue < dice[j]) {
        maxValue = dice[j]; 
        maxIndex = j;
      }
    }
    
    // swaps the maximum value to front of array.
    dice[maxIndex] = dice[i];
    dice[i] = maxValue;
    
  }
  
}

void evaluateDice(int[] a, int[] d) {
  int evalNum = min(a.length, d.length);
  attackWin = 0;
  defendWin = 0;
  for (int i=0; i<evalNum; i++) {
    if (a[i] > d[i]) {
      attackWin++;
    } else {
      defendWin++;
    }
  }
}

void printSummary() {
  print("---\n");
  print("Attack Dice ");
  printDice(attack);
  print("Defend Dice ");
  printDice(defend);
  print("Attack:Defend ( " + attackWin + " : " + defendWin + " )\n");
}

void printDice(int[] dice) {
  print("[ ");
  for (int i=0; i<dice.length; i++) {
    print(dice[i]);
    if (i < dice.length-1) {
      print(", ");
    }
  }
  print(" ]\n");
}

void keyPressed() {
  switch(key) {
    case 'r': // Roll Single Dice
      rollDice(attack);
      sortDice(attack);
      rollDice(defend);
      sortDice(defend);
      evaluateDice(attack, defend);
      printSummary();
      break;
    case 'l':
      loop();
      break;
  }  
  
}
