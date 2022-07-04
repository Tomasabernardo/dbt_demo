select cast(Data as INTEGER) as Data,cast(Ano as integer) as Ano, Mes
from {{source('Demo','dim_data')}}