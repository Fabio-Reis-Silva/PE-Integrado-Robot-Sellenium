
*** Settings ***
Documentation    Ações e Elementos do Módulo de Pregão e Concorrencia Eletrônica
Library          SeleniumLibrary
Library          Browser
Library          DateTime
Library          OperatingSystem
Resource         ../Resources/Variaveis.robot
   
*** Variables ***

${TITULO_PARECER}    Título do Parecer

${DROPDOWN_TPO_PARECER}    //span[contains(@aria-owns,'nCdTipoParecerMap_listbox')]
${CAMPO_SELECAO_MARCA}    //span[contains(@aria-owns,'dtgPesquisaItens_ctl01_ddlMarca_listbox')]
${CAMPO_SELECAO_MARCA_LOTE}    //span[contains(@aria-owns,'dtgPesquisaAgrupada_ctl01_dtgPesquisaAgrupadaItens_ctl01_ddlMarca_listbox')]
${CAMPO_TIPO_PARECER}    //span[contains(@aria-owns,'nCdTipoParecerMap_listbox')]
${JURIDICO}    //span[contains(@aria-owns,'nCdTipoParecerMap_listbox')]//*[@value="2"]
${ITEM_LIST}       //ul[@id='dtgPesquisaItens_ctl01_ddlMarca_listbox']
${ITEM_LIST_LOTE}    //ul[@id='dtgPesquisaAgrupada_ctl01_dtgPesquisaAgrupadaItens_ctl01_ddlMarca_listbox']
${ITEM_TEXT}      12V 3AH
${ITEM_TEXT_CATETER}   NÃO SE APLICA
${ITEM}        ${ITEM_LIST}//li[text()="12V 3AH"]
${LOTE_CATETER}    ${ITEM_LIST_LOTE}//li[text()="NÃO SE APLICA"]
${ITEM_CATETER}    ${ITEM_LIST}//li[text()="NÃO SE APLICA"]
${ITEM_LOTE}    ${ITEM_LIST_LOTE}//li[text()="12V 3AH"]
${CAMPO_DT_INICIAL_PROP}       //input[contains(@name,'tDtInicialProposta')]
${CAMPO_DT_FINAL_PROP}        id=_cP_PREGAO_x_tDtFinalProposta
${CAMPO_DT_INCIAL_DISPUTA}     //input[contains(@name,'tDtInicialDisputa')]
${FRAME_NEGOCIACAO}    //frame[@name='frmNegociacao']
${FRAME_MAIN}=    //frame[@name='main']
${FRAME_FRM_CONTEUDO}    //iframe[contains(@name,'frmConteudo')]
${FRAME_PARECER}    //iframe[@id="frameParecer"]
${FRAME_DETALHE_PREGAO}    //frame[@name='frmDetalhePregao']
${BTN_SALVAR}     css=#btnSalvarParecer
${TEXTAREA_NAME}    sDsParecer
${XPATH}    //textarea[contains(@name,'sDsParecer')]
${SELECT_XPATH}    //select[@id='nCdTipoParecerMap']
${URL}    https://www.homologpeintegrado.pe.gov.br/default.aspx
${BTN_LUPA_COMISSAO}    (//img[contains(@id,'img')])[2]
${UTILIZA_VERBA_FEDERAL_VALUE_NAO}    //table[2]/tbody[1]/tr[16]/td[2]/span[1]/input[2]
${MENU_NEGOCIACAO}    xpath=//div[@unselectable='on'][contains(.,'Negociação')]  
${SOLICITACAO_COMPRA}    //td[@class='label'][contains(.,'Solicitação de compra')]
${COTACAO}    //td[@class='label'][contains(.,'Cotação')]
${COMPRA_DIRETA}    //td[@class='label'][contains(.,'Compra direta')]
${LICITACAO}    //td[@class='label'][contains(.,'Licitação')]
&{LISTA_SOLICTACAO_COMPRA}    //td[@class='label'][contains(.,'Lista de solicitações de compra')]
&{LISTA_COTACAO}    //a[@title='Cota&#231;&#245;es'][contains(.,'Lista de cotações')]
&{NOVA_LICITACAO}    //td[@class='label'][contains(.,'Nova licitação eletrönica')]
${LICITACOES_ELERONICAS}    //td[@class='label'][contains(.,'Licitações eletrônicas')]
${CAMPO_OBJETO}    //input[contains(@name,'_cP_PREGAO_x_sDsObjeto')]
${MODALIDADE}    //td[@id= "td_cP_PREGAO_x_nCdModalidade"]
${CRITERIO}    //td[@id= "td_cP_PREGAO_x_nCdCriterio"]
${CODICAO_PAGAMENTO}    //td[@id= "td_cP_PREGAO_x_nCdCondicaoPagamento"]
${PRAZO_ENTREGA}    //td[@id= "td_cP_PREGAO_x_nCdPrazoEntrega"]
${MODO_DISPUTA}    //td[@id="td_cP_PREGAO_x_nIdTipoDisputa"]
${CAMPO_EXIBIR_INCLUIR_ITEM_SC}    //select[contains(@name,'ctl00$ddlVisoes')]
${MODAL_PREGAO}    //li[contains(.,'Pregão Eletrônico')]
${MODAL_CONCORRENCIA}    //li[contains(.,'Concorrência Eletrônica')]
${CRIT_PREGAO_LEI_14_133}    //li[contains(.,'LICITAÇÃO NA MODALIDADE PREGÃO ELETRÔNICO - LEI FEDERAL 14.133/21 - DECRETO 54.142/22')]
${CRIT_CONCORRENCIA_LEI_14_133_21}    //li[contains(.,'LICITAÇÃO NA MODALIDADE CONCORRÊNCIA ELETRÔNICA - LEI FEDERAL 14.133/21 - DECRETO 54.142/22')]
${COD_PAGAMENTO_AVISTA}    //li[@tabindex='-1'][contains(.,'Á vista')]
${PRAZO_ENTRG_10_DIAS}    //li[@tabindex='-1'][contains(.,'10 DIAS')]
${MODO_DISPUTA_ABERTO}    (//li[@tabindex='-1'][contains(.,'Aberto')])[1]
${MODO_DISPUTA_ABERTO_FECHADO}    //li[@tabindex='-1'][contains(.,'Aberto-fechado')]
${MODO_DISPUTA_FECHADO_ABERTO}    //li[@tabindex='-1'][contains(.,'Fechado-aberto')]
${EXIBIR_INCLUIR_ITEM_SC_POR_ITEM}    //option[contains(@value,'7053')]
${EXIBIR_INCLUIR_ITEM_SC_POR_LOTE}    //option[contains(@value,'7054')]
${EXIBIR_INCLUIR_ITEM_SC_POR_LOTE_OPD}    //option[contains(@value,'7051')]

${SELECAO_MENU_NEGOCIACAO}    LICITACAO=//td[@class='label'][contains(.,'Licitação')]

${INPUT_NUM_PROC_PREGAO}    //td[contains(@id,'td_cP_PREGAO_x_sNrProcessoDisplay')]

${timeout}=        370   
${interval}=       5     
${start_time}=    Get Time    epoch



*** Keywords ***
E acesso a tela de Licitações Eletrônicas

    Select Frame    ${FRAME_MAIN}
    Wait Until Element Is Visible    ${MENU_NEGOCIACAO}    timeout=30s
    Click Element    ${MENU_NEGOCIACAO}

    # mouse over em Licitações
    ${elemento}    Get WebElement    
    ...    ${LICITACAO}
    Mouse Over    ${elemento}

    # Clique em Licitações eletronicas
    Wait Until Element Is Visible    ${LICITACOES_ELERONICAS}    timeout=30s
    Sleep    1
    Click Element    ${LICITACOES_ELERONICAS}
    Sleep    5
    Capture Page Screenshot


E clico em Incluir Processo
    Select Frame    //iframe[contains(@name,'frmConteudo')]
    Wait Until Element Is Visible    //a[contains(.,'Incluir processo')]    timeout=30s
    Click Element    //a[contains(.,'Incluir processo')]
    Switch Window    NEW
    Maximize Browser Window
    Sleep    1
    Capture Page Screenshot

Então preencho a Aba de Dados Gerais - Não ARP

    # Seleção para registro de preço 'Não'
    Wait Until Element Is Visible    //input[@id= "_cP_PREGAO_x_nCdPregaoTipo_1"]
    Click Element    //input[@id= "_cP_PREGAO_x_nCdPregaoTipo_1"]

    # Seleção do campo 'Confição de pagamento'
    Click Element    ${CODICAO_PAGAMENTO}
    Wait Until Element Is Visible    ${COD_PAGAMENTO_AVISTA}    timeout=30s
    Capture Page Screenshot
    Click Element    ${COD_PAGAMENTO_AVISTA}

    # Seleção do campo 'Prazo de entrega'
    Click Element    ${PRAZO_ENTREGA}
    Wait Until Element Is Visible    ${PRAZO_ENTRG_10_DIAS}    timeout=30s
    Capture Page Screenshot
    Click Element    ${PRAZO_ENTRG_10_DIAS}

    Sleep    2
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)

    Wait Until Element Is Visible    ${UTILIZA_VERBA_FEDERAL_VALUE_NAO}    timeout=30s
    Click Element    ${UTILIZA_VERBA_FEDERAL_VALUE_NAO}
    Capture Page Screenshot

    Wait Until Element Is Visible    ${CAMPO_OBJETO}    timeout=30s
    Input Text    ${CAMPO_OBJETO}    ${OBJETO_PREGAO}
    Capture Page Screenshot

    ${all_windows}=    Get Window Handles
    ${second_window}=    Set Variable    ${all_windows}[1]
    Switch Window    ${second_window}

    # Clique no botão 'Salvar'
    Wait Until Element Is Visible    //input[@name='btnSalvar']
    Click Element    //input[@name='btnSalvar']
    Sleep    2
    Handle Alert    ACCEPT
    Sleep    2


Então preencho a Aba de Dados Gerais - Contrato

    # Seleção para registro de preço 'SIM'
    Wait Until Element Is Visible    //input[@id= "_cP_PREGAO_x_nCdPregaoTipo_0"]
    Click Element    //input[@id= "_cP_PREGAO_x_nCdPregaoTipo_0"]

    # Seleção do campo 'Confição de pagamento'
    Click Element    ${CODICAO_PAGAMENTO}
    Wait Until Element Is Visible    ${COD_PAGAMENTO_AVISTA}    30
    Capture Page Screenshot
    Click Element    ${COD_PAGAMENTO_AVISTA}

    # Seleção do campo 'Prazo de entrega'
    Click Element    ${PRAZO_ENTREGA}
    Wait Until Element Is Visible    ${PRAZO_ENTRG_10_DIAS}    30
    Capture Page Screenshot
    Click Element    ${PRAZO_ENTRG_10_DIAS}

    # Origem Licitação
    Wait Until Element Is Visible    //input[contains(@id,'_cP_PREGAO_x_nCdOrigemLicitacao_0')]    15
    Click Element    //input[contains(@id,'_cP_PREGAO_x_nCdOrigemLicitacao_0')]

    Sleep    2
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)

    Wait Until Element Is Visible    ${UTILIZA_VERBA_FEDERAL_VALUE_NAO}    30
    Click Element    ${UTILIZA_VERBA_FEDERAL_VALUE_NAO}
    Capture Page Screenshot

    Wait Until Element Is Visible    ${CAMPO_OBJETO}    30
    Input Text    ${CAMPO_OBJETO}    ${OBJETO_PREGAO}
    Capture Page Screenshot

    ${all_windows}=    Get Window Handles
    ${second_window}=    Set Variable    ${all_windows}[1]
    Switch Window    ${second_window}

    # Clique no botão 'Salvar'
    Wait Until Element Is Visible    //input[@name='btnSalvar']
    Click Element    //input[@name='btnSalvar']
    Sleep    2
    Handle Alert    ACCEPT
    Sleep    2
    Handle Alert    ACCEPT
    Sleep    4

    ${all_windows}=    Get Window Handles
    ${second_window}=    Set Variable    ${all_windows}[1]
    Switch Window    ${second_window}

    # Capturar o valor do campo depois que ele for preenchido
    Wait Until Element Is Visible    ${INPUT_NUM_PROC_PREGAO}    30
    Sleep    1
    ${NUM_PREGAO_CONTRATO}    SeleniumLibrary.Get Text    ${INPUT_NUM_PROC_PREGAO}

    # Salvar o valor em um arquivo de texto
    Create File    ${EXECDIR}/test/processos/Num_pregao_contrato.txt    ${NUM_PREGAO_CONTRATO}
    Sleep    2

    SeleniumLibrary.Close Browser



Então preencho a Aba de Dados Gerais

    # Seleção para registro de preço 'SIM'
    Wait Until Element Is Visible    //input[@id= "_cP_PREGAO_x_nCdPregaoTipo_0"]
    Click Element    //input[@id= "_cP_PREGAO_x_nCdPregaoTipo_0"]

    # Seleção do campo 'Confição de pagamento'
    Click Element    ${CODICAO_PAGAMENTO}
    Wait Until Element Is Visible    ${COD_PAGAMENTO_AVISTA}    30
    Capture Page Screenshot
    Click Element    ${COD_PAGAMENTO_AVISTA}

    # Seleção do campo 'Prazo de entrega'
    Click Element    ${PRAZO_ENTREGA}
    Wait Until Element Is Visible    ${PRAZO_ENTRG_10_DIAS}    30
    Capture Page Screenshot
    Click Element    ${PRAZO_ENTRG_10_DIAS}

    # Origem Licitação
    Wait Until Element Is Visible    //input[contains(@id,'_cP_PREGAO_x_nCdOrigemLicitacao_0')]    15
    Click Element    //input[contains(@id,'_cP_PREGAO_x_nCdOrigemLicitacao_0')]

    Sleep    2
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)

    Wait Until Element Is Visible    ${UTILIZA_VERBA_FEDERAL_VALUE_NAO}    30
    Click Element    ${UTILIZA_VERBA_FEDERAL_VALUE_NAO}
    Capture Page Screenshot

    Wait Until Element Is Visible    ${CAMPO_OBJETO}    30
    Input Text    ${CAMPO_OBJETO}    ${OBJETO_PREGAO}
    Capture Page Screenshot

    ${all_windows}=    Get Window Handles
    ${second_window}=    Set Variable    ${all_windows}[1]
    Switch Window    ${second_window}

    # Clique no botão 'Salvar'
    Wait Until Element Is Visible    //input[@name='btnSalvar']
    Click Element    //input[@name='btnSalvar']
    Sleep    2
    Handle Alert    ACCEPT
    Sleep    2
    Handle Alert    ACCEPT
    Sleep    2
    SeleniumLibrary.Close Browser

E mostro a auditoria
 
    ${all_windows}=    Get Window Handles
    ${second_window}=    Set Variable    ${all_windows}[1]
    Switch Window    ${second_window}

    Wait Until Element Is Visible    //a[contains(.,'Auditoria')]    30
    Click Element    //a[contains(.,'Auditoria')]
    Capture Page Screenshot
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Capture Page Screenshot
    SeleniumLibrary.Close Browser

E vejo a Auditoria

    ${all_windows}=    Get Window Handles
    ${window}=    Set Variable    ${all_windows}[0]
    
    
    Wait Until Element Is Visible    //a[contains(.,'Voltar à pesquisa')]    30
    Click Element    //a[contains(.,'Voltar à pesquisa')]
    Sleep    3

    Switch Window    ${window}
    Select Frame    //frame[@name='main']
    Sleep    3
    

    Wait Until Element Is Visible    //td[@id="ctl00_pesquisaDataGrid_dtgPesquisa_gridTd"]//tr[td[4][contains(text(), '${OBJETO_PREGAO}')]]//td[9]//img[@id="imgAuditoria"]    30
    Click Element    //td[@id="ctl00_pesquisaDataGrid_dtgPesquisa_gridTd"]//tr[td[4][contains(text(), '${OBJETO_PREGAO}')]]//td[9]//img[@id="imgAuditoria"]
    Capture Page Screenshot
    SeleniumLibrary.Close Browser


E seleciono a modalidade para Pregão Eletrônico

    Wait Until Element Is Visible    ${MODALIDADE}    30
    Click Element    ${MODALIDADE}
    Wait Until Element Is Visible    ${MODAL_PREGAO}    30
    Capture Page Screenshot
    Click Element    ${MODAL_PREGAO}

E seleciono a modalidade para Concorrência Eletrônica

    #Seleção do campo 'Modalidade'
    Wait Until Element Is Visible    ${MODALIDADE}    30
    Click Element    ${MODALIDADE}
    Wait Until Element Is Visible    ${MODAL_PREGAO}    30
    Capture Page Screenshot
    Click Element    ${MODAL_CONCORRENCIA}



E Seleciono o Critério de Pregão Eletrônico

    # Seleção do campo 'Critério'
    Wait Until Element Is Visible    ${CRITERIO}    30
    Click Element    ${CRITERIO}
    Sleep    1
    Click Element    ${CRIT_PREGAO_LEI_14_133}


E Seleciono o Critério de Concorrência Eletrônica

    # Seleção do campo 'Critério'
    Wait Until Element Is Visible    ${CRITERIO}    30
    Click Element    ${CRITERIO}
    Wait Until Element Is Visible    ${CRIT_CONCORRENCIA_LEI_14_133_21}    30
    Sleep    2
    Click Element    ${CRIT_CONCORRENCIA_LEI_14_133_21}
    Capture Page Screenshot


E seleciono o modo de Disputa Aberto

    ${all_windows}=    Get Window Handles
    ${second_window}=    Set Variable    ${all_windows}[1]
    Switch Window    ${second_window}

    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)

    Wait Until Element Is Visible    ${MODO_DISPUTA}    30
    Click Element    ${MODO_DISPUTA}
    Capture Page Screenshot
    Click Element    ${MODO_DISPUTA_ABERTO}

    # Input do campo Prazo de habilitação
    Wait Until Element Is Visible    //input[contains(@class,'k-formatted-value k-input')]    30
    Input Text    //input[contains(@class,'k-formatted-value k-input')]    3
    Capture Page Screenshot


E Seleciono o Modo de Disputa Aberto-Fechado

    ${all_windows}=    Get Window Handles
    ${second_window}=    Set Variable    ${all_windows}[1]
    Switch Window    ${second_window}

    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)

    Wait Until Element Is Visible    ${MODO_DISPUTA}    30
    Click Element    ${MODO_DISPUTA}
    Capture Page Screenshot
    Click Element    ${MODO_DISPUTA_ABERTO_FECHADO}

    # Input do campo Prazo de habilitação
    Wait Until Element Is Visible    //input[contains(@class,'k-formatted-value k-input')]    30
    Input Text    //input[contains(@class,'k-formatted-value k-input')]    3
    Capture Page Screenshot


E Seleciono o Modo de Disputa Fechado-Aberto

    ${all_windows}=    Get Window Handles
    ${second_window}=    Set Variable    ${all_windows}[1]
    Switch Window    ${second_window}

    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)

    Wait Until Element Is Visible    ${MODO_DISPUTA}    30
    Click Element    ${MODO_DISPUTA}
    Sleep    1
    Click Element    ${MODO_DISPUTA_FECHADO_ABERTO}

    # Input do campo Prazo de habilitação
    Wait Until Element Is Visible    //input[contains(@class,'k-formatted-value k-input')]    30
    Input Text    //input[contains(@class,'k-formatted-value k-input')]    3
    Capture Page Screenshot


E insiro as datas para agendamento

    # Data e hora de inicio das propostas
    Execute JavaScript    window.scrollTo(0, 0)

   ${hora_atual+10min}=    Evaluate    (datetime.datetime.now() + datetime.timedelta(minutes=10)).strftime('%d-%m-%Y %H:%M:%S')    datetime
    Log    ${hora_atual+10min}

    # Data e hora do fim das proposta
    ${hora_atual+20min}=    Evaluate    (datetime.datetime.now() + datetime.timedelta(minutes=20)).strftime('%d-%m-%Y %H:%M:%S')    datetime
    Log    ${hora_atual+20min}
    
    # Data e hora para inicio das disputas
    ${hora_atual+25min}=    Evaluate    (datetime.datetime.now() + datetime.timedelta(minutes=25)).strftime('%d-%m-%Y %H:%M:%S')    datetime
    Log    ${hora_atual+25min}

    # Data Inicial propostas
    Wait Until Element Is Visible    ${CAMPO_DT_INICIAL_PROP}    30
    Clear Element Text    ${CAMPO_DT_INICIAL_PROP}
    Input Text    ${CAMPO_DT_INICIAL_PROP}    ${hora_atual+10min}

    # Data final proposta
    Sleep    1
    Wait Until Element Is Visible    ${CAMPO_DT_FINAL_PROP}    30
    Clear Element Text    ${CAMPO_DT_FINAL_PROP}
    Input Text    ${CAMPO_DT_FINAL_PROP}    ${hora_atual+20min}
    Clear Element Text    ${CAMPO_DT_FINAL_PROP}
    Input Text    ${CAMPO_DT_FINAL_PROP}    ${hora_atual+20min}

    # Data Inicio disputa
    Sleep    1
    Wait Until Element Is Visible    ${CAMPO_DT_INCIAL_DISPUTA}    30
    Clear Element Text    ${CAMPO_DT_INCIAL_DISPUTA}
    Input Text    ${CAMPO_DT_INCIAL_DISPUTA}    ${hora_atual+25min}
    Capture Page Screenshot

E insiro a comissão - TJ

    Wait Until Element Is Visible    ${BTN_LUPA_COMISSAO}    30
    Click Element    ${BTN_LUPA_COMISSAO}


    # Busca pela comissão no campo 'Descrição'
    Switch Window    new

    Sleep    1
    Wait Until Element Is Visible    //input[@field='normal'][contains(@id,'sDsProduto')]    30
    Input Text    //input[@field='normal'][contains(@id,'sDsProduto')]
    ...    COMISSÃO PERMANENTE DE LICITAÇÃO

    # Clique no botão pesquisar
    Click Element    //input[contains(@value,'Pesquisar')]

    # Clique para selecionar a comissão
    Wait Until Element Is Visible    //input[contains(@value,'348')]    30
    Sleep    1
    Click Element    //input[contains(@value,'348')]
    Capture Page Screenshot


    # clique do botão 'Confirma' da tela de inserir comissão
    Click Element    //input[contains(@value,'Confirmar')]



E insiro a Comissão e Salvo

    Wait Until Element Is Visible    ${BTN_LUPA_COMISSAO}    30
    Click Element    ${BTN_LUPA_COMISSAO}


    # Busca pela comissão no campo 'Descrição'
    Switch Window    new

    Sleep    1
    Wait Until Element Is Visible    //input[@field='normal'][contains(@id,'sDsProduto')]    30
    Input Text    //input[@field='normal'][contains(@id,'sDsProduto')]
    ...    teste comissão permanente matheus

    # Clique no botão pesquisar
    Click Element    //input[contains(@value,'Pesquisar')]

    # Clique para selecionar a comissão
    Wait Until Element Is Visible    //input[contains(@value,'353')]    30
    Sleep    1
    Click Element    //input[contains(@value,'353')]
    Capture Page Screenshot

    # clique do botão 'Confirma' da tela de inserir comissão
    Click Element    //input[contains(@value,'Confirmar')]


Então incluo a SC Por Item ao Pregão

    Wait Until Element Is Visible    ${CAMPO_EXIBIR_INCLUIR_ITEM_SC}    30
    Sleep    1
    Click Element    ${CAMPO_EXIBIR_INCLUIR_ITEM_SC}
    Sleep    2
    Capture Page Screenshot

    # Clique no campo exibir
    Wait Until Element Is Visible    ${EXIBIR_INCLUIR_ITEM_SC_POR_ITEM}    30
    Click Element    ${EXIBIR_INCLUIR_ITEM_SC_POR_ITEM}
    Sleep    2

    # Selecionar a SC para Incluir
    ${start_time}    Get Time    epoch
    
    FOR    ${i}    IN RANGE    ${timeout}
        ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${resumo_sc}']]//td[5]//input
        Run Keyword If    ${element_found}    Click Element    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${resumo_sc}']]//td[5]//input
        Run Keyword If    ${element_found}    Exit For Loop
        
        Execute JavaScript    window.location.reload()
        Sleep    ${interval} sec

        ${current_time}=    Get Time    epoch
        ${elapsed_time}=    Evaluate    ${current_time} - ${start_time}
        Run Keyword If    ${elapsed_time} > ${timeout}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    END
    Run Keyword If    not ${element_found}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    Capture Page Screenshot

    # Clique no botão de Incluir SC
    Click Element    //a[contains(.,'Incluir')]
    Sleep    2
    SeleniumLibrary.Close Browser


Então incluo a SC Por Lote ao Pregão - OPD

    Switch Window    NEW
    # Clique na aba 'Itens'
    Wait Until Element Is Visible    //a[contains(.,'Itens')]    30
    Click Element    //a[contains(.,'Itens')]


    # Clique na aba Itens
    Wait Until Element Is Visible     //a[contains(.,'Incluir')]    30
    Click Element    //a[contains(.,'Incluir')]
    Sleep    2

    # Cliue no botão Incluir itens da Solicitacçao
    Wait Until Element Is Visible    //a[contains(.,'Incluir item(ns) da solicitação')]    30
    Click Element    //a[contains(.,'Incluir item(ns) da solicitação')]

    Switch Window    NEW

    Wait Until Element Is Visible    ${CAMPO_EXIBIR_INCLUIR_ITEM_SC}    30
    Click Element    ${CAMPO_EXIBIR_INCLUIR_ITEM_SC}
    Capture Page Screenshot
    Sleep    2

    # Clique no campo exibir
    Wait Until Element Is Visible    ${EXIBIR_INCLUIR_ITEM_SC_POR_LOTE_OPD}    30
    Sleep    2
    Click Element    ${EXIBIR_INCLUIR_ITEM_SC_POR_LOTE_OPD}


    # Selecionar a SC para Incluir
    ${start_time}    Get Time    epoch
    FOR    ${i}    IN RANGE    ${timeout}
        ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${resumo_sc}']]//td[9]//input
        Run Keyword If    ${element_found}    Click Element    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${resumo_sc}']]//td[5]//input
        Run Keyword If    ${element_found}    Exit For Loop
        
        Execute JavaScript    window.location.reload()
        Sleep    ${interval} sec

        ${current_time}=    Get Time    epoch
        ${elapsed_time}=    Evaluate    ${current_time} - ${start_time}
        Run Keyword If    ${elapsed_time} > ${timeout}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    END
    Run Keyword If    not ${element_found}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    Capture Page Screenshot

    # Clique no botão de Incluir SC
    Click Element    //a[contains(.,'Incluir')]
    Sleep    2


E clico na aba 'Itens'

    Switch Window    NEW
    # Clique na aba 'Itens'
    Wait Until Element Is Visible    //a[contains(.,'Itens')]    30
    Click Element    //a[contains(.,'Itens')]
    Capture Page Screenshot


E acesso a tela de 'Incluir Itens da Solicitação'

    # Clique de incluir na aba Itens
    Wait Until Element Is Visible     //a[contains(.,'Incluir')]    30
    Click Element    //a[contains(.,'Incluir')]
    Sleep    2

    # Cliue no botão Incluir itens da Solicitacçao
    Wait Until Element Is Visible    //a[contains(.,'Incluir item(ns) da solicitação')]    30
    Click Element    //a[contains(.,'Incluir item(ns) da solicitação')]
    Switch Window    NEW
    Sleep    1
    Capture Page Screenshot


Então incluo a SC Por Lote ao Pregão

    Wait Until Element Is Visible    ${CAMPO_EXIBIR_INCLUIR_ITEM_SC}    30
    Sleep    1
    Click Element    ${CAMPO_EXIBIR_INCLUIR_ITEM_SC}
    Capture Page Screenshot
    Sleep    2

    # Clique no campo exibir
    Wait Until Element Is Visible    ${EXIBIR_INCLUIR_ITEM_SC_POR_LOTE}    30
    Click Element    ${EXIBIR_INCLUIR_ITEM_SC_POR_LOTE}


    # Selecionar a SC para Incluir
    ${start_time}    Get Time    epoch 
    FOR    ${i}    IN RANGE    ${timeout}
        ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${RESUMO_SC}']]//td[5]//input
        Run Keyword If    ${element_found}    Click Element    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${RESUMO_SC}']]//td[5]//input
        Run Keyword If    ${element_found}    Exit For Loop
        
        Execute JavaScript    window.location.reload()
        Sleep    ${interval} sec

        ${current_time}=    Get Time    epoch
        ${elapsed_time}=    Evaluate    ${current_time} - ${start_time}
        Run Keyword If    ${elapsed_time} > ${timeout}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    END
    Run Keyword If    not ${element_found}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    Capture Page Screenshot

    # Clique no botão de Incluir SC
    Click Element    //a[contains(.,'Incluir')]
    Sleep    2


E acesso a tela de 'Documentos do Processo'

    Switch Window    NEW
    # Clique na aba documentos
    Wait Until Element Is Visible    //a[contains(.,'Documentos do processo')]    30
    Click Element    //a[contains(.,'Documentos do processo')]
    Sleep    1
    Capture Page Screenshot


Então incluo os Documentos do tipo Edital


    FOR    ${index}    IN RANGE    2
   
        # Clique do botão 'Escolher Arquivo'
        Wait Until Element Is Visible    //input[contains(@type,'file')]    30
        Choose File    css=input[type="file"]    ${EXECDIR}\\test\\Fixtures\\Mod03-Locators.pdf

        # Switch Window
        Sleep    1

        # Clique e escrevo no campo 'Tipo do documento'
        Wait Until Element Is Visible    
        ...    css=input[id="ctl00_conteudoPagina_objListagemDeDocumentos_autoTipoDeDocumento"]    30

        ${tipo_doc} =    Set Variable    Edital - PE
        ${li_doc} =    Set Variable    //li[text()="Edital - PE"]

        # Ajustar os localizadores e o tipo de documento para a segunda execução
        IF    ${index} == 1
            ${tipo_doc} =    Set Variable    Edital
            ${li_doc} =    Set Variable    //li[text()="Edital"]
        END

        Input Text    
        ...    css=input[id="ctl00_conteudoPagina_objListagemDeDocumentos_autoTipoDeDocumento"]
        ...    ${tipo_doc}
        Sleep    2
        Wait Until Element Is Visible    ${li_doc}    30
        Click Element    ${li_doc}

        # Clique no botão 'Anexar' o arquivo
        Capture Page Screenshot
        Click Element    //input[@value='Anexar']
        Handle Alert    ACCEPT
    END
    SeleniumLibrary.Close Browser


    # CÓDIGO PARA INCLUIR 3 DOCUMENTOS
    # FOR    ${index}    IN RANGE    3
   
    #     # Clique do botão 'Escolher Arquivo'
    #     Wait Until Element Is Visible    //input[contains(@type,'file')]    30
    #     Choose File    css=input[type="file"]    ${EXECDIR}\\test\\Fixtures\\Mod03-Locators.pdf

    #     # Switch Window
    #     Sleep    1

    #     # Clique e escrevo no campo 'Tipo do documento'
    #     Wait Until Element Is Visible    
    #     ...    css=input[id="ctl00_conteudoPagina_objListagemDeDocumentos_autoTipoDeDocumento"]    30

    #     ${tipo_doc} =    Set Variable    Edital - PE
    #     ${li_doc} =    Set Variable    //li[text()="Edital - PE"]

    #     # Ajustar os localizadores e o tipo de documento para cada execução
    #     IF    ${index} == 1
    #         ${tipo_doc} =    Set Variable    Edital
    #         ${li_doc} =    Set Variable    //li[text()="Edital"]
    #     ELSE IF    ${index} == 2
    #         ${tipo_doc} =    Set Variable    Mapa
    #         ${li_doc} =    Set Variable    //li[text()=""]
    #     END

    #     Input Text    
    #     ...    css=input[id="ctl00_conteudoPagina_objListagemDeDocumentos_autoTipoDeDocumento"]
    #     ...    ${tipo_doc}
    #     Sleep    2
    #     Wait Until Element Is Visible    ${li_doc}    30
    #     Click Element    ${li_doc}

    #     # Clique no botão 'Anexar' o arquivo
    #     Capture Page Screenshot
    #     Click Element    //input[@value='Anexar']
    #     Handle Alert    ACCEPT
    # END


E seleciono assino o documento do tipo Edital

    FOR    ${index}    IN RANGE    2

        Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)

        # Selecionar o documento do tipo Edital
        ${doc_locator} =    Set Variable    //table[@id="ctl00_conteudoPagina_objListagemDeDocumentos_dtgPesquisaNovo"]//tr[td/a[text()='Edital - PE']]//td[10]//input

        # Ajustar o localizador para a segunda execução
        IF    ${index} == 1
            ${doc_locator} =    Set Variable    //table[@id="ctl00_conteudoPagina_objListagemDeDocumentos_dtgPesquisaNovo"]//tr[td/a[text()='Edital']]//td[10]//input
        END
        Sleep    3
        Wait Until Element Is Visible    ${doc_locator}    30
        Click Element    ${doc_locator}

        # Clicar no botão 'Assinar Documento'
        Wait Until Element Is Visible    xpath=//a[contains(.,'Assinar documento')]    30
        Click Element    xpath=//a[contains(.,'Assinar documento')]

        # Preencher os campos de assinatura
        Sleep    2
        Wait Until Element Is Visible    //span[text()="Assinatura Eletrônica"]    30

        Wait Until Element Is Visible    css=input[id="ctl00_ContentPrincipal_tbxCargo"]    30
        Input Text    css=input[id="ctl00_ContentPrincipal_tbxCargo"]    Teste

        Wait Until Element Is Visible    css=input[id="tbxSenhaAcesso"]    30
        Input Text    css=input[id="tbxSenhaAcesso"]    PE@123456

        # Clicar no botão 'Assinar'
        Capture Page Screenshot
        Click Element    xpath=//a[text()='Assinar']
        Sleep    7
    END
    SeleniumLibrary.Close Browser


E solicito o parecer para o Ordenador -OPD
    
    Wait Until Element Is Visible    //li[contains(@onclick,'OpenWindowUsuarioLookup()')]    30
    Click Element    //li[contains(@onclick,'OpenWindowUsuarioLookup()')]
    
    Sleep    2
    Wait Until Element Is Visible    //input[@id='tbxPesquisar']    30
    Input Text    //input[@id='tbxPesquisar']    Ordenador
    Sleep    1

    Click Element    //span[contains(@onclick,'Pesquisar();')]

    Wait Until Element Is Visible    //td[contains(.,'Ordenador da UG 070001 (TRIBUNAL DE JUSTIÇA)')]    30
    Click Element    //td[contains(.,'Ordenador da UG 070001 (TRIBUNAL DE JUSTIÇA)')]
    Sleep    1
    
    Wait Until Element Is Visible    //button[@type='button'][contains(.,'OK')]    30
    Click Element    //button[@type='button'][contains(.,'OK')]

    # # Clique na seleção tipo do Parecer
    Wait Until Element Is Visible  ${DROPDOWN_TPO_PARECER}    30
    Click Element  ${DROPDOWN_TPO_PARECER}


    # Implementar aqui o tipo do paracer para Jurídico

    Sleep    10


    Wait Until Element Is Visible    //input[@name='sDsTitulo']    30
    Input Text    //input[@name='sDsTitulo']    ${TITULO_PARECER}

    Wait Until Element Is Visible    ${XPATH}    30
    Input Text    ${XPATH}    Descrição parecer

    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Sleep    2

    Capture Page Screenshot
    Wait Until Element Is Visible    ${BTN_SALVAR}    30
    Sleep    2
    Click Element    ${BTN_SALVAR}
    Capture Page Screenshot


E acesso a tela de Solicitar Parecer

    Switch Window    NEW
    # Clique no botão 'Parecer'
    Wait Until Element Is Visible    //input[contains(@name,'btnParecer')]    30
    Click Element    //input[contains(@name,'btnParecer')]

    ${all_windows}=    Get Window Handles
    ${janela_atual}=    Set Variable    ${all_windows}[0]
    Switch Window    ${janela_atual}

    Sleep    5
    Select Frame    ${FRAME_MAIN}
    Select Frame    ${FRAME_FRM_CONTEUDO}
    Select Frame    ${FRAME_PARECER}
    Capture Page Screenshot


E solicito o parecer para o Ordenador

    Sleep    2
    Wait Until Element Is Visible    //li[contains(@onclick,'OpenWindowUsuarioLookup()')]    30
    Click Element    //li[contains(@onclick,'OpenWindowUsuarioLookup()')]
    
    Sleep    2
    Wait Until Element Is Visible    //input[@id='tbxPesquisar']    30
    Input Text    //input[@id='tbxPesquisar']    Ordenador
    Sleep    2

    Click Element    //span[contains(@onclick,'Pesquisar();')]
    Sleep    2

    Wait Until Element Is Visible    //td[contains(.,'Ordenador da UG 120101 (SECRETARIA DE ADMINISTRAÇÃO)')]    30
    Click Element    //td[contains(.,'Ordenador da UG 120101 (SECRETARIA DE ADMINISTRAÇÃO)')]
    Sleep    2
    
    Wait Until Element Is Visible    //button[@type='button'][contains(.,'OK')]    30
    Click Element    //button[@type='button'][contains(.,'OK')]

    #Clique na seleção tipo do Parecer
    Log    Executando clique no dropdown
    Wait Until Element Is Visible  ${DROPDOWN_TPO_PARECER}    30
    Click Element  ${DROPDOWN_TPO_PARECER}

    ${ELEMENTOS}    Get WebElements    //ul[@id='nCdTipoParecerMap_listbox']
    ${ITEM_LIST_PARECER}    Set Variable    ${ELEMENTOS}[1]

    ${elementos}    Get WebElements    //li[@tabindex='-1'][contains(.,'Jurídico')]
    ${ITEM_PARECER}    Set Variable    ${elementos}[1]

    Sleep    1
    Wait Until Element Is Visible    ${ITEM_PARECER}    30
    Capture Page Screenshot

    Sleep    2
    Click Element    ${ITEM_PARECER}
    Sleep    1

    Wait Until Element Is Visible    //input[@name='sDsTitulo']    30
    Input Text    //input[@name='sDsTitulo']    ${TITULO_PARECER}

    Wait Until Element Is Visible    ${XPATH}    30
    Input Text    ${XPATH}    Descrição parecer


    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Sleep    2

    Capture Page Screenshot
    Wait Until Element Is Visible    ${BTN_SALVAR}    30
    Sleep    2
    Click Element    ${BTN_SALVAR}
    Capture Page Screenshot


Então encaminho o Parecer para o ordenador
    Wait Until Element Is Visible    //span[@name='btnEncaminharParecer']    30
    Click Element    //span[@name='btnEncaminharParecer']


    Wait Until Element Is Visible    //button[contains(.,'Sim')]    30
    Click Element    //button[contains(.,'Sim')]
    Sleep    1
    Capture Page Screenshot
    SeleniumLibrary.Close Browser


E acesso a tela com filtro todas as Licitações
    Select Frame    ${FRAME_FRM_CONTEUDO}

    # Clicar no campo Exibir
   Wait Until Element Is Visible    xpath=//select[@id= "ctl00_ddlVisoes"]    30
   Click Element    xpath=//select[@id= "ctl00_ddlVisoes"]

   # Clicar na seleção 'Tdas as Lictações'
   Click Element    xpath=//select[@id= "ctl00_ddlVisoes"]//*[@value='18000']

   # Clique no botão Pesquisar
   Wait Until Element Is Visible    xpath=//input[@value= "Pesquisar"]    30
   Click Element    xpath=//input[@value= "Pesquisar"]
   Sleep    2
   Capture Page Screenshot


E clico na licitação Aguardando autorização da Lista

    ${start_time}    Get Time    epoch 
    FOR    ${i}    IN RANGE    ${timeout}
        ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    //td[@id="ctl00_pesquisaDataGrid_dtgPesquisa_gridTd"]//tr[td[4][contains(text(), '${OBJETO_PREGAO}')]]//td[8]//img[contains(@title,'Aguardando autorização')]
        Run Keyword If    ${element_found}    Click Element    //td[@id="ctl00_pesquisaDataGrid_dtgPesquisa_gridTd"]//tr[td[4][contains(text(), '${OBJETO_PREGAO}')]]//td[2]
        Run Keyword If    ${element_found}    Exit For Loop
        
        Execute JavaScript    window.location.reload()
        Sleep    ${interval} sec

        ${current_time}=    Get Time    epoch
        ${elapsed_time}=    Evaluate    ${current_time} - ${start_time}
        Run Keyword If    ${elapsed_time} > ${timeout}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    END
    Run Keyword If    not ${element_found}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    Capture Page Screenshot


E clico na licitação da lista

    # Clique na SC selecionada
    Wait Until Element Is Visible    //td[@id="ctl00_pesquisaDataGrid_dtgPesquisa_gridTd"]//tr[td[4][contains(text(), '${OBJETO_PREGAO}')]]//td[2]    timeout=30s
    Sleep    1
    Click Element    //td[@id="ctl00_pesquisaDataGrid_dtgPesquisa_gridTd"]//tr[td[4][contains(text(), '${OBJETO_PREGAO}')]]//td[2]
    Sleep    4

E Clique no botão Parecer

    ${all_windows}=    Get Window Handles
    ${segunda_janela}=    Set Variable    ${all_windows}[1]
    Switch Window    ${segunda_janela}
    

    Wait Until Element Is Visible    //input[contains(@name,'btnParecer')]    30
    Click Element    //input[contains(@name,'btnParecer')]
    Sleep    2
    
    ${all_windows}=    Get Window Handles
    ${janela_atual}=    Set Variable    ${all_windows}[0]
    Switch Window    ${janela_atual}

    Sleep    2
    Select Frame    ${FRAME_MAIN}
    Select Frame    ${FRAME_FRM_CONTEUDO}
    Select Frame    ${FRAME_PARECER}

E seleciono o parecer

    ${all_windows}=    Get Window Handles

    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)

    Wait Until Element Is Visible    //fieldset[2]//div[2]//div[2]//table//tr[td[2][contains(text(), '${TITULO_PARECER}')]]//td[1]//a[@class="wi-clickable"]    timeout=30s
    Capture Page Screenshot

    # garantir que o elemento esteja visível na janela de visualização do navegador.
    Scroll Element Into View  xpath=//fieldset[2]//div[2]//div[2]//table//tr[td[2][contains(text(), 'Título do Parecer')]]//td[1]//a[@class="wi-clickable"]

    # Clique no parecer selecionado
    Click Element    //fieldset[2]//div[2]//div[2]//table//tr[td[2][contains(text(), '${TITULO_PARECER}')]]//td[1]//a[@class="wi-clickable"]
    Sleep    4

    Capture Page Screenshot


Então finalizo o parecer

    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Wait Until Element Is Visible    //textarea[@name='sDsResposta']    30
    Input Text    //textarea[@name='sDsResposta']    Finalizar parecer
    Capture Page Screenshot

    Wait Until Element Is Visible    //fieldset[2]/div[3]/div[1]/button[1]    30
    Scroll Element Into View    //fieldset[2]/div[3]/div[1]/button[1]
    Click Element    //fieldset[2]/div[3]/div[1]/button[1]
    Capture Page Screenshot


    # clique do botão Finalizar aprecer
    Wait Until Element Is Visible    //button[@type='button'][contains(.,'Finalizar parecer')]    30
    Click Element    //button[@type='button'][contains(.,'Finalizar parecer')]

    
    Wait Until Element Is Visible    //textarea[contains(@name,'sDsJustificativa')]    30
    Input Text    //textarea[contains(@name,'sDsJustificativa')]    justificativa
    Capture Page Screenshot

    Wait Until Element Is Visible    //button[@type='button'][contains(.,'Sim')]    30
    Click Element    //button[@type='button'][contains(.,'Sim')]
    Sleep    1
    Capture Page Screenshot
    SeleniumLibrary.Close Browser


E clico no botão solicitar autorização
    ${all_windows}=    Get Window Handles
    ${segunda_janela}=    Set Variable    ${all_windows}[1]
    Switch Window    ${segunda_janela}
    

    Wait Until Element Is Visible    //input[@name='btnSolicitarAutorizacao']    30
    Capture Page Screenshot
    Click Element    //input[@name='btnSolicitarAutorizacao']
    Sleep    2

Então solicito autorização central
    Wait Until Element Is Visible    //a[contains(.,'Sim')]    30
    Capture Page Screenshot

    Click Element    //a[contains(.,'Sim')]
    Sleep    6
    Handle Alert    ACCEPT

E acesso a tela de Deliberar Autorização

    ${all_windows}=    Get Window Handles
    ${segunda_janela}=    Set Variable    ${all_windows}[1]
    Switch Window    ${segunda_janela}
    
    # Clique no botão deliberar
    Wait Until Element Is Visible    //input[@name='btnDeliberar']    30
    Click Element    //input[@name='btnDeliberar']
    Sleep    2
    Capture Page Screenshot


Então aprovo a autorização

    # Clique no botão radio autorizar
    Wait Until Element Is Visible    //form[1]/div[4]/div[4]/table[1]/tbody[1]/tr[2]/td[2]/span[1]/input[1]    timeout=30s
    Click Element    //form[1]/div[4]/div[4]/table[1]/tbody[1]/tr[2]/td[2]/span[1]/input[1]
    Capture Page Screenshot

    # escrever no campo justificativa
    Wait Until Element Is Visible    //textarea[contains(@name,'txtJustificativa')]    30
    Input Text    //textarea[contains(@name,'txtJustificativa')]    Ok
    Capture Page Screenshot

    # Clique do botao confirmar
    Wait Until Element Is Visible    //a[contains(@onclick,'Confirmar();')]    30
    Capture Page Screenshot
    Click Element    //a[contains(@onclick,'Confirmar();')]
    Sleep    4
    Handle Alert    ACCEPT


E seleciono a licitação para agendamento
    Select Frame    ${FRAME_FRM_CONTEUDO}

    # Clicar no campo Exibir
   Wait Until Element Is Visible    xpath=//select[@id= "ctl00_ddlVisoes"]    30
   Click Element    xpath=//select[@id= "ctl00_ddlVisoes"]

   # Clicar na seleção 'Tdas as Lictações'
   Click Element    xpath=//select[@id= "ctl00_ddlVisoes"]//*[@value='18000']

   # Clique no botão Pesquisar
   Wait Until Element Is Visible    xpath=//input[@value= "Pesquisar"]    30
   Click Element    xpath=//input[@value= "Pesquisar"]
   Capture Page Screenshot


    # Clique na SC selecionada
    Wait Until Element Is Visible    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td[contains(text(), '${OBJETO_PREGAO}')]]//td[10]//input    30
    Click Element    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td[contains(text(), '${OBJETO_PREGAO}')]]//td[10]//input
    Sleep    4

Então faço o agendamento do pregão

    # Clique no botão agendar
    Wait Until Element Is Visible    //a[contains(.,'Agendar')]    30
    Click Element    //a[contains(.,'Agendar')]
    Sleep    1
    Switch Window    NEW
    # Clique no botão SIM
    Click Element    //input[contains(@value,'Sim')]
    Sleep    3


E acesso a tela do agendamento

    # Clique no botão agendar
    Wait Until Element Is Visible    //a[contains(.,'Agendar')]    30
    Click Element    //a[contains(.,'Agendar')]
    Sleep    1
    Capture Page Screenshot

    # Clique para marcar para reagendar
    Switch Window    NEW
    Wait Until Element Is Visible    //input[contains(@name,'ckbAgendar')]    30
    Click Element    //input[contains(@name,'ckbAgendar')]

    # Clique no botão SIM
    Click Element    //input[contains(@value,'Sim')]
    Sleep    1

    ${all_windows}=    Get Window Handles
    ${janela}=    Set Variable    ${all_windows}[1]
    Switch Window    ${janela}
    Capture Page Screenshot

Então faço o reagendamento

    ${hora_atual+6min}=    Evaluate    (datetime.datetime.now() + datetime.timedelta(minutes=6)).strftime('%d-%m-%Y %H:%M:%S')    datetime
    Log    ${hora_atual+6min}

    ${hora_atual+300min}=    Evaluate    (datetime.datetime.now() + datetime.timedelta(minutes=300)).strftime('%d-%m-%Y %H:%M:%S')    datetime
    Log    ${hora_atual+300min}

    ${hora_atual+301min}=    Evaluate    (datetime.datetime.now() + datetime.timedelta(minutes=301)).strftime('%d-%m-%Y %H:%M:%S')    datetime
    Log    ${hora_atual+301min}


    # # Clique para marcar para reagendar
    # Switch Window    NEW
    # Wait Until Element Is Visible    //input[contains(@name,'ckbAgendar')]    timeout=30s
    # Click Element    //input[contains(@name,'ckbAgendar')]

    # # Clique no botão SIM
    # Click Element    //input[contains(@value,'Sim')]

    # ${all_windows}=    Get Window Handles
    # ${janela}=    Set Variable    ${all_windows}[1]
    # Switch Window    ${janela}

    # Data inicial de propostas
    Wait Until Element Is Visible    //input[contains(@name,'tbxDataInicialProposta')]    30
    Clear Element Text    //input[contains(@name,'tbxDataInicialProposta')]
    Input Text    //input[contains(@name,'tbxDataInicialProposta')]    ${hora_atual+6min}

    # Data Fianl de propostas
    Wait Until Element Is Visible    //input[contains(@name,'tbxDataEncerramento')]    30
    Clear Element Text    //input[contains(@name,'tbxDataEncerramento')]
    Input Text    //input[contains(@name,'tbxDataEncerramento')]    ${hora_atual+300min}

    # Data inicial para Disputa de lances
    Wait Until Element Is Visible    //input[contains(@name,'tbxDataInicialDisputa')]    30
    Clear Element Text    //input[contains(@name,'tbxDataInicialDisputa')]
    Input Text    //input[contains(@name,'tbxDataInicialDisputa')]    ${hora_atual+301min}
    Capture Page Screenshot

    # Clique do botão Agendar
    Wait Until Element Is Visible    //input[contains(@name,'btnAgendar')]    30
    Click Element    //input[contains(@name,'btnAgendar')]
    Sleep    2
    SeleniumLibrary.Close Browser


E seleciono todos os pregões
    Select Frame    ${FRAME_FRM_CONTEUDO}

    # Clicar no campo Exibir
   Wait Until Element Is Visible    xpath=//select[@id= "ctl00_ddlVisoes"]    30
   Click Element    xpath=//select[@id= "ctl00_ddlVisoes"]

   # Clicar na seleção 'Tdas as pregões'
   Click Element    xpath=//select[@id= "ctl00_ddlVisoes"]//*[@value='18039']

   # Clique no botão Pesquisar
   Wait Until Element Is Visible    xpath=//input[@value= "Pesquisar"]    30
   Click Element    xpath=//input[@value= "Pesquisar"]
   Capture Page Screenshot


    # Ocultar Icones de Chat, se existirem
    ${icone_existe}    Run Keyword And Return Status    Wait Until Element Is Visible    xpath=//img[contains(@class,'open-launcher')]    10
    Run Keyword If    ${icone_existe}    Ocultar Icones de Chat

Ocultar Icones de Chat
    Sleep    2
    Wait Until Element Is Visible    //img[contains(@class,'open-launcher')]    15
    Execute Javascript    document.querySelector("img.open-launcher").style.display = 'none';
    Sleep    1
    Wait Until Element Is Visible    //div[@class='tooltip-body'][contains(.,'Olá! Como posso ajudar?')]
    Execute Javascript    document.querySelector("div.tooltip-body").style.display = 'none';
    Execute JavaScript    document.querySelector('.launcher').style.display = 'none';
    Sleep    3
    Capture Page Screenshot

   
E seleciono não para lei 123 e confirmo
    ${all_windows}=    Get Window Handles

    # check box não para lei 123
    Wait Until Element Is Visible    //input[@value='0'][contains(@id,'1')]    30
    Click Element    //input[@value='0'][contains(@id,'1')]

    ${all_windows}=    Get Window Handles

    # clique no botão confirmar
    Wait Until Element Is Visible    //input[contains(@value,'Confirmar')]    30
    Click Element    //input[contains(@value,'Confirmar')]
    ${all_windows}=    Get Window Handles


E preencho os dados do lance por Item
    Sleep    1
    Select Frame    ${FRAME_NEGOCIACAO}

    Log    Executando clique no dropdown
    Wait Until Element Is Visible    ${CAMPO_SELECAO_MARCA}    30
    Click Element    ${CAMPO_SELECAO_MARCA}
    Log    Dropdown expandido, aguardando item

    Log    Aguardando a visibilidade do item na lista
    Wait Until Element Is Visible    ${ITEM_CATETER}    30

    Log    Item visível, clicando no item
    Capture Page Screenshot
    
    Click Element    ${ITEM_CATETER}
    Sleep    2s
    Log    Verificando valor do dropdown
    ${dropdown_value}=    Execute JavaScript    return document.querySelector("span.k-input").innerText
    Log    Valor do dropdown: ${dropdown_value}
    Should Be Equal As Strings    ${dropdown_value}    ${ITEM_TEXT_CATETER} 
    Sleep    1

    # Valor do lance
    Wait Until Element Is Visible    //form[1]/table[1]/tbody[1]/tr[3]/td[1]/table[1]/tbody[1]/tr[2]/td[2]/div[1]/span[3]/span[1]/input[1]    30
    Input Text    //form[1]/table[1]/tbody[1]/tr[3]/td[1]/table[1]/tbody[1]/tr[2]/td[2]/div[1]/span[3]/span[1]/input[1]    100
    Capture Page Screenshot


E preencho os dados do lance por Lote
    Select Frame    ${FRAME_NEGOCIACAO}

    Log    Executando clique no dropdown
    Wait Until Element Is Visible    ${CAMPO_SELECAO_MARCA_LOTE}    30
    Click Element    ${CAMPO_SELECAO_MARCA_LOTE}
    Log    Dropdown expandido, aguardando item

    Log    Aguardando a visibilidade do item na lista
    Wait Until Element Is Visible    ${LOTE_CATETER}    30

    Log    Item visível, clicando no item
    Capture Page Screenshot
    
    Click Element    ${LOTE_CATETER}
    Sleep    2s

    # Valor do lance
    Wait Until Element Is Visible    //table[1]/tbody[1]/tr[2]/td[8]/div[1]/span[3]/span[1]/input[1]    timeout=30s
    Input Text    //table[1]/tbody[1]/tr[2]/td[8]/div[1]/span[3]/span[1]/input[1]    100
    Capture Page Screenshot


Então envio a proposta  
    Wait Until Element Is Visible    //a[contains(.,'Enviar proposta(s)')]    30
    Click Element    //a[contains(.,'Enviar proposta(s)')]
    Sleep    3
    Capture Page Screenshot
    Sleep    2
    SeleniumLibrary.Close Browser


E acesso todos as licitações da lista
    Select Frame    ${FRAME_FRM_CONTEUDO}

    # Clicar no campo Exibir
   Wait Until Element Is Visible    xpath=//select[@id= "ctl00_ddlVisoes"]    30
   Click Element    xpath=//select[@id= "ctl00_ddlVisoes"]

   # Clicar na seleção 'Tdas as Lictações'
   Click Element    xpath=//select[@id= "ctl00_ddlVisoes"]//*[@value='18000']

   # Clique no botão Pesquisar
   Wait Until Element Is Visible    xpath=//input[@value= "Pesquisar"]    30
   Click Element    xpath=//input[@value= "Pesquisar"]
   Capture Page Screenshot


E seleciono a SC Em propotas da lista

    ${start_time}    Get Time    epoch 
    FOR    ${i}    IN RANGE    ${timeout}
        ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    //td[@id="ctl00_pesquisaDataGrid_dtgPesquisa_gridTd"]//tr[td[4][contains(text(), '${OBJETO_PREGAO}')]]//td[8]//img[contains(@title,'Em proposta')]
        Run Keyword If    ${element_found}    Click Element    //td[@id="ctl00_pesquisaDataGrid_dtgPesquisa_gridTd"]//tr[td[4][contains(text(), '${OBJETO_PREGAO}')]]//td[2]
        Run Keyword If    ${element_found}    Exit For Loop
        
        Execute JavaScript    window.location.reload()
        Sleep    ${interval} sec

        ${current_time}=    Get Time    epoch
        ${elapsed_time}=    Evaluate    ${current_time} - ${start_time}
        Run Keyword If    ${elapsed_time} > ${timeout}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    END
    Run Keyword If    not ${element_found}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    Capture Page Screenshot


E seleciono a licitação em abertura de proposta da lista

    ${start_time}    Get Time    epoch 
    FOR    ${i}    IN RANGE    ${timeout}
        ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    //td[@id="ctl00_pesquisaDataGrid_dtgPesquisa_gridTd"]//tr[td[4][contains(text(), '${OBJETO_PREGAO}')]]//td[8]//img[contains(@title,'Abertura de propostas')]
        Sleep    90
        Run Keyword If    ${element_found}    Click Element    //td[@id="ctl00_pesquisaDataGrid_dtgPesquisa_gridTd"]//tr[td[4][contains(text(), '${OBJETO_PREGAO}')]]//td[2]
        Run Keyword If    ${element_found}    Exit For Loop
        
        Execute JavaScript    window.location.reload()
        Sleep    ${interval} sec

        ${current_time}=    Get Time    epoch
        ${elapsed_time}=    Evaluate    ${current_time} - ${start_time}
        Run Keyword If    ${elapsed_time} > ${timeout}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    END
    Run Keyword If    not ${element_found}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    Capture Page Screenshot



E seleciono a licitação em ajuste de preços da lista

    ${start_time}    Get Time    epoch 
    FOR    ${i}    IN RANGE    ${timeout}
        ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    //td[@id="ctl00_pesquisaDataGrid_dtgPesquisa_gridTd"]//tr[td[4][contains(text(), '${OBJETO_PREGAO}')]]//td[8]//img[contains(@title,'Ajuste de preços')]
        Run Keyword If    ${element_found}    Click Element    //td[@id="ctl00_pesquisaDataGrid_dtgPesquisa_gridTd"]//tr[td[4][contains(text(), '${OBJETO_PREGAO}')]]//td[2]
        Run Keyword If    ${element_found}    Exit For Loop
        
        Execute JavaScript    window.location.reload()
        Sleep    ${interval} sec

        ${current_time}=    Get Time    epoch
        ${elapsed_time}=    Evaluate    ${current_time} - ${start_time}
        Run Keyword If    ${elapsed_time} > ${timeout}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    END
    Run Keyword If    not ${element_found}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    Capture Page Screenshot



E clico na licitação em Adjudicação da lista

    ${start_time}    Get Time    epoch 
    FOR    ${i}    IN RANGE    ${timeout}
        ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    //td[@id="ctl00_pesquisaDataGrid_dtgPesquisa_gridTd"]//tr[td[4][contains(text(), '${OBJETO_PREGAO}')]]//img[contains(@title,'Em adjudicação')]
        Run Keyword If    ${element_found}    Click Element    //td[@id="ctl00_pesquisaDataGrid_dtgPesquisa_gridTd"]//tr[td[4][contains(text(), '${OBJETO_PREGAO}')]]//td[2]
        Run Keyword If    ${element_found}    Exit For Loop
        
        Execute JavaScript    window.location.reload()
        Sleep    ${interval} sec

        ${current_time}=    Get Time    epoch
        ${elapsed_time}=    Evaluate    ${current_time} - ${start_time}
        Run Keyword If    ${elapsed_time} > ${timeout}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    END
    Run Keyword If    not ${element_found}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.


E seleciono a licitação da lista - Varios Pregão

    ${NUM_PROCESSO}=    Set Variable    ${LISTA_PROCESSOS}[0]  # Sempre pega o primeiro item da lista
    Wait Until Element Is Visible    //td[@id="ctl00_pesquisaDataGrid_dtgPesquisa_gridTd"]//tr[td[4][contains(text(), '${NUM_PROCESSO}')]]//td[2]    20
    Click Element    //td[@id="ctl00_pesquisaDataGrid_dtgPesquisa_gridTd"]//tr[td[4][contains(text(), '${NUM_PROCESSO}')]]//td[2]
    Sleep    4
    Capture Page Screenshot


E seleciono a licitação da lista

    ${all_windows}=    Get Window Handles
    # Clique na SC selecionada
    Wait Until Element Is Visible    //td[@id="ctl00_pesquisaDataGrid_dtgPesquisa_gridTd"]//tr[td[4][contains(text(), '${OBJETO_PREGAO}')]]//td[2]    20
    Click Element    //td[@id="ctl00_pesquisaDataGrid_dtgPesquisa_gridTd"]//tr[td[4][contains(text(), '${OBJETO_PREGAO}')]]//td[2]
    Sleep    4

    
    Run Keyword And Ignore Error    Handle Alert    ACCEPT
    Sleep    2

    # Handle Alert    ACCEPT
    # Sleep    2

Então abro as proposta

    Wait Until Element Is Visible    ${FRAME_NEGOCIACAO}    30
    Select Frame    ${FRAME_NEGOCIACAO}

    ${start_time}    Get Time    epoch 
    FOR    ${i}    IN RANGE    ${timeout}
        ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    //a[contains(.,'Abrir proposta(s)')]
        Run Keyword If    ${element_found}    Click Element    //a[contains(.,'Abrir proposta(s)')]
        Run Keyword If    ${element_found}    Exit For Loop
        
        Execute JavaScript    window.location.reload()
        Sleep    ${interval} sec

        ${current_time}=    Get Time    epoch
        ${elapsed_time}=    Evaluate    ${current_time} - ${start_time}
        Run Keyword If    ${elapsed_time} > ${timeout}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    END
    Run Keyword If    not ${element_found}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    Sleep    2
    Handle Alert    ACCEPT
    Sleep    3
    SeleniumLibrary.Close Browser


Então inicio a disputa
    Wait Until Element Is Visible    ${FRAME_NEGOCIACAO}    30
    Select Frame    ${FRAME_NEGOCIACAO}


    Wait Until Element Is Visible    //a[contains(.,'Iniciar disputa')]    30
    Capture Page Screenshot
    Click Element    //a[contains(.,'Iniciar disputa')]
    Sleep    2
    Handle Alert    ACCEPT
    Sleep    3
    Capture Page Screenshot


Então abros os itens

    Wait Until Element Is Visible    ${FRAME_NEGOCIACAO}    30
    Select Frame    ${FRAME_NEGOCIACAO}
    Capture Page Screenshot


    # Click no chekbox para marca o item
    Wait Until Element Is Visible    //table[1]/tbody[1]/tr[2]/td[12]/input[1]    30
    Click Element    //table[1]/tbody[1]/tr[2]/td[12]/input[1]


    # clique do botão abrir itens
    Wait Until Element Is Visible    //a[contains(.,'Abrir item')]    30
    Click Element    //a[contains(.,'Abrir item')]


    Switch Window    NEW
    Wait Until Element Is Visible    //textarea[contains(@name,'tbxJustificativa')]    30
    Input Text    //textarea[contains(@name,'tbxJustificativa')]    Justificativa
    Capture Page Screenshot

    Click Element    //input[@value='Sim']
    Sleep    2
    SeleniumLibrary.Close Browser
 

Então abros os Lotes

    Wait Until Element Is Visible    ${FRAME_NEGOCIACAO}    30
    Select Frame    ${FRAME_NEGOCIACAO}
    Capture Page Screenshot

    # Click no chekbox para marcar todos os lotes
    Wait Until Element Is Visible    //input[contains(@name,'ckbTodos')]    30
    Click Element    //input[contains(@name,'ckbTodos')]

    # clique do botão abrir lote
    Wait Until Element Is Visible    //a[contains(.,'Abrir lote')]    30
    Click Element    //a[contains(.,'Abrir lote')]

    Switch Window    NEW
    Wait Until Element Is Visible    //textarea[contains(@name,'tbxJustificativa')]    30
    Input Text    //textarea[contains(@name,'tbxJustificativa')]    Justificativa
    Capture Page Screenshot

    Click Element    //input[@value='Sim']
    Sleep    2


Então envio o lance
    Wait Until Element Is Visible    ${FRAME_NEGOCIACAO}    30
    Select Frame    ${FRAME_NEGOCIACAO}
    Capture Page Screenshot

    Wait Until Element Is Visible    //input[@class='k-formatted-value k-input']    30
    Input Text    //input[@class='k-formatted-value k-input']    90


    # Clicque do botão enviar lances
    Wait Until Element Is Visible    //a[contains(.,'Enviar lances')]
    Click Element    //a[contains(.,'Enviar lances')]
    Sleep    2
    Handle Alert    ACCEPT
    Sleep    2
    Capture Page Screenshot

Então envio o lance 01 para disputa Sigilosa
    Wait Until Element Is Visible    ${FRAME_NEGOCIACAO}    30
    Select Frame    ${FRAME_NEGOCIACAO}
    Capture Page Screenshot

    Wait Until Element Is Visible    //input[@class='k-formatted-value k-input']    30
    Input Text    //input[@class='k-formatted-value k-input']    70


    # Clicque do botão enviar lances
    Wait Until Element Is Visible    //a[contains(.,'Enviar lances')]
    Click Element    //a[contains(.,'Enviar lances')]
    Sleep    2
    Handle Alert    ACCEPT
    Sleep    2
    Capture Page Screenshot


Então envio o lance 02 para disputa Sigilosa
    Wait Until Element Is Visible    ${FRAME_NEGOCIACAO}    30
    Select Frame    ${FRAME_NEGOCIACAO}
    Capture Page Screenshot

    Wait Until Element Is Visible    //input[@class='k-formatted-value k-input']    30
    Input Text    //input[@class='k-formatted-value k-input']    60


    # Clicque do botão enviar lances
    Wait Until Element Is Visible    //a[contains(.,'Enviar lances')]
    Click Element    //a[contains(.,'Enviar lances')]
    Sleep    2
    Handle Alert    ACCEPT
    Sleep    2
    Capture Page Screenshot


E clico em prorrogar pregão
    Select Frame    ${FRAME_DETALHE_PREGAO}

    Wait Until Element Is Visible    //a[contains(.,'Prorrogar')]    30
    Click Element    //a[contains(.,'Prorrogar')]
    Capture Page Screenshot


E insiro as novas datas
    ${all_windows}=    Get Window Handles
    ${janela}=    Set Variable    ${all_windows}[1]

    ${hora_atual+3min}=    Evaluate    (datetime.datetime.now() + datetime.timedelta(minutes=3)).strftime('%d-%m-%Y %H:%M:%S')    datetime
    Log    ${hora_atual+3min}

    ${hora_atual+4min}=    Evaluate    (datetime.datetime.now() + datetime.timedelta(minutes=4)).strftime('%d-%m-%Y %H:%M:%S')    datetime
    Log    ${hora_atual+4min}

    Switch Window    ${janela}

    Sleep    2

    # Campo justificativa
    Wait Until Element Is Visible    //textarea[contains(@name,'tbxJustificativa')]    30
    Input Text    //textarea[contains(@name,'tbxJustificativa')]    Justificativa
    Sleep    2

    
    # Data final proposta
    Wait Until Element Is Visible    id=ctl00_conteudoPagina_tbxDataFinalProposta    30
    Input Text    id=ctl00_conteudoPagina_tbxDataFinalProposta    ${hora_atual+3min}
    Sleep    2
    Set Focus To Element    id=ctl00_conteudoPagina_tbxDataFinalProposta
    Execute JavaScript    document.getElementById("ctl00_conteudoPagina_tbxDataFinalProposta").value="${hora_atual+3min}";
    Sleep    2
    Capture Page Screenshot


    # Data Inicial Disputa
    Wait Until Element Is Visible    id=ctl00_conteudoPagina_tbxDataInicioDisputa    30
    Input Text    id=ctl00_conteudoPagina_tbxDataInicioDisputa    ${hora_atual+4min}
    Sleep    2
    Set Focus To Element    id=ctl00_conteudoPagina_tbxDataInicioDisputa
    Execute JavaScript    document.getElementById("ctl00_conteudoPagina_tbxDataInicioDisputa").value="${hora_atual+4min}";
    Sleep    2
    Capture Page Screenshot


Então faço o prorrogamento
    Wait Until Element Is Visible    //input[contains(@value,'Sim')]    30
    Click Element    //input[contains(@value,'Sim')]

    Wait Until Element Is Visible    //a[contains(.,'Sim')]    30
    Click Element    //a[contains(.,'Sim')]
    Sleep    3

    # Handle Alert    action=accept
    # Sleep    2
    
E Acesso a Auditoria
    Select Frame    ${FRAME_DETALHE_PREGAO}

    Wait Until Element Is Visible    //a[contains(.,'Auditoria')]    30
    Capture Page Screenshot
    SeleniumLibrary.Close Browser


Então envio o segundo lances
    Wait Until Element Is Visible    ${FRAME_NEGOCIACAO}    30
    Select Frame    ${FRAME_NEGOCIACAO}
    Capture Page Screenshot

    Wait Until Element Is Visible    //input[@class='k-formatted-value k-input']    30
    Input Text    //input[@class='k-formatted-value k-input']    89

    # ${current_value}=    Get Value    //input[@class='k-formatted-value k-input']
    # ${new_value}=    Evaluate    ${current_value} - 10
    # Input Text    //input[@class='k-formatted-value k-input']    ${new_value}


    # Clicque do botão enviar lances
    Wait Until Element Is Visible    //a[contains(.,'Enviar lances')]
    Click Element    //a[contains(.,'Enviar lances')]
    Sleep    2
    Handle Alert    ACCEPT
    Sleep    2
    Capture Page Screenshot


Então abro os itens após disputa

    Wait Until Element Is Visible    ${FRAME_NEGOCIACAO}    30
    Select Frame    ${FRAME_NEGOCIACAO}
    Capture Page Screenshot


    # Click no chekbox para marca o item
    Wait Until Element Is Visible    //table[1]/tbody[1]/tr[2]/td[12]/input[1]    30
    Click Element    //table[1]/tbody[1]/tr[2]/td[12]/input[1]


    # clique do botão abrir itens
    Wait Until Element Is Visible    //a[contains(.,'Abrir item')]    30
    Click Element    //a[contains(.,'Abrir item')]
    Sleep    2
    Capture Page Screenshot
    Sleep    2


Então ecerro a disputa

    Wait Until Element Is Visible    ${FRAME_NEGOCIACAO}    30
    Select Frame    ${FRAME_NEGOCIACAO}
    Capture Page Screenshot

    ${start_time}    Get Time    epoch 
    FOR    ${i}    IN RANGE    ${timeout}
        ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    //a[contains(.,'Encerrar disputa')]
        Run Keyword If    ${element_found}    Click Element    //table[1]/tbody[1]/tr[2]/td[12]/input[1]
        Run Keyword If    ${element_found}    Exit For Loop
        
        Execute JavaScript    window.location.reload()
        Sleep    ${interval} sec

        ${current_time}=    Get Time    epoch
        ${elapsed_time}=    Evaluate    ${current_time} - ${start_time}
        Run Keyword If    ${elapsed_time} > ${timeout}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    END
    Run Keyword If    not ${element_found}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    Capture Page Screenshot


    # clique do botão abrir itens
    Click Element    //a[contains(.,'Encerrar disputa')]
    Sleep    2
    Capture Page Screenshot
    Sleep    2

    Switch Window    NEW

    # Campo justificativa
    Wait Until Element Is Visible    //textarea[contains(@name,'tbxJustificativa')]   timeout=30s
    Input Text    //textarea[contains(@name,'tbxJustificativa')]    Justificativa


    # Clique do botão sim
    Wait Until Element Is Visible    //input[contains(@name,'btnSim')]    30s
    Capture Page Screenshot
    Click Element    //input[contains(@name,'btnSim')]
    Sleep    2
    
Então ecerro a disputa Por Lote

    Wait Until Element Is Visible    ${FRAME_NEGOCIACAO}    30
    Select Frame    ${FRAME_NEGOCIACAO}
    Capture Page Screenshot

    ${start_time}    Get Time    epoch 
    FOR    ${i}    IN RANGE    ${timeout}
        ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    //a[contains(.,'Encerrar disputa')]
        Run Keyword If    ${element_found}    Click Element    //a[contains(.,'Encerrar disputa')]
        Run Keyword If    ${element_found}    Exit For Loop
        
        Execute JavaScript    window.location.reload()
        Sleep    ${interval} sec

        ${current_time}=    Get Time    epoch
        ${elapsed_time}=    Evaluate    ${current_time} - ${start_time}
        Run Keyword If    ${elapsed_time} > ${timeout}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    END
    Run Keyword If    not ${element_found}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.

    Sleep    2
    Capture Page Screenshot
    Sleep    2

    Switch Window    NEW

    # Campo justificativa
    Wait Until Element Is Visible    //textarea[contains(@name,'tbxJustificativa')]   30
    Input Text    //textarea[contains(@name,'tbxJustificativa')]    Justificativa


    # Clique do botão sim
    Wait Until Element Is Visible    //input[contains(@name,'btnSim')]    30
    Capture Page Screenshot
    Click Element    //input[contains(@name,'btnSim')]
    Sleep    2

Então abro Item para disputa sigilosa
    Wait Until Element Is Visible    ${FRAME_NEGOCIACAO}    30
    Select Frame    ${FRAME_NEGOCIACAO}
    Capture Page Screenshot


    # Click no chekbox para marca o item
    Wait Until Element Is Visible    //table[1]/tbody[1]/tr[2]/td[12]/input[1]    30
    Click Element    //table[1]/tbody[1]/tr[2]/td[12]/input[1]


    # clique do botão abrir itens
    Wait Until Element Is Visible    //a[contains(.,'Abrir item')]   30
    Click Element    //a[contains(.,'Abrir item')]
    Sleep    2
    Capture Page Screenshot
    Sleep    2

    Switch Window    NEW

    # Campo justificativa
    Wait Until Element Is Visible    //textarea[contains(@name,'tbxJustificativa')]   30
    Input Text    //textarea[contains(@name,'tbxJustificativa')]    Justificativa


    # Clique do botão sim
    Wait Until Element Is Visible    //input[contains(@name,'btnSim')]    30s
    Capture Page Screenshot
    Click Element    //input[contains(@name,'btnSim')]
    Sleep    2


Então abro Item para Lei 123
    Wait Until Element Is Visible    ${FRAME_NEGOCIACAO}    30
    Select Frame    ${FRAME_NEGOCIACAO}
    Capture Page Screenshot


    # Click no chekbox para marca o item
    Wait Until Element Is Visible    //table[1]//tbody[1]//tr[2]//td[13]//input[1]
    Click Element    //table[1]//tbody[1]//tr[2]//td[13]//input[1]


    # clique do botão abrir itens
    Sleep    1
    Wait Until Element Is Visible    //a[contains(.,'Abrir item')]   30
    Click Element    //a[contains(.,'Abrir item')]
    Sleep    2
    Capture Page Screenshot
    Sleep    2

    Switch Window    NEW

    # Campo justificativa
    Wait Until Element Is Visible    //textarea[contains(@name,'tbxJustificativa')]   30
    Input Text    //textarea[contains(@name,'tbxJustificativa')]    Justificativa


    # Clique do botão sim
    Wait Until Element Is Visible    //input[contains(@name,'btnSim')]    30s
    Capture Page Screenshot
    Click Element    //input[contains(@name,'btnSim')]
    Sleep    2
    
    
Então encerro Item para Lei 123
    Wait Until Element Is Visible    ${FRAME_NEGOCIACAO}    30
    Select Frame    ${FRAME_NEGOCIACAO}
    Capture Page Screenshot


    # Click no chekbox para marca o item
    Wait Until Element Is Visible    //table[1]//tbody[1]//tr[2]//td[14]//input[1]    30
    Click Element    //table[1]//tbody[1]//tr[2]//td[14]//input[1]


    # clique do botão abrir itens
    Wait Until Element Is Visible    //a[contains(.,'Encerrar item')]   30
    Click Element    //a[contains(.,'Encerrar item')]
    Sleep    2
    Capture Page Screenshot
    Sleep    2

    Switch Window    NEW

    # Campo justificativa
    Wait Until Element Is Visible    //textarea[contains(@name,'tbxJustificativa')]   30
    Input Text    //textarea[contains(@name,'tbxJustificativa')]    Justificativa


    # Clique do botão sim
    Wait Until Element Is Visible    //input[contains(@name,'btnSim')]    30s
    Capture Page Screenshot
    Click Element    //input[contains(@name,'btnSim')]
    Sleep    2

Então encerro Lote para Lei 123
   Wait Until Element Is Visible    ${FRAME_NEGOCIACAO}    30
    Select Frame    ${FRAME_NEGOCIACAO}
    Capture Page Screenshot


    # Click no chekbox para marcar todos os lotes
    Wait Until Element Is Visible    //input[contains(@name,'ckbTodos')]    30
    Click Element    //input[contains(@name,'ckbTodos')]


    # clique do botão Encerrar lote
    Wait Until Element Is Visible    //a[contains(.,'Encerrar lote')]   30
    Click Element    //a[contains(.,'Encerrar lote')]
    Sleep    2
    Capture Page Screenshot
    Sleep    2

    Switch Window    NEW

    # Campo justificativa
    Wait Until Element Is Visible    //textarea[contains(@name,'tbxJustificativa')]   30
    Input Text    //textarea[contains(@name,'tbxJustificativa')]    Justificativa


    # Clique do botão sim
    Wait Until Element Is Visible    //input[contains(@name,'btnSim')]    30s
    Capture Page Screenshot
    Click Element    //input[contains(@name,'btnSim')]
    Sleep    2


Então faço a convocação do vencedor

    Select Frame    ${FRAME_DETALHE_PREGAO}

    Wait Until Element Is Visible    //a[contains(.,'Habilitação e proposta')]    30s
    Click Element    //a[contains(.,'Habilitação e proposta')]
    Capture Page Screenshot
    Sleep    2

    Switch Window    NEW

    Wait Until Element Is Visible    //table[1]/tbody[1]/tr[1]/td[8]/input[1]    30s
    Click Element    //table[1]/tbody[1]/tr[1]/td[8]/input[1]

    Wait Until Element Is Visible    //a[contains(.,'Convocar')]    30s
    Click Element    //a[contains(.,'Convocar')]
    Capture Page Screenshot

    Wait Until Element Is Visible    //a[contains(.,'Enviar')]    30s
    Click Element    //a[contains(.,'Enviar')]
    Sleep    2
    Capture Page Screenshot

    # Clique no botão sim
    Wait Until Element Is Visible    //div[8]//table[1]/tbody[1]/tr[5]/td[1]/a[1]    30s
    Click Element    //div[8]//table[1]/tbody[1]/tr[5]/td[1]/a[1]
    Sleep    2
    Capture Page Screenshot


Então anexo o documento
    Select Frame    ${FRAME_DETALHE_PREGAO}

    Wait Until Element Is Visible    //a[contains(.,'Habilitação e proposta')]    30s
    Click Element    //a[contains(.,'Habilitação e proposta')]
    Capture Page Screenshot
    Sleep    2

    Switch Window    NEW

    Wait Until Element Is Visible    //table[1]/tbody[1]/tr[1]/td[8]/input[1]    30s
    Click Element    //table[1]/tbody[1]/tr[1]/td[8]/input[1]


    Wait Until Element Is Visible    //a[contains(.,'Anexar documentos')]    30s
    Click Element    //a[contains(.,'Anexar documentos')]
    Capture Page Screenshot


    Wait Until Element Is Visible    css=input[type="file"]    30
    Choose File    css=input[type="file"]    ${EXECDIR}\\test\\Fixtures\\Mod03-Locators.pdf

    
    # Clique e escrevo no campo 'Tipo do documento'
    Wait Until Element Is Visible    
    ...    //input[contains(@name,'autoTipoDeDocumento')]    30
    Input Text    
    ...    //input[contains(@name,'autoTipoDeDocumento')]
    ...    Carteira de Identidade
    Sleep    2
    Wait Until Element Is Visible    //li[text()="Carteira de Identidade"]    30
    Click Element    //li[text()="Carteira de Identidade"]
    Sleep    2

    # Clique no botão 'Anexar' o arquivo
    Capture Page Screenshot
    Click Element    //input[@value='Anexar']
    Sleep    2
    Capture Page Screenshot

Então habilito o fonecedor vencedor (Aberto_Fechado_item)
    Select Frame    ${FRAME_DETALHE_PREGAO}

    Wait Until Element Is Visible    //a[contains(.,'Habilitação e proposta')]    30s
    Click Element    //a[contains(.,'Habilitação e proposta')]
    Capture Page Screenshot
    Sleep    2

    Switch Window    NEW

    Wait Until Element Is Visible    //table[1]/tbody[1]/tr[1]/td[8]/input[1]    30s
    Click Element    //table[1]/tbody[1]/tr[1]/td[8]/input[1]

    Wait Until Element Is Visible    //a[contains(.,'Habilitar')]    30s
    Click Element    //a[contains(.,'Habilitar')]
    Capture Page Screenshot

    # ${all_windows}=    Get Window Handles
    # # ${janela}=    Set Variable    ${all_windows}[2]
    # ${janela}=    Set Variable    ${all_windows}[0]

    # Switch Window    ${janela}

    Sleep    2
    Switch Window    NEW
    Wait Until Element Is Visible    //textarea[contains(@name,'tbxJustificativa')]    30s
    Input Text    //textarea[contains(@name,'tbxJustificativa')]    Justificativa
    Capture Page Screenshot

    Wait Until Element Is Visible    //input[@value='Habilitar']    30s
    Click Element    //input[@value='Habilitar']
    Sleep    2
    Handle Alert    ACCEPT
    Sleep    2


Então habilito o fonecedor vencedor (Aberto_item)
    Select Frame    ${FRAME_DETALHE_PREGAO}

    Wait Until Element Is Visible    //a[contains(.,'Habilitação e proposta')]    30s
    Click Element    //a[contains(.,'Habilitação e proposta')]
    Capture Page Screenshot
    Sleep    2

    Switch Window    NEW

    Wait Until Element Is Visible    //table[1]/tbody[1]/tr[1]/td[8]/input[1]    30s
    Click Element    //table[1]/tbody[1]/tr[1]/td[8]/input[1]

    Wait Until Element Is Visible    //a[contains(.,'Habilitar')]    30s
    Click Element    //a[contains(.,'Habilitar')]
    Capture Page Screenshot

    ${all_windows}=    Get Window Handles
    ${janela}=    Set Variable    ${all_windows}[2]
    Switch Window    ${janela}

    Sleep    1
    # Switch Window    NEW
    Wait Until Element Is Visible    //textarea[contains(@name,'tbxJustificativa')]    30s
    Input Text    //textarea[contains(@name,'tbxJustificativa')]    Justificativa
    Capture Page Screenshot

    Wait Until Element Is Visible    //input[@value='Habilitar']    30s
    Click Element    //input[@value='Habilitar']
    Sleep    2
    Handle Alert    ACCEPT
    Sleep    2


Então encerro a etapa de pregão eletrônico
    ${TEXTO_ALERTA}    Set Variable    Confirma encerramento da etapa de negociação?
    
    Wait Until Element Is Visible    ${FRAME_NEGOCIACAO}    30
    Select Frame    ${FRAME_NEGOCIACAO}
    Capture Page Screenshot


    # clique do botão encerrar atapa
    Wait Until Element Is Visible    //a[contains(.,'Encerrar etapa')]   30
    Click Element    //a[contains(.,'Encerrar etapa')]
    Sleep    2
    Handle Alert    ACCEPT
    Sleep    2
    Capture Page Screenshot


Então registro intenção de recurso
    Wait Until Element Is Visible    ${FRAME_NEGOCIACAO}    30
    Select Frame    ${FRAME_NEGOCIACAO}
    Capture Page Screenshot


    # clique do botão encerrar atapa
    Wait Until Element Is Visible    //a[contains(.,'Registrar intenção')]   30
    Click Element    //a[contains(.,'Registrar intenção')]
   
    Switch Window    NEW
    Wait Until Element Is Visible    //textarea[@tb='P_PREGAO_INTENCAO_RECURSO']    30s
    Input Text    //textarea[@tb='P_PREGAO_INTENCAO_RECURSO']    Registro de intenção de recursos

    Wait Until Element Is Visible    //input[@value='Salvar e fechar']    30s
    Click Element    //input[@value='Salvar e fechar']
    Sleep    2
    SeleniumLibrary.Close Browser

  
Então não acato a intenção de recurso
    Wait Until Element Is Visible    ${FRAME_NEGOCIACAO}    30
    Select Frame    ${FRAME_NEGOCIACAO}
    Capture Page Screenshot


    Wait Until Element Is Visible    //a[contains(.,'C. MARTINS COMERCIAL LTDA - ME')]    30s
    Click Element    //a[contains(.,'C. MARTINS COMERCIAL LTDA - ME')]

    Switch Window    NEW

    # Click no rádio 'Não acatado'
    Wait Until Element Is Visible    //input[@tipo='integer'][contains(@id,'1')]    30s
    Click Element    //input[@tipo='integer'][contains(@id,'1')]

    
    Wait Until Element Is Visible    //textarea[contains(@tb,'P_PREGAO_INTENCAO_RECURSO')]    30s
    Input Text    //textarea[contains(@tb,'P_PREGAO_INTENCAO_RECURSO')]    Não acatado
    Capture Page Screenshot
    
    Wait Until Element Is Visible    //input[@value='Salvar e fechar']    30s
    Click Element    //input[@value='Salvar e fechar']
    Sleep    2
    SeleniumLibrary.Close Browser


Então gravo o valor do lote
    Wait Until Element Is Visible    ${FRAME_NEGOCIACAO}    30
    Select Frame    ${FRAME_NEGOCIACAO}
    Capture Page Screenshot

    # clique do botão gravar
    Wait Until Element Is Visible    //a[contains(.,'Gravar')]   60
    Click Element    //a[contains(.,'Gravar')]
    Handle Alert    Accept
    Sleep    3


Então adjudico o pregão eletrônico
    Wait Until Element Is Visible    ${FRAME_NEGOCIACAO}    30
    Select Frame    ${FRAME_NEGOCIACAO}
    Capture Page Screenshot

    ${start_time}    Get Time    epoch 
    FOR    ${i}    IN RANGE    ${timeout}
        ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    //a[contains(.,'Adjudicar')]
        Run Keyword If    ${element_found}    Click Element    //a[contains(.,'Adjudicar')]
        Run Keyword If    ${element_found}    Exit For Loop
        
        Execute JavaScript    window.location.reload()
        Sleep    ${interval} sec

        ${current_time}=    Get Time    epoch
        ${elapsed_time}=    Evaluate    ${current_time} - ${start_time}
        Run Keyword If    ${elapsed_time} > ${timeout}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    END
    Run Keyword If    not ${element_found}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    Capture Page Screenshot

    Capture Page Screenshot

    Switch Window    NEW
    
    Wait Until Element Is Visible    //textarea[contains(@name,'tbxJustificativa')]    30
    Input Text    //textarea[contains(@name,'tbxJustificativa')]    Pregão adjudicado com sucesso
    Capture Page Screenshot

    Wait Until Element Is Visible    //input[contains(@value,'Sim')]    30s
    Click Element    //input[contains(@value,'Sim')]
    Sleep    6


Então homologo o pregão
    Wait Until Element Is Visible    ${FRAME_NEGOCIACAO}    30
    Select Frame    ${FRAME_NEGOCIACAO}
    Capture Page Screenshot


    # clique do botão encerrar atapa
    Wait Until Element Is Visible    //a[contains(.,'Homologar pregão')]   60
    Click Element    //a[contains(.,'Homologar pregão')]
    Capture Page Screenshot

    Switch Window    NEW
    
    Wait Until Element Is Visible    //textarea[contains(@name,'tbxJustificativa')]    30
    Input Text    //textarea[contains(@name,'tbxJustificativa')]    Pregão homologado com sucesso
    Capture Page Screenshot

    Wait Until Element Is Visible    //input[contains(@value,'Sim')]    30s
    Click Element    //input[contains(@value,'Sim')]
    Sleep    6