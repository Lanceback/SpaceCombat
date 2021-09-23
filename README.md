# SpaceCombat
A two player game I rigged up in bash. 

You an now host a game! I ended up using ncat.

Still doesn't quite work, I need to change the way I listen for input from the connection, but it's progress!



idea.txt is where I wrote down all my notes before I started on it

ship.sh is my attempt to animate some ascii art of a spaceship I found online.

SpaceCombat.sh is the actual game. It will need to be pointed to a tcp server with port 4444 open.

The game will not progress until both players have selected an option.

In the tcp server, you'll have to simulate the script and type a number like 1,0,or 4 to allow the game to progress.

## Actions
There are currently six actions you can take in the game:

  1: Laser - Deals one damage to opponent, has no cooldown.
  
  2: Plasma Cannon - Deals 4 damage to opponent, fires on next turn, and has a 5 turn cooldown timer.
  
  3: Overheat Plasma Cannon - Fires you Plasma Cannon immediately, deals 3 damage, has a 1/3 chhance off backfiring, and has a 2 turn cooldown timer.
  
  4: Dodge - Gives you a 1/2 chance of dodging your opponents attack this turn and 1/3 chance the next, has no cooldown timer.
  
  5: Shield - Allow up to five points of damage to be blocked, has a 5 turn cooldown timer. 
  
  6: Repair - Recover 2 hp this turn and 1 hp for the next 2 turns, has a 5 turn cooldown timer.


### Backfiring
Backfiring will cause your Plasma Cannon to break and your ship to take 4 damage. I might change this to deal anywhere from 4-8 damage depending on the plasma Cannon's use in the last turn.

Currently, the Plasma Cannon will become available again after 10 turns, I might change this to require you to use the "Repair" ability to repair it.


## Plans:

  I may just make a dedicated server.
  
  I need an ai in the game for singleplayer.
  
  Re-make in python for better network communication.
  
  Compile into platfform specific Applications.



I made this in about an hour. I think the complexity kinda got away from me, but it was fun.
