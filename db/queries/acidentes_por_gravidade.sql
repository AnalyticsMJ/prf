use prf;


select 
 cast(ocouf as char(2)) uf, cast(esdescricao as char) 'gravidade', count(1) 'qtd_ocorrencia'
 from ocorrencia 
 join (select opeocoid graocoid, max(pesestadofisico) graesid 
		from pessoa join ocorrenciapessoa on opepesid = pesid
		where pesestadofisico != 5 -- ignorado
		group by opeocoid) gravidade on graocoid = ocoid
 join estadofisico on esid = graesid
 where ocouf is not null
 group by ocouf, esdescricao
 ORDER BY 1, 2

