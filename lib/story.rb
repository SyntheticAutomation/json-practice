require 'json'
require 'date'


class Story

  attr_reader :section, :subsection, :title, :abstract, :url, :published_date, :photo

  def initialize(story_index)
    @section = list_of_stories[story_index]["section"]
    @subsection = list_of_stories[story_index]["subsection"]
    @title = list_of_stories[story_index]["title"]
    @abstract = list_of_stories[story_index]["abstract"]
    @url = list_of_stories[story_index]["url"]
    @published_date = Date.parse(list_of_stories[story_index]["published_date"]).strftime("%A %B %d, %Y")
    @photo = photo_check(story_index)
  end

  def list_of_stories
    file = File.read('data/nytimes.json')
    data_hash = JSON.parse(file)
    data_hash["results"]
  end

  def photo_check(specific_story)
    story = list_of_stories[specific_story]
    photos = story["multimedia"]
    normal_pic = photos.find do |pic|
      pic["format"] if pic["format"] == "Normal"
    end
    normal_pic ? normal_pic["url"] : "No Photo Available"
  end
end
