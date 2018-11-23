require "rails_helper"

RSpec.describe Article, type: :model do
  it "creates a new article" do
    expect(Article.new(title: "Testing", text: "Testing Post")).to be_valid
  end

  it "won't create an invalid article" do
    expect(Article.new(title: "no", text: "pass")).not_to be_valid
  end

  it "edits an article" do
    @article = Article.new(title: "Totle", text: "Toxt")
    @article.update(title: "Title", text: "Text")
    expect(@article).to have_attributes(title: "Title")
  end
end