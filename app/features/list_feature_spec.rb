require 'spec_helper'

feature 'Create List' do

  background do
    visit new_list_path  
    @list = build(:list)
  end


  scenario "with valid data list is created" do
    fill_in "list[name]", with: @list.name
    fill_in "list[subject]", with: @list.subject

    click_button "saveList"
    expect(page).to have_content @list.subject
  end


end
