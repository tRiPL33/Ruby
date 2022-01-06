require 'rspec'
require_relative 'PostsController'

RSpec.describe PostsController do
  it '#create' do
    allow_any_instance_of(PostsController).to receive(:gets).and_return('first post', 1)
    subject.create
    expect{ subject.show }.to output("Enter index of post: id:1 \"first post\"\n").to_stdout
  end

  it '#update' do
    allow_any_instance_of(PostsController).to receive(:gets).and_return('first post', 1, 'updated')
    subject.create
    subject.update
    expect{ subject.index }.to output("id:1 \"updated\"\n").to_stdout
  end

  it '#destroy' do
    allow_any_instance_of(PostsController).to receive(:gets).and_return('first post', 'second post', 1)
    subject.create
    subject.create
    subject.destroy
    expect{ subject.index }.to output("id:1 \"second post\"\n").to_stdout
  end

  it '#index' do
    allow_any_instance_of(PostsController).to receive(:gets).and_return('first post', 'second post')
    subject.create
    subject.create
    expect{ subject.index }.to output("id:1 \"first post\"\nid:2 \"second post\"\n").to_stdout
  end

  it '#show' do
    allow_any_instance_of(PostsController).to receive(:gets).and_return('first post', 'second post', 2)
    subject.create
    subject.create
    expect{ subject.show }.to output("Enter index of post: id:2 \"second post\"\n").to_stdout
  end
end
