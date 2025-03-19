class PagesController < ApplicationController
  def about
    @data_sources = [
      { name: "Fake Store API", url: "https://fakestoreapi.com" },
      { name: "CSV File", url: "Local File (db/products_with_images.csv)" },
      { name: "Faker Gem", url: "https://github.com/faker-ruby/faker" }
    ]
  end
end
