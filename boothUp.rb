require 'mechanize'

mech = Mechanize.new

mech.get("http://dailybooth.com/$USERNAME/$FIRSTIMAGE") do |page|
  i = 0
  while (p = mech.click(page.link_with(:class => "arrow_back"))) != "" do
  puts p.title
  page = p
  img = page.search "/html/body/div[2]/div/div[5]/div/div/div[2]/div/div/img"
  parts = img.to_s.split("\"")
  pic = mech.get(parts[1])    
  file = File.new("image" + i.to_s + ".jpg", "w")
  file.write(pic.content.read)
  i+= 1
  end
end

