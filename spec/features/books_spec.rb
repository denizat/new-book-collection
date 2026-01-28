require 'rails_helper'

RSpec.describe 'Books', type: :feature do
  it 'shows success flash notice when book is valid' do
    visit new_book_path
    fill_in 'Title', with: 'The Great Gatsby'
    fill_in 'Author', with: 'F. Scott Fitzgerald'
    fill_in 'Price', with: 15
    fill_in 'Published date', with: Date.today
    click_button 'Create Book'
    expect(page).to have_content('Book was successfully created.')
  end

  it 'shows error when title is blank' do
    visit new_book_path
    fill_in 'Title', with: ''
    fill_in 'Author', with: 'Author'
    fill_in 'Price', with: 10
    fill_in 'Published date', with: Date.today
    click_button 'Create Book'
    expect(page).to have_content("Title can't be blank")
  end

  it 'shows error when author is blank' do
    visit new_book_path
    fill_in 'Title', with: 'Title'
    fill_in 'Author', with: ''
    fill_in 'Price', with: 10
    fill_in 'Published date', with: Date.today
    click_button 'Create Book'
    expect(page).to have_content("Author can't be blank")
  end

  it 'shows error when price is negative' do
    visit new_book_path
    fill_in 'Title', with: 'Title'
    fill_in 'Author', with: 'Author'
    fill_in 'Price', with: -5
    fill_in 'Published date', with: Date.today
    click_button 'Create Book'
    expect(page).to have_content("Price must be greater than or equal to 0")
  end

  it 'shows error when published date is in the future' do
    visit new_book_path
    fill_in 'Title', with: 'Title'
    fill_in 'Author', with: 'Author'
    fill_in 'Price', with: 10
    fill_in 'Published date', with: Date.today + 1
    click_button 'Create Book'
    expect(page).to have_content("Published date can't be in the future")
  end
end
