use prf;


select 
 cast(ocouf as char(2)) uf, year(ocodataocorrencia) ano,  hour(ocodataocorrencia) hora,  count(1) 'qtd_ocorrencia'
 from ocorrencia 
 where ocouf is not null and year(ocodataocorrencia) > 2006
 group by ocouf, year(ocodataocorrencia), hour(ocodataocorrencia)
 ORDER BY 1, 2

