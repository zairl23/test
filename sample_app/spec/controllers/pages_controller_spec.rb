require 'spec_helper'

describe PagesController do
  render_views


  describe "GET 'home'" do
    it "have the right title" do
      get 'home'
      response.should have_selector("title",
        :content => "Ruby on Rails Tutorial Sample App | Home")

    end
  end

  describe "GET 'contact'" do
    it "have the right title" do
      get 'contact'
      response.should have_selector("title",
        :content => "Ruby on Rails Tutorial Sample App | Contact")

    end
  end
  
  describe "GET 'about'" do
    it "have the right title" do
      get 'about'
      response.should have_selector("title",
        :content => "Ruby on Rails Tutorial Sample App | About")

   end
  end


end
