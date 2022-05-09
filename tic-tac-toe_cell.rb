=begin
Project: Tic-Tac-Toe(Using Cell class)
Objective: Implement the Tic-Tac-Toe game

Implementation:
1. I tried to implement it by the interaction between the cell and the board was not working properly.
2. So, instead, I will use the cell class alone to check for win conditions.
3. The user will provide the row and column numbers.
4. Based on the turn number, the symbol will be either 'x' or 'o'.
5. A new cell will be created and inserted into a corresponding array.
6. If the array has 3 or more elements, check for win conditions.
=end

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

#method to check for will conditions
def check_win_condition(input_array)

    row_tally = Hash.new()
    column_tally =  Hash.new()
    
    #check for rows
    row_one = input_array.select {|cell| cell.row == 1}
    puts row_tally
    puts column_tally
end

#create arrays for each player inputs
x_array = []
o_array = []

#The players will play until one wins or they have reached round 9.
win = false
turns = 1
while !win or turns <= 9

    #ask the players for input
    puts "Enter a row and column:"
    row =  gets.chomp.to_i
    column = gets.chomp.to_i

    #create a new cell based on row, column and symbol based on the turn
    if turns.even?
        input_cell =  Cell.new(row, column, 'x')
        x_array.push(input_cell)
    else
        input_cell =  Cell.new(row, column, 'o')
        o_array.push(input_cell)
    end

    #check for win conditions
    if x_array.length >= 3 
        win = check_win_condition(x_array)
    end

    if o_array.length >= 3 
        win = check_win_condition(o_array)
    end

    turns += 1
end