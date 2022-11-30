require 'rails_helper'

RSpec.describe Collector, type: :model do 
  it {should have_many :puzzles}
end 