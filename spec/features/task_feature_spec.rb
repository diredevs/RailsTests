require 'spec_helper'

feature 'Create Task' do

	background do
		visit 'tasks/new'
		@list = create(:list)
		@task = build(:task)
	end

	scenario "Creates task with valid data" do
		fill_in "task[name]", with @task.name
		fill_in "task[date]", with @task.date
		page.select(@list.name, from 'task[list_id]')

		click_button "saveTask"

		expect(page).to have_content @task.name
		expect(page).to have_content @task.date
		expect(page).to have_content "Task was successfully created."
	end
	
end