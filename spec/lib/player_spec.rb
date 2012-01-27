require 'hungrypotamus'

describe Player do

  context "after emptying marble collecting area" do
    before do
      subject.empty_marble_collecting_area!
    end

    its(:collected_marble_count) { should be_zero }
  end

  context "after joining a game" do
    let(:game) { stub(:game) }

    before do
      subject.join_game(game)
    end

    its(:current_game) { should == game }
  end

  context "after choosing a hippo" do
    let(:hippo) { stub(:hippo) }

    before do
      subject.choose_hippo(hippo)
    end

    its(:hippo) { should == hippo }
  end

  context "after adding marbles to the release area" do
    before do
      subject.add_marbles_to_release_area(5)
    end

    its(:releaseable_marble_count) { should == 5 }
  end

end

