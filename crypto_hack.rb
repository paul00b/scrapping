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
    return currencies
    ## Pour éviter de pourrir le terminal ##


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
currencies = get_currency()
names = get_names()

n = 0
i = 0
puts "Données récupérées avec succès"
puts "Afficher le cours des cryptomonaies (ça fait beaucoup de texte mais c'est joli) ? (tapez y ou n)"
rep=gets.chomp
  if rep == "y"

    ##### Grâce à cette boucle, on joint ensemble le nom et la currency
    while  n < currencies.length
                puts names[i] + currencies[i]
                puts "---------------"
                n +=1
                i +=1
    end
  else
    puts "Bien reçu chef, on affiche rien :) !"
end
