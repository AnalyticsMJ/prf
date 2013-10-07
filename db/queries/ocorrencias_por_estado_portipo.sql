use prf;
-- localbr.lbrbr = nome da estrada
--
select tmuuf ESTADO
 , ttadescricao
 ,count(ocoid) 'QTD_OCORRENCIA'
 from ocorrencia
 left join ocorrenciaacidente on ocoid = oacocoid
JOIN tipoacidente on ttacodigo =oacttacodigo
 join municipio on tmucodigo = ocomunicipio
  join localbr on lbrid = ocolocal
 group by tmuuf, ttadescricao
order by 1,3 desc

-- ocostatus = sempre S 
-- ocotipo = sempre 1
;
