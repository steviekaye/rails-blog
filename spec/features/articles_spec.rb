require 'rails_helper'

RSpec.feature "Articles", type: :feature do
  before do
    @category = FactoryBot.create(:category)
  end

  scenario "unsucessfully create a new article" do
    article = FactoryBot.build(:article)

    visit root_path
    click_link "New article"

    expect {
      fill_in "Title", with: article.title
      select 'My Awesome Category', from: 'category_id'
      click_on "Create Article"
    }.to change(Article.all, :count).by(0)

    expect(page).to have_content "Text can't be blank"
    expect(page).to have_content "Text is too short"
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

  scenario "edit an article" do
    article = FactoryBot.create(:article)

    visit root_path
    click_link 'Edit article'

    expect(page).to have_content "Edit article"

    expect {
      fill_in "Text", with: "This has been edited"
      click_on "Update Article"
    }.to change(Article.all, :count).by(0)

    expect(page).to have_content "This has been edited"
  end

  # commenting out deletion scenario while geckodriver/selenium/firefox
  # interactions are giving     Selenium::WebDriver::Error::UnknownError:
  #     invalid argument: can't kill an exited proces

  scenario "delete an article", js: true do
    article = FactoryBot.create(:article)

    visit root_path

    expect {

    accept_alert 'Are you sure?' do
      click_link 'Delete article'
    end
    sleep 1.second
    }.to change(Article.all, :count).by(-1)
  end
end
