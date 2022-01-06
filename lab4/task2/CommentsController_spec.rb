require 'rspec'
require_relative 'CommentsController'

RSpec.describe CommentsController do
  it '#create' do
    allow_any_instance_of(CommentsController).to receive(:gets).and_return('first comment', 1)
    subject.create
    expect{ subject.show }.to output("Enter index of comment: id:1 \"first comment\"\n").to_stdout
  end

  it '#update' do
    allow_any_instance_of(CommentsController).to receive(:gets).and_return('first comment', 1, 'updated')
    subject.create
    subject.update
    expect{ subject.index }.to output("id:1 \"updated\"\n").to_stdout
  end

  it '#destroy' do
    allow_any_instance_of(CommentsController).to receive(:gets).and_return('first comment', 'second comment', 1)
    subject.create
    subject.create
    subject.destroy
    expect{ subject.index }.to output("id:1 \"second comment\"\n").to_stdout
  end

  it '#index' do
    allow_any_instance_of(CommentsController).to receive(:gets).and_return('first comment', 'second comment')
    subject.create
    subject.create
    expect{ subject.index }.to output("id:1 \"first comment\"\nid:2 \"second comment\"\n").to_stdout
  end

  it '#show' do
    allow_any_instance_of(CommentsController).to receive(:gets).and_return('first comment', 'second comment', 2)
    subject.create
    subject.create
    expect{ subject.show }.to output("Enter index of comment: id:2 \"second comment\"\n").to_stdout
  end
end
