class EntriesController < ApplicationController
  # GET /entries
  # GET /entries.json
  def index
    @entries = Entry.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @entries }
    end
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
    @entry = Entry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @entry }
    end
  end

  # GET /entries/new
  # GET /entries/new.json
  def new
    @entry = Entry.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @entry }
    end
  end

  # GET /entries/1/edit
  def edit
    @entry = Entry.find(params[:id])
    # Prepopulate categories
    @categories = @entry.categories_stringlified;
    
  end

  # POST /entries
  # POST /entries.json
  def create

    
    @entry = Entry.new(params[:entry])

    respond_to do |format|
      if @entry.save
        format.html { redirect_to @entry, notice: "Entry has been well created" }
        format.json { render json: @entry, status: :created, location: @entry }
      else
        flash[:errors] = "Entry hasn't been created! Verify that every required fields are filled." 
        format.html { render action: "new" }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /entries/1
  # PUT /entries/1.json
  def update
    
    @entry = Entry.find(params[:id])

    tokens = params[:entry][:category_tokens].to_s
    
    params[:entry][:category_ids] = Category.ids_from_tokens(tokens)
    
    tokens = params[:entry].delete([:category_tokens])
    
    respond_to do |format|
      if @entry.update_attributes(params[:entry])
        format.html { redirect_to @entry, notice: 'Entry was nicely updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit", notice: 'Something goes wrong when you updated this entry' }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy

    respond_to do |format|
      format.html { redirect_to entries_url }
      format.json { head :ok }
    end
  end
end
