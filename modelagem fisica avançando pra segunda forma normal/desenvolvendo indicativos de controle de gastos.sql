use universidade_u;
select * from aluno; 
select * from gasto;

select idgasto from gasto where ano = 2019 and tipo = 'realizado';
select idgasto from gasto where ano = 2019 and tipo = 'previsto'; 

select
    (select
		jan
    from
        gasto
	where
        idgasto = (select idgasto from gasto where ano = 2019 and tipo = 'previsto')) -
        
    (select
		jan
    from
        gasto
	where
        idgasto = (select idgasto from gasto where ano = 2019 and tipo = 'realizado')) as resultado_jan;
        
        select
    (select
		fev
    from
        gasto
	where
        idgasto = (select idgasto from gasto where ano = 2019 and tipo = 'previsto')) -
        
    (select
		fev
    from
        gasto
	where
        idgasto = (select idgasto from gasto where ano = 2019 and tipo = 'realizado')) as resultado_fev,
        
       (select
		mar
    from
        gasto
	where
        idgasto = (select idgasto from gasto where ano = 2019 and tipo = 'previsto')) -
        
    (select
		mar
    from
        gasto
	where
        idgasto = (select idgasto from gasto where ano = 2019 and tipo = 'realizado')) as resultado_mar;
        
