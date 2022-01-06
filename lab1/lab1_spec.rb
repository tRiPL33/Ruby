require 'rspec'
require './lab1.rb'

RSpec.describe "Main" do

  it "#greeting_1" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('Name', 'Surname', 17)
    expect(greeting).to eq("Hi, Name Surname. You are less then 18, but starting programming is never early")
  end

  it "#greeting_2" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('Name', 'Surname', 20)
    expect(greeting).to eq("Hello, Name Surname. It's time to get busy")
  end

  it "#foobar_1" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(5, 7)
    expect(foobar).to eq(12)
  end

  it "#foobar_2" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(9, 20)
    expect(foobar).to eq(9)
  end

end
