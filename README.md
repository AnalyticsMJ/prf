prf
===

Este master branch contem os dados e scripts para extração de dados que alimentam o site [Ocorrencias em rodovias federais](http://analyticsmj.github.io/prf/).


O website foi desenvolvido diretamente na branch `gh-pages`, e está disponível [aqui](http://analyticsmj.github.io/prf/).


Use `ruby unzip_data.rb` para expandir os zips que estão dentro de da pasta `data` (serão expandidas para a pasta `temp`).


Dentro da pasta `db`, utilize `./seed_data` para criar tabelas e carregar dump de dados.


Use `./generate_state_svg` para gerar os svgs com base nos shapefiles das rodovias e da divisão política dos estados. O shape file das rodovias pode ser encontrado no site do [DNIT](http://www.dnit.gov.br/mapas-multimodais/shapefiles "Shapefiles do DNIT"). 


Os dados quantitativos de acidentes foram agregados ao svg utilizando o [QGIS](http://www.qgis.org) e através de joins com os dados exportados pela consulta `acidentes_por_snv.sql`, atualmente salvos no arquivo `acidentes_por_localbr.csv`.


A geração dos svgs utiliza a biblioteca [kartograph](http://kartograph.org/ "Kartograph").

