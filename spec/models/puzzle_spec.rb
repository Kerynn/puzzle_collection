require 'rails_helper'

RSpec.describe Puzzle, type: :model do 
  it {should belong_to :collector}
end 