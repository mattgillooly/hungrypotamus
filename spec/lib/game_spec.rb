require 'spec_helper'

describe Game do

  its(:available_hippos) { should have(4).items }
  its(:claimed_hippos) { should be_empty }
  its(:state) { should == :setup }

  context "after claiming a hippo" do
    before do
      player = stub(:player)
      hippo = subject.available_hippos.first

      subject.claim_hippo(hippo, player)
    end

    its(:available_hippos) { should have(3).items }
  end

  context "with 4 players" do
    let(:youngest) { stub(:player, :age => 12) }

    before do
      subject.players << stub(:player, :age => 32)
      subject.players << stub(:player, :age => 23)
      subject.players << youngest
      subject.players << stub(:player, :age => 45)
    end

    its(:youngest_player) { should == youngest }

    context "after starting game" do
      before do
        subject.start!
      end

      its(:current_player) { should == youngest }
      its(:state) { should == :active }
    end
  end

  context "when a player claims a hippo that isn't in the game" do
    let(:hippo) { stub(:hippo) }
    let(:player) { stub(:player) }

    before do
      subject.claim_hippo(hippo, player)
    end

    it { should have(4).available_hippos }

    it 'should not mark the hippo as claimed' do
      subject.claimed_hippos[player].should be_nil
    end
  end

  context "when a player claims a hippo" do
    let(:hippo) { subject.available_hippos.first }
    let(:player) { stub(:player) }

    before do
      subject.claim_hippo(hippo, player)
    end

    it { should have(3).available_hippos }

    it 'should mark the hippo as claimed' do
      subject.claimed_hippos[player].should == hippo
    end
  end

end
