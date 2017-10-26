# RiskRoller
Ira Winder, jiw@mit.edu, 2017
Script for empirically testing probabilities when rolling dice for board game "Risk"

This script simulates two players rolling dice in the 
board game "Risk" invented by Albert Lamorisse. 

Results are printed to console. (This script currently has no UI.)

https://en.wikipedia.org/wiki/Risk_(game)

Rules:
1. Two players, an attacker and defender, roll dice to determine how many army units they respectively lose in an encounter between two army groups.
2. An attacker may roll 1-3 dice, while a defender may roll 1-2 dice.
3  After a roll, the highest dice of the attacker are paired with the highest dice of the defender. 
4. If applicable, he second-highest dice of each player are also paired together.
5. Each dice pair between an attacker and defended determines the loss of an army unit:  
   - If the attacker's die is LARGER THAN the defender's die, then the defender loses an army unit.
   - If the defender's die is LARGER THAN or EQUAL TO the attacker's die, then the attacker loses an army unit. (Defenders win ties!)
