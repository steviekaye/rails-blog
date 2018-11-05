require 'rails_helper'

RSpec.describe Comment, type: :model do
  context "when a comment has all necessary fields" do
    it "is valid" do
      comment = FactoryBot.build(:comment)

      expect(comment).to be_valid
    end
  end

  context "when a commenter field is blank" do
    it "is invalid" do
      comment = FactoryBot.build(:comment, commenter: nil)
      comment.valid?

      expect(comment.errors[:commenter]).to include("can't be blank")
    end
  end

  context "when a comment body doesn't exist" do
    it "is invalid" do
      comment = FactoryBot.build(:comment, body: nil)
      comment.valid?

      expect(comment.errors[:body]).to include("can't be blank")
    end
  end
end
