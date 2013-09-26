use prf;
-- localbr.lbrbr = nome da estrada
--
select tmuuf ESTADO, 
  case when hour(ocodataocorrencia) >= 0 and hour(ocodataocorrencia) <6 THEN 'MADRUGADA'
   when hour(ocodataocorrencia) >= 6 and hour(ocodataocorrencia) <12 THEN 'DIA'
   when hour(ocodataocorrencia) >= 12 and hour(ocodataocorrencia) <18 THEN 'TARDE'
   ELSE 'NOITE'
   end 
   AS HORARIO
,count(ocoid) 'QTD_OCORRENCIA'
 from ocorrencia
 left join ocorrenciaacidente on ocoid = oacocoid
 join municipio on tmucodigo = ocomunicipio
  join localbr on lbrid = ocolocal
 group by tmuuf, horario
order by 1,2,3

-- ocostatus = sempre S 
-- ocotipo = sempre 1
;