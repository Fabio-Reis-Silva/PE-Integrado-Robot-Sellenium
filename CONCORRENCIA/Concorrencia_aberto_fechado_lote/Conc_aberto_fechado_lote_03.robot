*** Settings ***
Documentation    Fluxo feliz - Cadastro de Pregão Eletronico
Library          SeleniumLibrary
Library          Browser
Library          DateTime
Library          OperatingSystem
Resource        ../../Resources/Resource_login.robot
Resource        ../../Resources/Resource_cadastro_pregao.robot

*** Test Cases ***

# Estes cenários só podem ser rodados após 10min
Cenário 26 - Não acatar intenção de recursos
    Configurar Variáveis de Pregão

    [Tags]    nao_acatar_recurso
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então não acato a intenção de recurso


Cenário 27 - Reajustar preço dos Lotes
    Configurar Variáveis de Pregão

    [Tags]    Reajuste_Lote
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então gravo o valor do lote


Cenário 27 - Adjudicar Pregão
    Configurar Variáveis de Pregão

    [Tags]    adjudicar_pregao
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então adjudico o pregão eletrônico

Cenário 28 - Homologar Pregão
    Configurar Variáveis de Pregão
    
    [Tags]    homologar_pregao
    Dado que acesso o sistema
    E faço login com usuário "autoridade.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então homologo o pregão