require 'rails_helper'

RSpec.describe Article, type: :model do

  it "Testing uniquiness" do
    article1 = Article.new(title: "This is a test article", description: "this is a new article with an description").save
    article2 = Article.new(title: "This is a test article", description: "this is a new article with an description").save
    expect(article2).to be_falsey
  end

  it "testing search field" do
    Article.new(title:"Hello world tester!", description: "This is a search field test!").save
    expect(Article.first.search).to eq("hello world tester! this is a search field test!")
  end

  it "testing if it possible to delete" do
    Article.new(title: "This is a test article", description: "this is a new article with an description").save
    expect{Article.first.destroy}.to raise_error("ERROR! This object can't be destroyed")
  end
end