-- alter table localbr add column lbrkm_dec decimal(5,1) null;
-- 
-- update ignore localbr 
-- set lbrkm_dec = cast(substring(lbrkm,1,4) as signed) + (cast(substring(lbrkm,5,1) as signed)/10)
-- where lbrkm not like '-%' ;

 -- alter table localbr add column snv char(10) null;

 -- alter table  localbr add index ix_br_km (lbrbr, lbrkm_dec);


 -- update ignore localbr this
--  join  rodovias on substring(codigo_rod from 4) = lbrbr 
-- 	  and lbrkm_dec between km_inicial and km_final
--       and lbruf = uf
--  set this.snv = rodovias.snv

;
select snv, count(1) qtd
from localbr
join ocorrencia on ocolocal = lbrid
where snv is not null
group by snv
limit 1000000
