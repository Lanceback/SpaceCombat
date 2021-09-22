# SpaceCombat 
A two player game I rigged up in bash. It is not finished yet, I haven't worked out a way to host a game in bash withhout using an external... thing (what's the word?).
Hopefully I'll finish it sometime this week.

idea.txt is where I wrote down all my notes before I started on it

ship.sh is my attempt to animate some ascii art of a spaceship I found online.

SpaceCombat.sh is the actual game. If you want to give it a try, start up a nc listener like ncat -l 4444. Really any tcp listener will work for this as long as you can receive and send text through it. Then run the script, select join game and point it to 127.0.0.1. 

The game will not progress until both players have selected an option. 
So on the ncat window, you'll have to simulate the script and type a number like 1,0,or 4 to allow the game to progress.


There are currently six actions you can take in thhe game:
  1: Laser - Deals one damage to opponent, and has no cooldown.
  2: Plasma Cannon - Deals 4 damage to opponent, fires on next turn, and has a 5 turn cooldown timer.
  3: Overheat Plasma Cannon - Fires you Plasma Cannon immediately, deals 4 damage, has a 1/3 chhance off backfiring, and has a 2 turn cooldown timer.
  4: Dodge - Gives you a 1/2 chance of dodging your opponents attack this turn and 1/3 chance the next, exploitable (note to self: fix), and has no cooldown timer.
  5: Shield - Allow up to five points of damage to be absorbed, has a 5 turn cooldown timer. 
  6: Heal - Recover 3 hitpoints, exploitable (note to self: fix), has a 5 turn cooldown timer.

Backfiring will cause your Plasma Cannon to break and your ship to take 4 damage. I might change this to deal anywhere from 4-8 damage depending on the plasma Cannon's use in the last turn.

Currently, the Plasma Cannon will become available again after 10 turns, I might change this to require you to use Heal to repair it.

Plans:
  I may just make a dedicated server.
  I need an ai in the game for singleplayer.

I made this in about an hour. The idea was cool and I didnt want to loose it. I think the complexity kinda got away from me, but it was fun.
I do intend to finish this and then remake it in python, then maybe Go just because I need more experience in that language. We'll see.
