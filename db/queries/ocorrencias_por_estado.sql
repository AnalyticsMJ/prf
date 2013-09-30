use prf;

select @rownum := @rownum + 1 AS rank,
  stat.*
from (
	select 
	 tmuuf uf, count(distinct ocoid) 'qtd_ocorrencia', cast(count(distinct ocoid) / (populacao /100000) as UNSIGNED INTEGER) 'acidentes_por_100_mil'
	 from ocorrencia
	 left join ocorrenciaacidente on ocoid = oacocoid
	 join municipio on tmucodigo = ocomunicipio
	 join ufestatistica on uf = tmuuf 
	 group by tmuuf 
	ORDER BY 3 DESC
) as stat

 join (SELECT @rownum := 0) r
