require 'rubygems'
require 'nokogiri'
require 'open-uri'


##############Récupération du cours des crypto monnaie##################
def get_currency()
    puts "Récupération des données..."
    url = "https://coinmarketcap.com/all/views/all/"
    currencies = Array.new

    page = Nokogiri::HTML(open(url))
    ## Ici on va chercher l'endroit où se trouve la currencies, et a chaque fois on le push dans une array##
    links = page.css('//*[@id="currencies-all"]/tbody/tr/td[5]').each do |link|
    link2 = link.text
    currencies.push(link2)
    end

    ## Pour éviter de pourrir le terminal ##
    puts "Données récupérées avec succès"
    puts "Afficher le cours des cryptomonaies (ça fait beaucoup de texte) ? (y/n)"
    rep=gets.chomp
      if rep == "y"
        puts currencies
      else
        puts "Bien reçu chef !"
    end

end

#################Méthode pour récupérer le nom des cryptomonnaies########################
def get_names()
  url = "https://coinmarketcap.com/all/views/all/"
  names =Array.new
  page = Nokogiri::HTML(open(url))
  links = page.css('//*[@id="currencies-all"]/tbody/tr/td.no-wrap.currency-name/a').each do |link|
  link3 = link.text
  names.push(link3)

  end
  return names
end

###################### Récupération du cours des monnaies #####################
get_currency()
