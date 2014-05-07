require 'spec_helper'

feature "User adds a new link" do
  scenario "when browsing the hoempage" do
    expect(Link.count).to eq(0)
    visit '/'
    add_link("http://www.makersacademy/", "Makers Academy")
    expect(Link.count).to eq(1)
    link = Link.first
    expect(link.url).to eq("http://www.makersacademy.com/")
    expect(link.title).to eq("Makers Academy")
  end
end
