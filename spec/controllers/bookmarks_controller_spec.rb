require 'rails_helper'

RSpec.describe BookmarksController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:book) { FactoryBot.create(:book) }
  let(:bookmark) { FactoryBot.create(:bookmark, user: user, book: book) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index, format: :json
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: bookmark.to_param }, format: :json
      expect(response).to have_http_status(:success)
    end

    it 'returns a not found response' do
      get :show, params: { id: non_existent_bookmark_id }, format: :json
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'PUT #update' do
    let(:new_book) { FactoryBot.create(:book) }

    context 'with valid params' do
      let(:new_attributes) { { book_id: new_book.hashid } }

      it 'updates the requested bookmark' do
        put :update, params: { id: bookmark.to_param, bookmark: new_attributes }, format: :json
        bookmark.reload
        expect(bookmark.book).to eq(new_book)
      end

      it 'returns a success response' do
        put :update, params: { id: bookmark.to_param, bookmark: new_attributes }, format: :json
        expect(response).to have_http_status(:success)
      end
    end

    context 'with invalid params' do
      it 'returns an unprocessable entity response' do
        put :update, params: { id: bookmark.to_param, bookmark: { book_id: nil } }, format: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested bookmark' do
      bookmark
      expect {
        delete :destroy, params: { id: bookmark.to_param }, format: :json
      }.to change(Bookmark, :count).by(-1)
    end

    it 'returns a success response' do
      delete :destroy, params: { id: bookmark.to_param }, format: :json
      expect(response).to have_http_status(:success)
    end
  end
end
