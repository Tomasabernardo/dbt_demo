select cast(ID_HIERARQUIA_CLIENTE as INTEGER) as ID_HIERARQUIA_CLIENTE,DSC_Mercado_Recebedor
from {{source('Demo','hierarquia_cliente')}}