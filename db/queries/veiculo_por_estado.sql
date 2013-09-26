SELECT tmuuf ESTADO, count(pescapacete = 'S'), count(pescapacete = 'N')
from pessoa
  join ocorrenciapessoa on pesid = opepesid
  join ocorrencia on opeocoid = ocoid
  join municipio on tmucodigo = ocomunicipio
-- 
--  join ocorrenciaveiculo on ocvocoid = ocoid
--  join veiculo on ocvveiid = veiid and veitvvcodigo between 1 and 6 -- bicicleta, moto, etc
--   
group by tmuuf