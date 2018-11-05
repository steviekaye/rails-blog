require 'rails_helper'

RSpec.describe Article, type: :model do
  context "an article is valid with valid attributes" do
    it "is valid" do
      article = FactoryBot.build(:article)

      expect(article).to be_valid
    end
  end

  context "when a title has a length of less than five characters" do
    it "is invalid" do
      article = FactoryBot.build(:article, title: 'wow')
      article.valid?

      expect(article.errors[:title]).to include("is too short (minimum is 5 characters)")
    end
  end

  context "when the body has a length of less than two characters" do
    it "is invalid" do
      article = FactoryBot.build(:article, text: 'a')
      article.valid?

      expect(article.errors[:text]).to include("is too short (minimum is 2 characters)")
    end
  end
end
