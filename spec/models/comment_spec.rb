require 'rails_helper'

RSpec.describe Comment, type: :model do

  context "when a commenter exists" do
    it "is valid" do
      comment = Comment.new(
        commenter: "Mr T",
        article: Article.new(),
        body: "I'm a comment"
      )
      expect(comment).to be_valid
    end
  end

  context "when a commenter doesn't exist" do
    it "is invalid" do
      comment = Comment.new(
        article: Article.new(),
        body: "I'm a comment"
      )
      comment.valid?
      expect(comment.errors[:commenter]).to include("can't be blank")
    end
  end

  context "when a comment body doesn't exist" do
    it "is invalid" do
      comment = Comment.new(
        commenter: "Mr T",
        article: Article.new()
      )
      comment.valid?
      expect(comment.errors[:body]).to include("can't be blank")
    end
  end

end
