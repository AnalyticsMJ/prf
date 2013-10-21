use prf;


select 
 cast(ocouf as char(2)) uf, year(ocodataocorrencia) ano, esid 'ordem_gravidade', cast(esdescricao as char) 'gravidade', count(1) 'qtd_ocorrencia'
 from ocorrencia 
 join (select opeocoid graocoid, max(pesestadofisico) graesid 
		from pessoa join ocorrenciapessoa on opepesid = pesid
		where pesestadofisico != 5 -- ignorado
		group by opeocoid) gravidade on graocoid = ocoid
 join estadofisico on esid = graesid
 where ocouf is not null and year(ocodataocorrencia) >2006
 group by ocouf, year(ocodataocorrencia), esid, esdescricao
 ORDER BY 1, 2, 3

