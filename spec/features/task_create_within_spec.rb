require 'spec_helper'

feature 'Create Task' do

  task_path = '/tasks'

  background do
    @list = create(:list)
    visit list_path(@list)
    click_link "newTask"
    @task = build(:task)
  end

  scenario "outside a list passing valid data" do
    fill_in "task[name]", with: @task.name

    click_button "saveTask"

    expect(page).to have_content @task.name
    expect(page).to have_content "Task was successfully created."
  end

  scenario "outside a list passing invalid data" do

    click_button "saveTask"

    expect(page).to have_content "Please review the problems below"

    current_path.should == task_path
  end



end
