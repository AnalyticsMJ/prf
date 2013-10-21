use prf;

select uf, ano, rank, acidentes_por_100_mil
from(
	select @row_num := IF(@prev_value=stat.ano,@row_num+1,1) AS rank,
	  stat.*,
	  @prev_value := stat.ano
	from (
		select 
		 ocouf uf, year(ocodataocorrencia) ano, count(distinct ocoid) 'qtd_ocorrencia', cast(count(distinct ocoid) / (populacao /100000) as UNSIGNED INTEGER) 'acidentes_por_100_mil'
		 from ocorrencia
		 left join ocorrenciaacidente on ocoid = oacocoid
		 join ufestatistica on uf = ocouf 
		 where year(ocodataocorrencia) > 2006
		 group by ocouf, year(ocodataocorrencia) 
		ORDER BY 2, 4 DESC
	) as stat

	 join (SELECT @rownum := 0) r
	 join (SELECT @prev_value := 0) y

)a 
order by 1,2,3