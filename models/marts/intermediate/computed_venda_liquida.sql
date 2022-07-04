with venda_liquida as(
    select SurrogateKey,ROUND(G_AVV020+IEC_Vendas+Descontos_Fixos+Descontos_Promocionais+Promocoes_Cruzadas,2) as Venda_Liquida, Rappel_e_Afins
    from {{ref('stg_dados_transacionais')}}
),gastos_com_clientes as(
    select SurrogateKey,(Accoes_Sell_Out+Exclusivos_CNH+Descontos_PP+Outros+Coop_Gastos+Exclusivos_PV+Comparticipacoes_FM+Fundo_Mkt_Gastos+
    Espacos_e_Folhetos+Aberturas+Aniversarios+Contratos_PI+Cupoes_e_Vales-IEC_AO) as Gastos_Com_Clientes
    from {{ref('stg_dados_transacionais')}}
), venda_liquida_net as(
    select a.SurrogateKey as SurrogateKey, (a.Venda_Liquida+a.Rappel_e_Afins) as Venda_Liquida_Net,a.Venda_Liquida as Venda_Liquida
    from venda_liquida a
),venda_liquida_netnet as (
    select a.SurrogateKey,(a.Venda_Liquida_Net+b.Gastos_Com_Clientes) as Venda_Liquida_NetNet  ,a.Venda_Liquida as Venda_Liquida,a.Venda_Liquida_Net as Venda_Liquida_Net 
    from venda_liquida_net a
    inner join gastos_com_clientes b
    on a.SurrogateKey=b.SurrogateKey
), final as(
    select a.SurrogateKey,a.Venda_Liquida, a.Venda_Liquida_Net,b.Gastos_Com_Clientes, a.Venda_Liquida_NetNet
    from  venda_liquida_netnet a
    inner join gastos_com_clientes b
    on a.SurrogateKey=b.SurrogateKey
)
select *
from final