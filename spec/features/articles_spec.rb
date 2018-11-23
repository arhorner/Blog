require 'rails_helper'

RSpec.describe "Articles", type: :feature do
  describe 'viewing an article' do
    let(:article) { create(:article, title: 'My Title') }

    it 'displays a post on the site' do
      visit article_path(article)

      expect(page).to have_content('My Title')
    end
  end

  describe 'viewing a list of articles' do
    let!(:articles) { create_list(:article, 5) }

    it 'displays a list of articles' do
      visit articles_path

      articles.each do |article|
        expect(page).to have_content(article.title)
      end
    end
  end
end
