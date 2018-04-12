require 'rubygems'
require 'nokogiri'
require 'open-uri'


##############Récupération du mail d'une page précise##################
def get_the_email_of_a_townhal_from_its_webpage (url_page)

    url = url_page

    page = Nokogiri::HTML(open(url))
    links = page.css('div/main/section[2]/div/table/tbody/tr[4]/td[2]')
    links.each{|link| puts link.text}

end


#############Récupération de toutes les urls#######################

def get_all_the_urls_of_val_doise_townhalls(url_dept)
  page = Nokogiri::HTML(open(url_dept))
#Définition d'une array dans laquelle on stock les données
  nameArray = Array.new
#Récupération des données
  links = page.css('a.lientxt').each do |link|
      link2 = link["href"]
#Ajout des données dans l'array
      nameArray.push("http://annuaire-des-mairies.com"+ link2)

  end
#Affichage test des array
return nameArray
end

################### Mise en route des fonctions #####################
puts "Utiliser l'url par défaut ? (y/n)"
rep = gets.chomp
  if  rep =="y"
    url_dept = "http://annuaire-des-mairies.com/val-d-oise.html"
  else
    puts "Quel est l'url de la page ?"
      url_dept = gets.chomp
  end

url = get_all_the_urls_of_val_doise_townhalls(url_dept) # Stock du résultat de la fonction dans une variable url
puts url.each{|link| get_the_email_of_a_townhal_from_its_webpage(link)} #Pour chaque résultat, donc chaque url, je lui applique la fonction
