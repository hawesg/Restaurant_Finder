class Restaurant < ActiveRecord::Base
  belongs_to :category
  validates_presence_of :name
  scope :random, :order => "Rand()"
  def self.list_options
    Category.all.map{|s| {"id" => s.id, "name" => s.name} }
  end
  def from_menu_pages_url(url)
    agent = Mechanize.new
    page = agent.get(url)
    @response = page.content
    doc = Hpricot(@response)
    self[:name] = (doc/"/html/body/div[3]/div/div[2]/div/div/div/h2")[0].innerHTML
    self[:address] = doc.search("li[@class*=address]").search("span[@class*=street-address]").innerHTML #{}"#{address} , #{address2}, #{walk}"
    self[:phone] = (doc/"/html/body/div[3]/div/div[2]/div/div/div/div/ul/li/strong").innerHTML
    self[:walk] = (doc.search("li[@class*=address]").search("span[@class*=postal-code]").innerHTML == "90401") ? true: false
    self[:deliver] = (doc.search("dl[@class*=features]").search("dd[@class*=note]").innerHTML.match("Deliver")) ? true: false
    self[:menu] = "http://losangeles.menupages.com" + doc.search("li[@id=menu-tab]").search("a").to_s.match('(\/[^"]*)').to_s
  end
end
