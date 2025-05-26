# Ruby Tic Tac Toe planning

## Classes
1. board
2. player
3. logic

## logic definitions
1. create_players(): 
Takes inputs to assign player names; if left blank, default to "player 1" and "player 2". Player 1 will always be "X" and player 2 will always be "O".
2. play_round(): 
int_turn - keeps track of who's turn it is
display board
depending on who's turn it is, input either "X" or "O" into the gameBoard
display board
check if game ended, if it did, stop running this def, if it did not , run this def again
3. game_end():
Checks if the game ended. This will be true if either a player won, or there was a tie.
4. display_board():
displays the board in its current state

## logic pseudocode
1. create two players
2. assign a tic tac toe piece to the players
3. keep track of who's turn it is
4. allow players to input their move
5. after every turn, check if either player won
6. if no player won, game keeps going
7. if one player won, stop game
8. if the game ties, stop game