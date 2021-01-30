require 'rspec'
require 'album'

describe '.all' do
  it 'is empty at the beginning' do
    expect(Album.all).to eq([])
  end
end
  
