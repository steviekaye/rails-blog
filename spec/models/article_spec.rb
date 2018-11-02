require 'rails_helper'

RSpec.describe Article, type: :model do

  context "when a title has a length of at least five characters" do
    it "is valid" do
      article = Article.new(
        title: "Title",
        category: Category.new(),
        text: "I'm an article"
      )

      expect(article).to be_valid
    end
  end

  context "when a title has a length of less than five characters" do
    it "is invalid" do
      article = Article.new(
        title: "Wow",
        category: Category.new(),
        text: "I'm an article"
      )

      article.valid?

      expect(article.errors[:title]).to include("is too short (minimum is 5 characters)")
    end
  end

  context "when the body has a length of at least two characters" do
    it "is valid" do
      article = Article.new(
        title: "Title",
        category: Category.new(),
        text: "I'm an article"
      )

      expect(article).to be_valid
    end
  end

  context "when the body has a length of less than two characters" do
    it "is invalid" do
      article = Article.new(
        title: "Wow",
        category: Category.new(),
        text: "a"
      )

      article.valid?
      
      expect(article.errors[:text]).to include("is too short (minimum is 2 characters)")
    end
  end


end
