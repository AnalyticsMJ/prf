use prf;


select 
 cast(ocouf as char(2)) uf,  hour(ocodataocorrencia) hora,  count(1) 'qtd_ocorrencia'
 from ocorrencia 
 where ocouf is not null
 group by ocouf,  hour(ocodataocorrencia)
 ORDER BY 1, 2

