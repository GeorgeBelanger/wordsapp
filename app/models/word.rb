class Word < ApplicationRecord


	validates :untranslated_word, presence: true
	validates :translated_word, presence: true
	#belongs_to :user
	default_scope { order(common_rank: :asc) }

	include PgSearch
	pg_search_scope :search_engine, :against => [:translated_word]
	scope :translated_word, -> (input_translated_word) { where("translated_word ILIKE ?", "%#{input_translated_word}%") }
	
end
