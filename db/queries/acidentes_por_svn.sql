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

	select snv
		,max(case when ano = 2007 then qtd end ) qtd_2007
		,max(case when ano = 2008 then qtd end ) qtd_2008
		,max(case when ano = 2009 then qtd end ) qtd_2009
		,max(case when ano = 2010 then qtd end ) qtd_2010
		,max(case when ano = 2011 then qtd end ) qtd_2011
		,max(case when ano = 2012 then qtd end ) qtd_2012
	from
		(select snv, year(ocodataocorrencia) ano, count(1) qtd
		from localbr
		join ocorrencia on ocolocal = lbrid
		where snv is not null and year(ocodataocorrencia) > 2006
		group by snv, year(ocodataocorrencia) ) stat
	group by snv
	limit 100000
