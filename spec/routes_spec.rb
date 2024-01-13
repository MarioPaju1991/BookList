require 'rails_helper'

RSpec.describe 'routes for Books', type: :routing do
  it 'routes GET /books to the books controller' do
    expect(get('/books')).to route_to(controller: :books, action: :index)
  end

  it 'routes GET /books/:hashid to the books controller' do
    expect(get('/books/1')).to route_to(controller: :books, action: :show, hashid: '1')
  end

  it 'routes POST /books to the books controller' do
    expect(post('/books')).to route_to(controller: :books, action: :create)
  end

  it 'routes PUT /books/:hashid to the books controller' do
    expect(put('/books/1')).to route_to(controller: :books, action: :update, hashid: '1')
  end

  it 'routes DELETE /books/:hashid to the books controller' do
    expect(delete('/books/1')).to route_to(controller: :books, action: :destroy, hashid: '1')
  end
end

RSpec.describe 'routes for Bookmarks', type: :routing do
  it 'routes GET /books/:book_hashid/bookmarks to the bookmarks controller' do
    expect(get('/books/1/bookmarks')).to route_to(controller: :bookmarks, action: :index, book_hashid: '1')
  end

  it 'routes GET /books/:book_hashid/bookmarks/:hashid to the bookmarks controller' do
    expect(get('/books/1/bookmarks/1')).to route_to(controller: :bookmarks, action: :show, book_hashid: '1', hashid: '1')
  end

  it 'routes POST /books/:book_hashid/bookmarks to the bookmarks controller' do
    expect(post('/books/1/bookmarks')).to route_to(controller: :bookmarks, action: :create, book_hashid: '1')
  end

  it 'routes PUT /books/:book_hashid/bookmarks/:hashid to the bookmarks controller' do
    expect(put('/books/1/bookmarks/1')).to route_to(controller: :bookmarks, action: :update, book_hashid: '1', hashid: '1')
  end

  it 'routes DELETE /books/:book_hashid/bookmarks/:hashid to the bookmarks controller' do
    expect(delete('/books/1/bookmarks/1')).to route_to(controller: :bookmarks, action: :destroy, book_hashid: '1', hashid: '1')
  end
end

RSpec.describe 'routes for Users', type: :routing do
  it 'routes GET /users/:hashid to the users controller' do
    expect(get('/users/1')).to route_to(controller: :users, action: :show, hashid: '1')
  end

  it 'routes PUT /users/:hashid to the users controller' do
    expect(put('/users/1')).to route_to(controller: :users, action: :update, hashid: '1')
  end

  it 'routes DELETE /users/:hashid to the users controller' do
    expect(delete('/users/1')).to route_to(controller: :users, action: :destroy, hashid: '1')
  end
end

RSpec.describe 'routes for Sessions', type: :routing do
  it 'routes POST /sessions to the sessions controller' do
    expect(post('/sessions')).to route_to(controller: :sessions, action: :create)
  end

  it 'routes DELETE /sessions to the sessions controller' do
    expect(delete('/sessions')).to route_to(controller: :sessions, action: :destroy)
  end
end

RSpec.describe 'routes for Passwords', type: :routing do
  it 'routes POST /passwords to the passwords controller' do
    expect(post('/passwords')).to route_to(controller: :passwords, action: :create)
  end

  it 'routes PUT /passwords to the passwords controller' do
    expect(put('/passwords')).to route_to(controller: :passwords, action: :update)
  end
end

RSpec.describe 'routes for Confirmations', type: :routing do
  it 'routes POST /confirmations to the confirmations controller' do
    expect(post('/confirmations')).to route_to(controller: :confirmations, action: :create)
  end

  it 'routes PUT /confirmations to the confirmations controller' do
    expect(put('/confirmations')).to route_to(controller: :confirmations, action: :update)
  end
end

RSpec.describe 'routes for Registrations', type: :routing do
  it 'routes POST /registrations to the registrations controller' do
    expect(post('/registrations')).to route_to(controller: :registrations, action: :create)
  end

  it 'routes PUT /registrations to the registrations controller' do
    expect(put('/registrations')).to route_to(controller: 'registrations', action: :update)
  end

  it 'routes DELETE /registrations to the registrations controller' do
    expect(delete('/registrations')).to route_to(controller: :registrations, action: :destroy)
  end
end
