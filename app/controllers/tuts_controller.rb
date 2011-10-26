class TutsController < ApplicationController
  # GET /tuts
  # GET /tuts.xml
  def index
    @tuts = Tut.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tuts }
    end
  end

  # GET /tuts/1
  # GET /tuts/1.xml
  def show
    @tut = Tut.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tut }
    end
  end

  # GET /tuts/new
  # GET /tuts/new.xml
  def new
    @tut = Tut.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tut }
    end
  end

  # GET /tuts/1/edit
  def edit
    @tut = Tut.find(params[:id])
  end

  # POST /tuts
  # POST /tuts.xml
  def create
    @tut = Tut.new(params[:tut])

    respond_to do |format|
      if @tut.save
        format.html { redirect_to(@tut, :notice => 'Tut was successfully created.') }
        format.xml  { render :xml => @tut, :status => :created, :location => @tut }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tut.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tuts/1
  # PUT /tuts/1.xml
  def update
    @tut = Tut.find(params[:id])

    respond_to do |format|
      if @tut.update_attributes(params[:tut])
        format.html { redirect_to(@tut, :notice => 'Tut was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tut.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tuts/1
  # DELETE /tuts/1.xml
  def destroy
    @tut = Tut.find(params[:id])
    @tut.destroy

    respond_to do |format|
      format.html { redirect_to(tuts_url) }
      format.xml  { head :ok }
    end
  end
end
