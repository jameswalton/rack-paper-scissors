map '/throw' do
  def play(move)
    @defeat = {rock: :scissors, paper: :rock, scissors: :paper}
    @throws = @defeat.keys
    player_throw = move.gsub!('/','').to_sym
    computer_throw = @defeat.keys.sample
    if !@throws.include?(move.to_sym)
      return "Please select a real move"
    else
      if player_throw == computer_throw.to_sym
        "Draw - tied with computer."
      elsif computer_throw == @defeat[player_throw]
        "You win - your #{player_throw} beats the computer's #{computer_throw}"
      else
        "You lose - your #{player_throw} was beaten by the computer's #{computer_throw}"
      end
    end
  end

  run Proc.new {|env|   
    [200, {"Content-Type" => "text/html"}, [play(env['PATH_INFO'])]] 
  }
end