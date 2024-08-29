*** Settings ***
Documentation    Fluxo feliz - Cadastro de Pregão Eletronico
Library          SeleniumLibrary
Library          Browser
Resource        ../../Resources/Resource_login.robot
Resource        ../../Resources/Resource_cadastro_pregao.robot

*** Test Cases ***
Cenário 01 - Criar Pregão - Aba Dados Gerais
    [Tags]    Criar
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E clico em Incluir Processo

    E seleciono a modalidade para Concorrência Eletrônica
    E Seleciono o Critério de Concorrência Eletrônica
    E insiro as datas para agendamento
    E insiro a Comissão e Salvo
    E Seleciono o Modo de Disputa Fechado-Aberto
    Então preencho a Aba de Dados Gerais
    E mostro a auditoria


Cenário 02 - Incluir SC ao Pregão
    [Tags]    incluir_SC
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso a tela com filtro todas as Licitações
    E clico na licitação da lista
    Então incluo a SC Por Lote ao Pregão
    E mostro a auditoria


Cenário 03 - Incluir Documento - Edital
    [Tags]    Incluir_doc
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso a tela com filtro todas as Licitações
    E clico na licitação da lista
    E incluo um documento do tipo Edital
    E mostro a auditoria


Cenário 04 - Assinar Documento
    [Tags]    assinar_doc
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso a tela com filtro todas as Licitações
    E clico na licitação da lista
    E seleciono assino o documento do tipo Edital
    E mostro a auditoria


Cenário 05 - Solicitar Parecer para Ordenador
    [Tags]    Solicitar_parecer
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso a tela com filtro todas as Licitações
    E clico na licitação da lista
    E solicito o parecer para o Ordenador
    Então encaminho o Parecer para o ordenador


Cenário 06 - Aprovar parecer Ordenador
    [Tags]    Aprovar_parecer
    Dado que acesso o sistema
    E faço login com usuário "ordenador.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso a tela com filtro todas as Licitações
    E clico na licitação da lista
    E Clique no botão Parecer
    E seleciono o parecer
    Então finalizo o parecer


Cenário 07 - Solicitar Autorização
    [Tags]    Solicitar_autorizacao
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso a tela com filtro todas as Licitações
    E clico na licitação da lista
    E clico no botão solicitar autorização
    Então solicito autorização central


Cenário 08 - Aprovar autorização
    [Tags]    Aprovar_autorizacao
    Dado que acesso o sistema
    E faço login com usuário "autoridadecentral"
    E acesso a tela de Licitações Eletrônicas
    E acesso a tela com filtro todas as Licitações
    E clico na licitação da lista
    E clico em Deliberar
    Então aprovo a autorização
    E mostro a auditoria


Cenário 09 - Agendar Concorrência eletrônico
    [Tags]    Agendar
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E seleciono a licitação para agendamento
    Então faço o reagendamento
    # E clico na licitação da lista
    # E mostro a auditoria


Cenário 10 - Envio de propostas Fornecedor 01
    [Tags]    Enviar_proposta01
    Dado que acesso o sistema
    E faço login com usuário "29219904403.256"
    E acesso a tela de Licitações Eletrônicas
    E seleciono todos os pregões
    E seleciono a SC Em propotas da lista
    E seleciono não para lei 123 e confirmo
    E preencho os dados do lance por Lote
    Então envio a proposta
    # E vejo a Auditoria
    

Cenário 11 - Envio de propostas Fornecedor 02
    [Tags]    Enviar_proposta02
    Dado que acesso o sistema
    E faço login com usuário "02355633000148"
    E acesso a tela de Licitações Eletrônicas
    E seleciono todos os pregões
    E seleciono a licitação da lista
    E seleciono não para lei 123 e confirmo
    E preencho os dados do lance por Lote
    Então envio a proposta
    # E vejo a Auditoria


Cenário 12 - Prorrogar Concorrência
    [Tags]    Prorrogar
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    E clico em prorrogar pregão
    E insiro as novas datas
    Então faço o prorrogamento
    # E Acesso a Auditoria


Cenário 13 - Abertura das propostas
    [Tags]    Abrir_proposta
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação em abertura de proposta da lista
    Então abro as proposta


Cenário 14 - Iniciar disputa
    [Tags]    Iniciar_disputa
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então inicio a disputa

Cenário 15 - Abrir Itens/Lotes para disputa
    [Tags]    Abrir_item
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então abros os Lotes


Cenário 16 - Enviar disputa Fornecedor 01
    [Tags]    Enviar_disputa01
    Dado que acesso o sistema
    E faço login com usuário "29219904403.256"
    E acesso a tela de Licitações Eletrônicas
    E seleciono todos os pregões
    E seleciono a licitação da lista
    Então envio o lance


Cenário 17 - Enviar disputa Fornecedor 02
    [Tags]    Enviar_disputa02
    Dado que acesso o sistema
    E faço login com usuário "02355633000148"
    E acesso a tela de Licitações Eletrônicas
    E seleciono todos os pregões
    E seleciono a licitação da lista
    Então envio o segundo lances


   



    
    
    



    





