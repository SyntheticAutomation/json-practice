require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require 'json'
require './lib/story'


class StoryTest < Minitest::Test
  def test_it_exists
    story = Story.new(0)
    assert_instance_of Story, story
  end

  def test_it_has_attributes
    story = Story.new(0)
    assert_equal "U.S.", story.section
    assert_equal "Politics", story.subsection
    assert_equal "How a Lawyer, a Felon and a Russian General Chased a Moscow Trump Tower Deal", story.title
    assert_equal "During the presidential campaign, Michael D. Cohen and Felix Sater, an associate with a criminal past, pursued a new Trump Tower project with a former spymaster’s help.", story.abstract
    assert_equal "https://www.nytimes.com/2018/11/29/us/politics/trump-russia-felix-sater-michael-cohen.html", story.url
    assert_equal "Thursday November 29, 2018", story.published_date
    assert_equal "https://static01.nyt.com/images/2018/11/30/world/30trumpmoscow-1-print/30trumpmoscow7-articleInline.jpg", story.photo
  end

  def it_returns_error_msg_if_no_photo
    fake_story = {
      "section": "U.S.",
      "subsection": "Politics",
      "title": "How a Lawyer, a Felon and a Russian General Chased a Moscow Trump Tower Deal",
      "abstract": "During the presidential campaign, Michael D. Cohen and Felix Sater, an associate with a criminal past, pursued a new Trump Tower project with a former spymaster’s help.",
      "url": "https://www.nytimes.com/2018/11/29/us/politics/trump-russia-felix-sater-michael-cohen.html",
      "byline": "By MIKE McINTIRE, MEGAN TWOHEY and MARK MAZZETTI",
      "item_type": "Article",
      "updated_date": "2018-11-29T23:49:43-05:00",
      "created_date": "2018-11-29T18:46:27-05:00",
      "published_date": "2018-11-29T18:46:27-05:00",
      "material_type_facet": "",
      "kicker": "",
      "des_facet": [
        "Russian Interference in 2016 US Elections and Ties to Trump Associates",
        "Presidential Election of 2016",
        "United States Politics and Government",
        "Espionage and Intelligence Services"
      ],
      "org_facet": [
        "Federal Security Service",
        "House Committee on Intelligence",
        "Republican Party",
        "Trump Organization",
        "Trump Tower (Manhattan, NY)",
        "VTB Bank"
      ],
      "per_facet": [
        "Cohen, Michael D (1966- )",
        "Mueller, Robert S III",
        "Putin, Vladimir V",
        "Sater, Felix H",
        "Trump, Donald J",
        "Trump, Donald J Jr",
        "Trump, Ivanka"
      ],
      "geo_facet": [],
      "multimedia": [
        {
          "url": "https://static01.nyt.com/images/2018/11/30/world/30trumpmoscow-1-print/30trumpmoscow7-thumbStandard.jpg",
          "format": "Standard Thumbnail",
          "height": 75,
          "width": 75,
          "type": "image",
          "subtype": "photo",
          "caption": "Felix Sater, a longtime business associate of President Trump&rsquo;s, drew on deep Russian contacts to pursue a real estate deal during the 2016 campaign. One of those contacts was a former intelligence official in Russia.",
          "copyright": ""
        },
      ],
      "short_url": "https://nyti.ms/2DSwlEI"
    }
    assert_equal "No Photo Available", fake_story.photo
  end

end
