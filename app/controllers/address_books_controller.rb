class AddressBooksController < ApplicationController
  # GET /address_books
  # GET /address_books.xml
  def index
    @address_books = AddressBook.paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @address_books }
    end
  end

  # GET /address_books/1
  # GET /address_books/1.xml
  def show
    @address_book = AddressBook.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @address_book }
    end
  end

  # GET /address_books/new
  # GET /address_books/new.xml
  def new
    @address_book = AddressBook.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @address_book }
    end
  end

  # GET /address_books/1/edit
  def edit
    @address_book = AddressBook.find(params[:id])
  end

  # POST /address_books
  # POST /address_books.xml
  def create
    @address_book = AddressBook.new(params[:address_book])
    @address_book.tag_list = params[:tags]

    respond_to do |format|
      if @address_book.save
        format.html { redirect_to(@address_book, :notice => 'AddressBook was successfully created.') }
        format.xml  { render :xml => @address_book, :status => :created, :location => @address_book }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @address_book.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /address_books/1
  # PUT /address_books/1.xml
  def update
    @address_book = AddressBook.find(params[:id])

    respond_to do |format|
      if @address_book.update_attributes(params[:address_book])
        format.html { redirect_to(@address_book, :notice => 'AddressBook was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @address_book.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /address_books/1
  # DELETE /address_books/1.xml
  def destroy
    @address_book = AddressBook.find(params[:id])
    @address_book.destroy

    respond_to do |format|
      format.html { redirect_to(address_books_url) }
      format.xml  { head :ok }
    end
  end

  def get_city_list
    @cities = AddressBook.all( :conditions => "city LIKE '%#{params[:q]}%'", :select => 'city')
    @cities_list = []
    @cities.each { |add| @cities_list << "#{add.city} " }
    render :text => @cities_list
  end
end
