class WordsController < ApplicationController
  before_action :authorize, only: [:edit, :update, :destroy]
  before_action :set_word, only: [:show, :edit, :update, :destroy]

  # GET /words
  # GET /words.json
  def index
    if !params[:language].nil?
      @words = Word.where(language:params[:language], user_id:current_user.id)
    else
      @words = nil
    end
  end

  # GET /words/1
  # GET /words/1.json
  def show
    set_word
  end

  # GET /words/new
  def new
    @word = Word.new
  end

  # GET /words/1/edit
  def edit
    set_word
  end

  # POST /words
  # POST /words.json
  def create
    @word = Word.new(word_params)
    @word.user_id = current_user.id

    respond_to do |format|
      if @word.save
        format.html { redirect_to @word, notice: 'Word was successfully created.' }
        format.json { render :show, status: :created, location: @word }
      else
        format.html { render :new }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def new_language_spanish
  if !current_user.languages.include?("Spanish")
    Word.spanish_populate(params[:language], current_user)
    current_user.languages << "Spanish"
    current_user.save
  end
    redirect_to root_url(language: "Spanish")
end

def new_language_french
  if !current_user.languages.include?("French")
    Word.french_populate(params[:language], current_user)
    current_user.languages << "French"
    current_user.save
  end
    redirect_to root_url(language: "French")
end

def new_language_german
  if !current_user.languages.include?("German")
    Word.german_populate(params[:language], current_user)
    current_user.languages << "German"
    current_user.save
  end
    redirect_to root_url(language: "German")
end


  # PATCH/PUT /words/1
  # PATCH/PUT /words/1.json
  def update
    respond_to do |format|
      if @word.update(word_params)
        format.html 
        format.js
      else
        format.html { render :edit }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /words/1
  # DELETE /words/1.json
  def destroy
    @word.destroy
    respond_to do |format|
      format.html { redirect_to words_url, notice: 'Word was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    @words = Word.where(user_id:current_user[:id]) 

    search_params(params).each do |key, value|
      @words = @words.public_send(key, value) if value.present?
  
    end
    # @search_keyword = value


    respond_to do |format|
     format.html { render :index }                    
     format.js
    end
  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_word
      @word = Word.find_by(id:params[:id], user_id:current_user.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def word_params
      params.require(:word).permit( :user_id,
    :language,
    :untranslated_word,
    :translated_word,
    :user_phonem,
    :common_rank,
    :audio_link,)
    end

    def search_params(params)
      params.slice(:untranslated_word, :translated_word)
    end 
end
