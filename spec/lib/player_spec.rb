require 'hungrypotamus'

describe Player do

  context "after emptying marble collecting area" do
    before do
      subject.empty_marble_collecting_area!
    end

    its(:collected_marble_count) { should be_zero }
  end

end

