Given /^I am signed in$/ do
  @player = Player.new(29)
end

When /^there is a game that is accepting new players$/ do
  @game = Game.new
end

When /^I join a game$/ do
  steps %{
    When there is a game that is accepting new players
  }

  @player.join_game(@game)
end

Then /^I can choose an available hippo$/ do
  @game.should have(4).available_hippos
end

When /^I choose an available hippo$/ do
  @player.choose_hippo(@game.available_hippos.first)
end

Then /^I can't choose another hippo$/ do
  @player.choose_hippo(@game.available_hippos.last).should be_false
end

Then /^my marble collecting area is empty$/ do
  @player.collected_marble_count.should be_zero
end

Then /^I have (\d+) marbles in my marble release area$/ do |num_marbles|
  @player.releaseable_marble_count.should == num_marbles.to_i
end

Then /^I place (\d+) marbles into my marble release area$/ do |num_marbles|
  @player.add_marbles_to_release_area(num_marbles.to_i)
end

When /^three other players have joined the game$/ do
  [24, 22, 28].each do |age|
    Player.new(age).join_game(@game)
  end
end

When /^everyone in the game has chosen a hippo$/ do
  @game.players.each do |player|
    unless player.hippo
      first_hippo = @game.available_hippos.first
      player.choose_hippo(first_hippo)
    end
  end
end

Then /^it is the youngest players turn to launch a marble$/ do
  @game.current_player.should == @game.youngest_player
end

