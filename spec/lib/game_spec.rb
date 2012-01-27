require 'hungrypotamus'

describe Game do

  its(:available_hippos) { should have(4).items }

end
