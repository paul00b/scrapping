require 'rubygems'
require 'nokogiri'
require 'open-uri'


##############Récupération du website##################
def get_the_website(url_page)

    url = url_page

    page = Nokogiri::HTML(open(url))
    links = page.css('div#listing-detail-section-description p[7] > a[1]')
    links.each{|link| puts link["href"]}

end

##############Récupération du titre##################
def get_the_title(url_page)

    url = url_page

    page = Nokogiri::HTML(open(url))
    links = page.css('div > h1')
    links.each{|link| puts link.text}

end
#############Récupération de toutes les urls#######################

def get_all_the_urls(url_dept)
  page = Nokogiri::HTML(open(url_dept))
#Définition d'une array dans laquelle on stock les données
  nameArray = Array.new
#Récupération des données
  links = page.css('div#primary div > div > div.listing-row-body > h2 > a').each do |link|
      link2 = link["href"]
#Ajout des données dans l'array
      nameArray.push(link2)

  end
#Affichage test des array
return nameArray
end

################### Mise en route des fonctions #####################
puts "Utilisation de l'URL par défaut (alloweb.org)"
  url_dept = "http://www.alloweb.org/annuaire-startups/annuaire-incubateurs-startups/"
puts "                                                       "

url = get_all_the_urls(url_dept) # Stock du résultat de la fonction dans une variable url
puts "--------------------Sites internet--------------------"
 url.each{|link| get_the_website(link)} #AFFICHAGE DES SITES

puts "                                                       "
 puts "--------------------Titres magiques--------------------"
url.each{|link| get_the_title(link)} #AFFICHAGE DES TITRES
