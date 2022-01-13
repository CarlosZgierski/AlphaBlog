require 'rails_helper'

RSpec.describe Article, type: :model do

  subject { Article.new(title: "This is a test article", description: "this is a new article with an description") }

  it "Testing uniquiness" do
    subject.save
    test_article = Article.new(title: "This is a test article", description: "this is a new article with an description")
    save_status = test_article.save
    expect(save_status).to be_falsey
    expect(test_article.errors[:title].first).to eq("has already been taken")
  end

  it "testing search field" do
    subject.save
    expect(subject.search).to eq("this is a test article this is a new article with an description")
  end

  it "testing if it possible to delete" do
    subject.save
    expect{subject.destroy}.to raise_error("ERROR! This object can't be destroyed")
  end
end