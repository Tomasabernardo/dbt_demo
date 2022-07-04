select a.ID_DATA as ID_DATA, a.ID_Cliente as ID_Cliente, a.ID_RECEBEDOR as ID_RECEBEDOR, a.ID_HIERARQUIA_CLIENTES,
 b.Venda_Liquida as Venda_Liquida,b.Venda_Liquida_Net as Venda_Liquida_Net,b.Gastos_Com_Clientes as Gastos_Com_Clientes,b.Venda_Liquida_NetNet as Venda_Liquida_NetNet,
 c.Custo_de_Transporte as Custo_de_Transporte,
 d.DSC_Mercado_Recebedor as Pais,
 e.Ano as Ano, e.Mes as Mes
from {{ref('stg_dados_transacionais')}} a
inner join {{ref('computed_venda_liquida')}} b
on a.SurrogateKey=b.SurrogateKey
inner join {{ref('computed_custo_transporte')}} c
on b.SurrogateKey=c.SurrogateKey
inner join {{ref('stg_hierarquia_cliente')}} d
on a.ID_HIERARQUIA_CLIENTES=d.ID_HIERARQUIA_CLIENTE
inner join {{ref('stg_dim_data')}} e
on a.ID_DATA=e.Data