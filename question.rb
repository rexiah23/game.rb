class Question 
  attr_reader :answer

  def initialize(player)
    @player = player
    @operators = ['+']
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @answer = @num1.to_i + @num2.to_i 
  end

  
  
  def ask
    puts "#{@player}: What does #{@num1} + #{@num2} equal? "
  end 

  def validate(user_answer) 
    user_answer == @answer 
  end 

end 



