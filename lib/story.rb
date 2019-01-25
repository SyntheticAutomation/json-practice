require 'json'


class Story

  attr_reader :section, :subsection, :title, :abstract, :url, :published_date, :photo

  def initialize(story_index)
    file = File.read('data/nytimes.json')
    data_hash = JSON.parse(file)
    list_of_stories = data_hash["results"]

    @section = list_of_stories[story_index]["section"]
    @subsection = list_of_stories[story_index]["subsection"]
    @title = list_of_stories[story_index]["title"]
    @abstract = list_of_stories[story_index]["abstract"]
    @url = list_of_stories[story_index]["url"]
    @published_date = list_of_stories[story_index]["published_date"]
    @photo = list_of_stories[story_index]["multimedia"][0]["url"]
  end



end
