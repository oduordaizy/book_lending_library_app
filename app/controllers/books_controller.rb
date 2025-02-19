class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]

  # GET /books or /books.json - for displaying books
  def index
    @books = Book.all
  end

  # GET /books/1 or /books/1.json - for showing details of a specific book
  def show
  end

  # GET /books/new - Creating a new book
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # Editing an existing book
  def edit
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy!

    respond_to do |format|
      format.html { redirect_to books_path, status: :see_other, notice: "Book was successfully deleted." }
      format.json { head :no_content }
    end
  end

  def borrow
    if @book.available?
      @book.lending_histories.create(
        borrower_name: params[:borrower_name],
        borrowed_at: Time.current
      )
      redirect_to @book, notice: "Book has been borrowed"
    else
        redirect_to @book, notice: "Book has is already borrowed"
    end
  end

  def return_book
    most_recent = @book.lending_histories.where(returned_at: nil).last

    if most_recent
      most_recent.update(returned_at: Time.current)
      redirect_to @book, notice: "Book has been returned."
    else
      redirect_to @book, alert: "This book is not currently borrowed."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.expect(book: [ :title, :author, :available ])
    end
end
