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
        
select 
	fev as realizado_fevereiro
from 
	gasto 
where 
	tipo = ( select idgasto from gasto where idgasto = 2 );

select ago 
from gasto 
where tipo = 'realizado';

select ago as agosto_realizado
from gasto 
where idgasto = (select idgasto  from gasto where tipo = 'realizado');

select ago as agosto_previsto 
from gasto 
where tipo = (select tipo from gasto where idgasto =2);