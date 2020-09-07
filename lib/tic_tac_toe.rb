board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
display_board(board)

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

def won?(board)
  outcome = nil
  WIN_COMBINATIONS.each do |combo|
    position_1 = combo[0]
    position_2 = combo[1]
    position_3 = combo[2]


    if board[position_1] == "X" && board[position_2] == "X" && board[position_3] == "X"
    outcome = combo
    elsif board[position_1] == "O" && board[position_2] == "O" && board[position_3] == "O"
    outcome = combo
    end
  end

   return outcome
end

won?(board)

def input_to_index(user_input)
  return user_input.to_i - 1
end
input_to_index("1")

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    player = current_player(board)
    move(board, index, player)
    display_board(board)
  else
    turn(board)
  end
end

def move(board, index, token)
  return board[index] = token
end
#move(board, 0, "X")

def turn_count(board)
  counter = 0
  board.each do |moves|
    if moves == "X" || moves == "O"
      counter += 1
    end
  end
  return counter
end
turn_count(board)

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end
current_player(board)

def full?(board)
  def check(counter)
    if counter == 9
       true
    else
      false
    end
  end

  counter = 0
  board.each do |spot|
    if spot == "X" || spot == "O"
      counter += 1
    end
  end
  return check(counter)
end
full?(board)

def draw?(board)
  full?(board) && !won?(board)
end
draw?(board)

def over?(board)
  full?(board) || won?(board) || draw?(board)
end

def winner(board)
  if outcome = won?(board)
    board[outcome.first]
  end
end

def play(board)
  until over?(board)
    turn(board)
  end

  if won?(board)
    victor = winner(board)
   puts "Congratulations #{victor}!"
  elsif draw?(board)
   puts "Cat's Game!"
  end
end
#play(board)
