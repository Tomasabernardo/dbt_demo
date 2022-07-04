with custo_transporte as(
    select SurrogateKey,(Transporte_Primario+Transporte_Sec_Teorico+Transporte_Sec_Real+Transporte_Sec_Prest_Servicos+Transporte_Abono_Frete) as Custo_de_Transporte
    from {{ref('stg_dados_transacionais')}}
)

select *
from custo_transporte