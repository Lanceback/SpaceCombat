# SpaceCombat
A two player spaceship combat game I rigged up in bash. 

The initial "mostly functional" version was made in about an hour.

### Update
You can now host a game! I ended up using ncat.

Fixed bugs.

Re-worked interface.

Plasma Cannon damage increased.

Plasma Cannon cooldown reduced.

Win condition fixed.



## Files

idea.txt is where I wrote down all my notes before I started on it

ship.sh is my attempt to animate some ascii art of a spaceship I found online.

SpaceCombat.sh is the actual game. 

## Actions
There are currently six actions you can take in the game:

  1: Laser Pulse - Deals one damage to opponent, has no cooldown.
  
  2: Plasma Cannon - Deals 5 damage to opponent, fires on next turn, and has a 4 turn cooldown timer.
  
  3: Overheat Plasma Cannon - Fires your Plasma Cannon immediately, deals 3 damage, has a 1/3 chhance off backfiring, and resets Plasma Cannon's cooldown timer.
  
  4: Dodge - Gives you a 1/2 chance of dodging your opponents attack this turn and 1/3 chance the next, has no cooldown timer.
  
  5: Shield - Allow up to five points of damage to be blocked, has a 5 turn cooldown timer. 
  
  6: Repair - Recover 2 hp this turn and 1 hp for the next 2 turns, has a 5 turn cooldown timer.


### Backfiring
Backfiring will cause your Plasma Cannon to break and your ship to take 4 damage.

Currently, the Plasma Cannon will become available again after 10 turns.


## Plans:
  
  Singleplayer game mode.
  
  Re-make in python.
  
  Backfiring might deal anywhere from 3-8 damage depending on the plasma Cannon's use in the last turn.
   
  Backfiring might require you to use the "Repair" ability to repair it.
  
  Repeatedly overheating your Plasma Cannon might make it more likely to backfire.
