select s.*,
(100-qtd_ocorrencias_bicicleta-qtd_ocorrencias_motocicleta-qtd_ocorrencias_automovel-qtd_ocorrencias_caminhao)  qtd_ocorrencias_onibus

from(
	select 
		cast(stat.uf as char(2)) uf
		,stat.ano
		, cast(100 * sum(ifnull(stat.oco_bicicleta,0))   / sum(total) as unsigned) qtd_ocorrencias_bicicleta
		, cast(100 * sum(stat.oco_motocicleta) / sum(total) as unsigned) qtd_ocorrencias_motocicleta 
		, cast(100 * sum(stat.oco_automovel)   / sum(total) as unsigned) qtd_ocorrencias_automovel 
		, cast(100 * sum(stat.oco_caminhao)    / sum(total) as unsigned) qtd_ocorrencias_caminhao 
		
		
	from (
		select 
			ocouf uf
			, year(ocodataocorrencia) ano
			, case when tvvcodigo = 1 then count(1) end as 'oco_bicicleta'
			, case when tvvcodigo in (3,4) then count(1) end as 'oco_motocicleta'
			, case when tvvcodigo in (7,16,17,23) then count(1) end as 'oco_automovel'
			, case when tvvcodigo in (13,18,25) then count(1) end as 'oco_caminhao'
			, case when tvvcodigo in (8,9) then count(1) end as 'oco_onibus'
			, count(1) total
		from ocorrenciaveiculo
		join ocorrencia on ocoid = ocvocoid
		join veiculo on veiid = ocvveiid
		join tipoveiculo on tvvcodigo = veitvvcodigo
		where tvvcodigo in (1,3,4,7,16,17,23,13,18,25,8,9)
		  and year(ocodataocorrencia) > 2006
		group by ocouf, year(ocodataocorrencia), tvvcodigo
	) as stat
	group by uf, ano) s

