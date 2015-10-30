require 'spec_helper'

describe 'Dog' do
  it 'is defined within lib/dog.rb' do
    expect(defined?(Dog)).to be_truthy
    expect(Dog).to be_a(Class)
  end
end

describe 'name=' do
  it 'defines an instance variable @this_dogs_name' do
    lassie = Dog.new
    lassie.name = 'Lassie'

    expect(lassie.name).to eq('Lassie')
  end
end

describe 'name' do
  it 'defines an instance variable @this_dogs_name' do
    lassie = Dog.new
    lassie.name = 'Lassie'
    puts lassie.name

    expect(STDOUT).to receive(:puts).with('Lassie')

  end
end
