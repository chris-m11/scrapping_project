
require "rubygems"
require "nokogiri"
require "open-uri"

#fonction qui renvoie les symbols associés à ses prix respectifs
def get_symbol_with_price()
  #	url de la page à scrapper
  page_url = "https://coinmarketcap.com/all/views/all/"
  #	ouvrir l'url dans la page
  page = Nokogiri::HTML(open(page_url))
  #	selectionner l'url les lignes dans la table
  line = page.css("table#currencies-all tbody tr")
  result_final = []
  #boucler les lignes
  for index_line in 0...line.size do
    #mettre les hashs dans result_final
    result_final << { line[index_line].css("td")[2].text => line[index_line].css("td")[4].text[2...line[index_line].css("td")[4].text.size - 2].to_f.round(2) }
    
  end
  #renvoyer le resultat final
  return result_final
end

print get_symbol_with_price