require 'rails_helper'

RSpec.feature "Articles", type: :feature do
  before do
    @category = FactoryBot.create(:category)
  end

  scenario "creates a new article" do
    article = FactoryBot.build(:article)

    visit root_path
    click_link "New article"

    expect {
      fill_in "Title", with: article.title
      fill_in "Text", with: article.text
      select 'My Awesome Category', from: 'category_id'
      click_on "Create Article"
    }.to change(Article.all, :count).by(1)

    expect(page).to have_content article.title
    expect(page).to have_content @category.name
    expect(page).to have_content article.text
  end
end
