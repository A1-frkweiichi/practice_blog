class EntriesController < ApplicationController
  before_action :set_blog, only: [:index, :new, :create, :destroy]
  before_action :set_entry, only: %i[ show edit update destroy ]

  # GET /entries or /entries.json
  def index
    @entries = @blog.entries
  end

  # GET /entries/1 or /entries/1.json
  def show
  end

  # GET /entries/new
  def new
    @entry = @blog.entries.build
  end

  # GET /entries/1/edit
  def edit
  end

  # POST /entries or /entries.json
  def create
    @entry = @blog.entries.build(entry_params)

    respond_to do |format|
      if @entry.save
        format.html { redirect_to blog_entry_url(@blog, @entry), notice: "Entry was successfully created." }
        format.json { render :show, status: :created, location: blog_entry_url(@blog, @entry) }
      else
        format.html { render :new }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entries/1 or /entries/1.json
  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to blog_entry_url(@blog, @entry), notice: "Entry was successfully updated." }
        format.json { render :show, status: :ok, location: blog_entry_url(@blog, @entry) }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1 or /entries/1.json
  def destroy
    @entry.destroy!

    respond_to do |format|
      format.html { redirect_to blog_path(@blog), notice: "Entry was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_blog
      @blog = Blog.find(params[:blog_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @blog = Blog.find(params[:blog_id])
      @entry = @blog.entries.find(params[:id])
    end    

    # Only allow a list of trusted parameters through.
    def entry_params
      params.require(:entry).permit(:title, :body, :blog_id)
    end
end
