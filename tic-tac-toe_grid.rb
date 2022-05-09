=begin
Project: Tic-Tac-Toe(Using Grid)
Objective: Implement the Tic-Tac-Toe game

Implementation:
1. I tried to implement it by the interaction between the cell and the board was not working properly.
2. So, instead, I will use the grid.
3. The user will provide the row and column numbers.
4. Based on the turn number, the symbol will be either 'x' or 'o'.
5. A new cell will be created and inserted into a corresponding array.
6. If the array has 3 or more elements, check for win conditions.
=end

board = [
    [nil,nil,nil],
    [nil,nil,nil],
    [nil,nil,nil]
]

def display_board(board)
    #print out through the loop
    outer_loop_count = 0
    while outer_loop_count < 3 
        inner_loop_count = 0
        while inner_loop_count < 3
            puts "Element at (#{outer_loop_count+1},#{inner_loop_count+1}) is #{board[outer_loop_count][inner_loop_count]}"
            inner_loop_count += 1
        end    
        outer_loop_count += 1
    end
end

def check_win_condition(board)
    winner  = {x_win: false, o_win: false }

    #for x to win
    #if one of the rows has three x's
    board.each do |inner_array|
        winner[:x_win] = true if inner_array.all?{|element| element == 'x'}
    end

    #if one of the columns has three x's
    board.transpose().each do |inner_array|
        winner[:x_win] = true if inner_array.all?{|element| element == 'x'}
    end

    #if the diagonals has x's
    if (board[0][0] == 'x' and
        board[1][1] == 'x'and
        board[2][2] == 'x') or
        (board[0][0] == 'x' and
        board[1][1] == 'x'and
        board[2][3] == 'x') then
        winner[:x_win] = true
    end
    
    #for o to win
    #if one of the rows has three o's
    board.each do |inner_array|
        winner[:o_win] = true if inner_array.all?{|element| element == 'o'}
    end

    #if one of the columns has three o's
    board.transpose().each do |inner_array|
        winner[:o_win] = true if inner_array.all?{|element| element == 'o'}
    end

    #if the diagonals has o's
    if (board[0][0] == 'o' and
        board[1][1] == 'o'and
        board[2][2] == 'o') or
        (board[0][0] == 'o' and
        board[1][1] == 'o'and
        board[2][3] == 'o') then
        winner[:o_win] = true
    end

    return winner
end


win = false
turns = 1
while !win do

    #ask the players for input
    puts "Enter a row and column:"
    row =  gets.chomp.to_i
    column = gets.chomp.to_i

    #create a new cell based on row, column and symbol based on the turn
    if turns.even?
        board[row-1][column-1] = 'o'
    else
        board[row-1][column-1] = 'x'
    end

    display_board(board)
    winner = check_win_condition(board)
    if winner[:x_win] then
        puts "Player 1 wins."
        win = true
        board = [
            [nil,nil,nil],
            [nil,nil,nil],
            [nil,nil,nil]
        ]
    elsif winner[:o_win] then
        puts "Player 2 wins."
        win = true
        board = [
            [nil,nil,nil],
            [nil,nil,nil],
            [nil,nil,nil]
        ]
    end
    turns += 1
end