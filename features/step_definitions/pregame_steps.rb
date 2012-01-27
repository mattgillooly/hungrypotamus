Given /^I am signed in$/ do
  @player = Player.new
end

Given /^my marble collecting area is empty$/ do
  @player.empty_marble_collecting_area!
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

Then /^I choose an available hippo$/ do
  @player.choose_hippo(@game.available_hippos.first)
end

Then /^I place (\d+) marbles into my marble release area$/ do |num_marbles|
  @player.add_marbles_to_release_area(num_marbles.to_i)
end

