require 'rspec'
require './lab2.rb'

RSpec.describe "Main" do

  it "#checkCS_test_1" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('GLASSECS')
    expect(checkCS).to eq(256)
  end

  it "#checkCS_test_2" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('glasses')
    expect(check_word).to eq("sessalg")
  end

  it "#pokemon" do
  		allow_any_instance_of(Kernel).to receive(:gets).and_return(2, "Pikachu", "Yellow", "Squirtle", "Light blue")
  		expect(create_pokemons).to eq([{ "Pikachu" => "Yellow" }, { "Squirtle" => "Light blue" }])
  	end

end
