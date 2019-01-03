class CreateShortenedUrls < ActiveRecord::Migration[5.2]
  def self.up
  	create_table :shortened_urls do |s|
  		s.string :url
  	end
  	add_index :shortened_urls, :url
  end
  
  def self.down
  	drop_table :shortened_urls
  end
end
