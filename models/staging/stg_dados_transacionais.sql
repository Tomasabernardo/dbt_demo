select to_base64(SHA256(concat(cast((ID_DATA+ID_Cliente+ID_Recebedor+ID_Produto+ID_HIERARQUIA_CLIENTES) as STRING)))) as SurrogateKey,*
from {{source('Demo','dados_transacionais')}}
