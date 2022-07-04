select cast(Data as INTEGER) as data, cast(Ano as INTEGER) as Ano, Mes
from {{source('Demo','dim_data')}}