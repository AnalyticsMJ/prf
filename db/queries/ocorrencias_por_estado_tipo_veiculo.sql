select 
	stat.uf
	,sum(stat.oco_bicicleta) qtd_ocorrencias_bicicleta
	,sum(stat.oco_motocicleta) qtd_ocorrencias_motocicleta 
	,sum(stat.oco_automovel) qtd_ocorrencias_automovel 
	,sum(stat.oco_caminhao) qtd_ocorrencias_caminhao 
	,sum(stat.oco_onibus) qtd_ocorrencias_onibus 
from (
	select 
		tmuuf uf
		, case when tvvcodigo = 1 then count(1) end as 'oco_bicicleta'
		, case when tvvcodigo in (3,4) then count(1) end as 'oco_motocicleta'
		, case when tvvcodigo in (7,16,17,23) then count(1) end as 'oco_automovel'
		, case when tvvcodigo in (13,18,25) then count(1) end as 'oco_caminhao'
		, case when tvvcodigo in (8,9) then count(1) end as 'oco_onibus'
	from ocorrenciaveiculo
	join ocorrencia on ocoid = ocvocoid
	join veiculo on veiid = ocvveiid
	join tipoveiculo on tvvcodigo = veitvvcodigo
	join municipio on tmucodigo = ocomunicipio
	where tvvcodigo in (1,3,4,7,16,17,23,13,18,25,8,9)
	group by tmuuf, tvvcodigo
) as stat
group by uf

