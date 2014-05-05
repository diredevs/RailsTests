require 'spec_helper'

describe Task do

  it { should belong_to :list }

  it { should validate_presence_of :name}
  it { should validate_presence_of :date}

  it 'should have done false as default' do
    task = build(:task, name: "Test Task", date: DateTime.now)

    task.done.should be false
  end


end
