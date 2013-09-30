use prf;

-- ALTER TABLE pessoa ADD FOREIGN KEY (pesveiid) REFERENCES veiculo(veiid);

ALTER TABLE unidadeoperacional ADD FOREIGN KEY (unittucodigo) REFERENCES tipounidadeoperacional(ttucodigo);

-- ALTER TABLE ocorrenciaveiculo ADD FOREIGN KEY (ocvocoid) REFERENCES ocorrencia(ocoid);
-- ALTER TABLE ocorrenciaveiculo ADD FOREIGN KEY (ocvveiid) REFERENCES veiculo(veiid);

ALTER TABLE ocorrenciapessoa ADD FOREIGN KEY (opeocoid) REFERENCES ocorrencia(ocoid);
ALTER TABLE ocorrenciapessoa ADD index ix_pessoa (opepesid);
ALTER TABLE ocorrenciapessoa ADD FOREIGN KEY (opettecodigo) REFERENCES tipoenvolvido(ttecodigo);

ALTER TABLE ocorrenciaacidente ADD INDEX IX_ocorrencia (oacocoid);
ALTER TABLE ocorrenciaacidente ADD index IX_tipoacidente (oacttacodigo);

ALTER TABLE pessoa ADD index ix_estadofisico (pesestadofisico);

alter table ocorrencia add index ix_municipio (ocomunicipio);

alter table ocorrencia add column ocouf char(2);
 

UPDATE ocorrencia 
 join municipio on tmucodigo = ocomunicipio
 SET ocouf = tmuuf;

alter table ocorrencia add index ix_uf (ocouf);

