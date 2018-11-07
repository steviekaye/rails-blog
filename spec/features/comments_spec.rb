require 'rails_helper'

RSpec.feature "Comments", type: :feature do

  scenario "create a comment" do
    comment = FactoryBot.build(:comment)

    visit root_path
    click_link 'Read article'

    expect {
      fill_in "Commenter", with: comment.commenter
      fill_in "Body", with: comment.body
      click_on "Create Comment"
    }.to change(Comment.all, :count).by(1)

    expect(page).to have_content comment.commenter
    expect(page).to have_content comment.body
  end

  scenario "delete a comment", js: true do
    comment = FactoryBot.create(:comment)

    visit root_path
    click_link 'Read article'

    expect {

    accept_alert 'Are you sure?' do
      click_link 'Delete comment'
    end
    sleep 1.second
  }.to change(Comment.all, :count).by(-1)
  end
end
