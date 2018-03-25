require 'rails_helper'

RSpec.describe Word, type: :model do

  context "validations" do
    it "should have untranslated and translated word" do
      should have_db_column(:translated_word).of_type(:string)
      should have_db_column(:untranslated_word).of_type(:string)
      # should have_db_column(:user_id).of_type(:integer)
    end

    describe "validates presence of attributes" do
      it { is_expected.to validate_presence_of(:translated_word) }
      it { is_expected.to validate_presence_of(:untranslated_word) }
    end

  end

  context "associations" do
    # it { is_expected.to belong_to(:user) }
  end

  context 'most common word shown first' do
    it 'retrieves the most common word first' do
      word_1 = Word.create(translated_word: "much", untranslated_word:"mucho", common_rank:98)
      word_2 = Word.create(translated_word: "of", untranslated_word:"de", common_rank:1)
      expect(Word.first).to eq(word_2)
    end
  end

  it "finds a searched word by english word" do
    word = Word.create(translated_word: "much", untranslated_word:"mucho", common_rank:98)
    @result = Word.find_by(translated_word: "much")
    expect(@result).to eq(word)
  end

end
