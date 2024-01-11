class BooksMarksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book


end
