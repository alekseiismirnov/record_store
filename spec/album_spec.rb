require 'rspec'
require 'album'

describe '.all' do
  it 'is empty at the beginning' do
    expect(Album.all).to eq([])
  end
  
  it 'albums with same names are equal' do
    expect(Album.new("Blue") == Album.new("Blue")).to eq(true)
  end
end
  
