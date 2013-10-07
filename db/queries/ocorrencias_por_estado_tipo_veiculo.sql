select 
	tmuuf uf
	, case  
		when tvvcodigo = 1 then 'Bicicleta'
		when tvvcodigo in (3,4) then 'Motocicleta'
		when tvvcodigo in (7,16,17,23) then 'Automovel'
		when tvvcodigo in (13,18,25) then 'Caminhao'
		when tvvcodigo in (8,9) then 'Onibus'
		else ''
		end as 'tipo_veiculo'
	, count(ocvid) 'qtd_ocorrencias'
from ocorrenciaveiculo
join ocorrencia on ocoid = ocvocoid
join veiculo on veiid = ocvveiid
join tipoveiculo on tvvcodigo = veitvvcodigo
join municipio on tmucodigo = ocomunicipio
where tvvcodigo in (1,3,4,7,16,17,23,13,18,25,8,9)
group by tmuuf, tipo_veiculo



