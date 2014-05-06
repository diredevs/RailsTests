require 'spec_helper'

feature 'Create List' do

  background do
    visit 'lists/new'
    @list = build(:list)
  end

  scenario "with valid data list is successful" do
    fill_in "list[name]", with: @list.name
    fill_in "list[subject]", with: @list.subject

    click_button "saveList"
    expect(page).to have_content @list.subject
    expect(page).to have_content @list.name
  end

  scenario "with no name list gets error message" do
    fill_in "list[subject]", with: @list.subject

    click_button "saveList"
    expect(page).to have_content "can't be blank"
  end

  scenario "with no subject list gets error message" do
    fill_in "list[name]", with: @list.name

    click_button "saveList"
    expect(page).to have_content "can't be blank"
  end

  scenario "with no name and no subject list gets error message" do

    click_button "saveList"
    expect(page).to have_content "can't be blank"
  end


end
