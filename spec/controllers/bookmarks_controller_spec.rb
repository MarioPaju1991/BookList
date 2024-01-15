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
      get :index, params: { book_hashid: book.hashid }, format: :json
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
  let!(:bookmark) { FactoryBot.create(:bookmark) }
  context 'when the bookmark exists' do
    it 'returns a success response' do
      get :show, params: { book_hashid: bookmark.book.hashid, hashid: bookmark.hashid }, format: :json
      expect(response).to have_http_status(:success)
    end
  end
end

context 'when the bookmark does not exist' do
  let!(:non_existent_bookmark_id) { '123456789' }
  it 'returns a not found response' do
      get :show, params: { book_hashid: bookmark.book.hashid, hashid: non_existent_bookmark_id }, format: :json
      expect(response).to have_http_status(:not_found)
    end
  end

describe 'PUT #update' do
  context 'when the bookmark is updated' do
    let(:bookmark_params) { FactoryBot.attributes_for(:bookmark) }
    it 'updates the bookmark' do
      put :update, params: { book_hashid: bookmark.book.hashid, hashid: bookmark.hashid, bookmark: bookmark_params }, format: :json
      expect(response).to have_http_status(:success)
    end
  end

  context 'when the bookmark does not exist' do
    let(:non_existent_bookmark_id) { '123456789' }
    let(:bookmark_params) { FactoryBot.attributes_for(:bookmark) }
    it 'returns a not found response' do
      put :update, params: { book_hashid: bookmark.book.hashid, hashid: non_existent_bookmark_id, bookmark: bookmark_params }, format: :json
      expect(response).to have_http_status(:not_found)
      end
    end


  describe 'DELETE #destroy' do
    context 'when the bookmark is deleted' do
      it 'deletes the bookmark' do
        delete :destroy, params: { book_hashid: bookmark.book.hashid, hashid: bookmark.hashid }, format: :json
        expect(response).to have_http_status(:success)
      end
    end
  end

    context 'when the bookmark does not exist' do
      let(:non_existent_bookmark_id) { '123456789' }
      it 'returns a not found response' do
        delete :destroy, params: { book_hashid: bookmark.book.hashid, hashid: non_existent_bookmark_id }, format: :json
        expect(response).to have_http_status(:not_found)
      end
    end
 end
end
