class Game 
  attr_accessor = :current_player, :game_over

  def initialize
    @game_over = false 
    @players = []
    @players[0] = Player.new('Player 1')
    @players[1] = Player.new('Player 2')
    @turn = 0 
  end 

  def start 
    puts "start"
    while !@game_over do 
      current_player = @players[@turn % 2] 
      other_player = @players[(@turn + 1) % 2]
      new_question = Question.new(current_player.name)
      new_question.ask
      user_answer = $stdin.gets.chomp.to_i 
      if new_question.validate(user_answer) 
        puts "Correct"
      else 
        current_player.lose_life
        puts "Wrong" 
      
        if current_player.lives == 0 
          @game_over = true 
          puts "#{other_player.name} wins with a score of #{other_player.lives}/3"
          puts "#{--- GAME OVER ---}"
          puts "Good bye!"
          break
        end 
      end 

      puts "P1: #{@players[0].lives}/3 vs P2: #{@players[1].lives}/3"
      puts "----- NEW TURN -----"
      @turn = @turn + 1
    end 

  end 
end 

