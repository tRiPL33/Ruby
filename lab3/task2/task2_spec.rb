require 'rspec'
require './task2.rb'

RSpec.describe "task2" do
  before(:each) do
    File.write(OUTPUT_FILE_PATH, "")
  end

  it "#witout negative number" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(19, 19, 23, 21, 17, 22, 18, 30, 33, 25)
    expect{read_students}.to output("Enter age of student\nEnter age of student\nEnter age of student\nEnter age of student\nEnter age of student\nEnter age of student\nEnter age of student\nEnter age of student\nEnter age of student\nEnter age of student\nEnter age of student\nBiller Kirill 20\nPotapov Vlad 19\nChaila Valeriya 19\nSavina Veronika 23\nBodryakova Katya 21\nHudina Dasha 17\nPopukalov Maxim 22\nArtemev Leonid 18\nKirushev Maxim 30\nSerova Zoya 33\nSerditov Kirill 25\n").to_stdout
  end

  it "#with negative number" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(20, 23, -1)
    expect{read_students}.to output("Enter age of student\nEnter age of student\nEnter age of student\nYou entered -1 (exit)\nBiller Kirill 20\nSavina Veronika 23\n").to_stdout
  end

  it "#straightaway negative number" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(-1)
    expect{read_students}.to output("Enter age of student\nYou entered -1 (exit)\n").to_stdout
  end
end
