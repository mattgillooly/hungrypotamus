require 'hungrypotamus'

describe Player do

  subject { Player.new(27) }

  its(:age) { should == 27 }

  context "after emptying marble collecting area" do
    before do
      subject.empty_marble_collecting_area!
    end

    its(:collected_marble_count) { should be_zero }
  end

  context "after joining a game" do
    let(:game) { stub(:game).as_null_object }

    before do
      subject.join_game(game)
    end

    its(:current_game) { should == game }
    its(:releaseable_marble_count) { should == 5 }
    its(:collected_marble_count) { should be_zero }

    context "after choosing a hippo" do
      let(:hippo) { stub(:hippo) }

      before do
        game.stub(:claim_hippo).
          with(hippo, subject).
          and_return(hippo)

        subject.choose_hippo(hippo)
      end

      its(:hippo) { should == hippo }
    end
  end

  context "after adding marbles to the release area" do
    before do
      subject.load_marble_release_area!
    end

    its(:releaseable_marble_count) { should == 5 }
  end

end

