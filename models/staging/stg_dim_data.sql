select cast(Data as INTEGER) as Data,cast(Ano as integer) as Ano, Mes, Ano_Mes
{% if target.name == 'dev' %}
from {{source('Demo_dev','dim_data')}}
{% elif target.name == 'prod' %}
from {{source('Demo_prod','dim_data')}}
{% endif %}
