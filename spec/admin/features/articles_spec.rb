require "rails_helper"

RSpec.describe "articles", type: :feature do
  context "admin" do
    describe "listing posts" do
      it "displays a blog post listing" do
        create(:article, title: "My Title 2")
        visit_auth admin_articles_path

        expect(page).to have_content("My Title")
        expect(page).to have_content("My Title 2")
      end
    end

    describe "creating a new article with valid data" do
      it "creates a new blog post" do
        visit_auth new_admin_article_path

        fill_in "Title", with: "Example Title"
        fill_in "Text", with: "Example Post"

        click_button "Create Article"

        expect(current_path).to eq("/articles/#{Article.last.id}")
        expect(page).to have_content("Example Title")
      end
    end

    describe "creating an article with invalid data" do
      it "should raise an error" do
        visit_auth new_admin_article_path

        fill_in "Title", with: "A"

        click_button "Create Article"

        expect(page).to have_content("Title is too short (minimum is 5 characters)")
        expect(page).to have_content("Text can't be blank")
      end
    end

    describe "editing an article" do
      let!(:article) { create(:article) }

      it "should edit an existing article" do
        visit_auth edit_admin_article_path(article)

        fill_in "Title", with: 'Edited Title'
        fill_in "Text", with: 'Edited Text'

        click_button "Update Article"

        expect(current_path).to eq(article_path(article))
        expect(page).to have_content('Edited Title')
        expect(page).to have_content('Edited Text')
      end
    end

    describe "deleting an article" do
      let!(:article) { create(:article) }

      it "should delete an existing article" do
       visit_auth admin_articles_path

      page.accept_confirm do
        click_link "Delete"
      end

      expect(page).not_to have_content('test12345')
      end
    end
  end
end
