require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index, format: :json
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
  context 'when the book exists' do
    let(:book) { FactoryBot.create(:book) }

    it 'returns a success response and includes book attributes' do
      get :show, params: { hashid: book.hashid }, format: :json
      expect(response).to have_http_status(:success)


      expected_attributes = ['id', 'title', 'author', 'publisher', 'genre', 'image_url']
      parsed_response = JSON.parse(response.body)

      expected_attributes.each do |attribute|
        expect(parsed_response).to include(attribute)
      end

      expect(parsed_response).to include('id' => book.id, 'title' => book.title, 'author' => book.author, 'publisher' => book.publisher, 'genre' => book.genre, 'image_url' => book.image_url)
      expect(parsed_response.keys).to match_array(expected_attributes)
    end
  end

  context 'when the book does not exist' do
    it 'returns a not found response' do
      get :show, params: { hashid: non_existent_book_id }, format: :json
      expect(response).to have_http_status(:not_found)
    end
  end
end

  describe 'POST #create' do
    context 'when the book is valid' do
      let(:book_params) { FactoryBot.attributes_for(:book) }
      it 'creates a new book' do
        expect { post :create, params: { book: book_params }, format: :json }.to change(Book, :count).by(1)
      end

      it 'returns a success response' do
        post :create, params: { book: book_params }, format: :json
        expect(response).to have_http_status(:created)
      end
    end

    context 'when the book is invalid' do
      let(:book_params) { FactoryBot.attributes_for(:book, title: nil) }
      it 'does not create a new book' do
        expect { post :create, params: { book: book_params }, format: :json }.to_not change(Book, :count)
      end

      it 'returns an unprocessable entity response' do
        post :create, params: { book: book_params }, format: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PUT #update' do
    let(:book) { FactoryBot.create(:book) }
    context 'when the book is valid' do
      let(:book_params) { FactoryBot.attributes_for(:book, title: 'New Title') }
      it 'updates the book' do
        put :update, params: { id: book.id, book: book_params }, format: :json
        expect(book.reload.title).to eq('New Title')
      end

      it 'returns a success response' do
        put :update, params: { id: book.id, book: book_params }, format: :json
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when the book is invalid' do
      let(:book_params) { FactoryBot.attributes_for(:book, title: nil) }
      it 'does not update the book' do
        put :update, params: { id: book.id, book: book_params }, format: :json
        expect(book.reload.title).to_not eq(nil)
      end

      it 'returns an unprocessable entity response' do
        put :update, params: { id: book.id, book: book_params }, format: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:book) { FactoryBot.create(:book) }
    it 'destroys the book' do
      expect { delete :destroy, params: { id: book.id }, format: :json }.to change(Book, :count).by(-1)
      expect { Book.find(book.id) }.to raise_error(ActiveRecord::RecordNotFound)
    end

    it 'returns a success response' do
      delete :destroy, params: { id: book.id }, format: :json
      expect(response).to have_http_status(:ok)
    end
  end
end
