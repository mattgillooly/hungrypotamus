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

end

