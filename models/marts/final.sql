with joined as (
    select cast(a.ID_DATA as INTEGER) as ID_DATA, cast(a.ID_Cliente as INTEGER) as ID_Cliente, cast(a.ID_RECEBEDOR as INTEGER) as ID_RECEBEDOR, a.ID_HIERARQUIA_CLIENTES as ID_HIERARQUIA_CLIENTES,
 b.Venda_Liquida as Venda_Liquida,b.Venda_Liquida_Net as Venda_Liquida_Net,b.Gastos_Com_Clientes as Gastos_Com_Clientes,b.Venda_Liquida_NetNet as Venda_Liquida_NetNet,
 c.Custo_de_Transporte as Custo_de_Transporte,
 d.DSC_Mercado_Recebedor as Pais,
 e.Ano as Ano, e.Mes as Mes, e.Ano_mes as Ano_Mes
from {{ref('stg_dados_transacionais')}} a
inner join {{ref('computed_venda_liquida')}} b
on a.SurrogateKey=b.SurrogateKey
inner join {{ref('computed_custo_transporte')}} c
on b.SurrogateKey=c.SurrogateKey
inner join {{ref('stg_hierarquia_cliente')}} d
on a.ID_HIERARQUIA_CLIENTES=d.ID_HIERARQUIA_CLIENTE
inner join {{ref('stg_dim_data')}} e
on a.ID_DATA=e.Data), grouped as (
 select ID_Cliente,ID_RECEBEDOR,ID_HIERARQUIA_CLIENTES, 
 round(sum(Venda_Liquida),2) as Venda_Liquida, round(sum(Venda_Liquida_Net),2) as Venda_Liquida_Net, round(sum(Gastos_Com_Clientes),2) as Gastos_Com_Clientes ,
 round(sum(Venda_Liquida_NetNet),2) as Venda_Liquida_NetNet ,round(sum(Custo_de_Transporte),2) as Custo_de_Transporte,
 Pais, Ano,Mes,Ano_Mes
 from joined
 group by ID_Cliente,ID_RECEBEDOR,ID_HIERARQUIA_CLIENTES,Pais, Ano,Mes,Ano_Mes
)

select *
from grouped