require 'rails_helper'
RSpec.describe Book, type: :model do
    describe 'validations' do
        it 'valid title' do
            book = Book.new(title: 'title', author: 'author', price: 10, published_date: Date.today)
            expect(book).to be_valid
        end

        it 'invalid title (none)' do
            book = Book.new(title: '', author: 'author', price: 10, published_date: Date.today)
            expect(book).not_to be_valid
        end

        it 'invalid author (blank)' do
            book = Book.new(title: 'title', author: '', price: 10, published_date: Date.today)
            expect(book).not_to be_valid
        end

        it 'invalid price (negative)' do
            book = Book.new(title: 'title', author: 'author', price: -5, published_date: Date.today)
            expect(book).not_to be_valid
        end

        it 'invalid published_date (in the future)' do
            book = Book.new(title: 'title', author: 'author', price: 10, published_date: Date.today + 1)
            expect(book).not_to be_valid
        end
    end
end
