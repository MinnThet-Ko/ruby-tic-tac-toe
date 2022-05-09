=begin
Project: Tic-Tac-Toe
Objective: Create a Tic-Tac-Toe game.

Implementations:
1. The game will end only when a player wins or it's a draw.
2. The game has board, cell, and player.
3. The player will alternate each turn. The first player is a cross and the secont is a circle. 
4. A player will provide the cell row and colomn.
5. At round end, the board will check for a winner.
=end

#Initial class for board
class Board
    @@rows = 3
    @@colomns = 3
    @@grid = []
    3.times do
        @@grid.push(Array.new(3, "X"))
    end

    def Board.get_grid
        @@grid 
    end

    def Board.add_cell(cell) 
        puts @@grid[cell.row][cell.colomn].to_s
    end
end

class Cell
    attr_accessor :row, :colomn, :symbol
    def initialize(row, column, symbol)
        @row = row
        @column = column
        @symbol = symbol
    end

    #Methods under this comment are only to be used during development.
    def disply_input
        puts "Player inserted #{@symbol} in (#{@row}, #{@column})."
    end
end

#Using the loop counter before the Board class has the check for winner
win = false;
turns = 1
while win == false
    #Request input for row and column from the user
    puts 'Enter a row and a column:'
    row = gets.chomp.to_i
    column = gets.chomp.to_i

    #create a new cell for the round
    input_cell = Cell.new(row-1, column-1, turns.odd? ? 1 : 0)

    input_cell.disply_input
    puts Board.get_grid
    Board.add_cell(input_cell)
    turns += 1
    if(turns == 9)
        win = true
        Board.get_grid
        turns = 1
    end
end