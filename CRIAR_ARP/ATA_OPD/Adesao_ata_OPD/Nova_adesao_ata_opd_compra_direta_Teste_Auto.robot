*** Settings ***
Documentation    Fluxo de Adesão ATA GOV OPD - Fluxo feliz

Library          SeleniumLibrary
Resource       ../../../Resources/Resource_login.robot
Resource        ../../../Resources/Resource_ARP.robot


*** Test Cases ***

CT01 - Solicitar Adesão de Ata de Compra Direta
 
    Dado que acesso o sistema
    E faço login com usuário "solicitante.110402"
    E acesso a lista de Atas de Registro de preços
    E clico na Ata Externa da Lista
    E solicito Consumo/Adesão
    E seleciono o grupo de compras - TJ
    Então confirmo a solicitação de Consumo/Adesão
    # E vejo a Auditoria da ARP


CT02 - Selecionar itens para Adesão

    Dado que acesso o sistema
    E faço login com usuário "solicitante.110402"
    E acesso a lista de todas as solicitações de Adesão
    E clico no Consumo/Adesão da lista
    E seleciono itens da ARP para Adesão
    E vejo a Auditoria da ARP


CT03 - Alterar valor de referência dos itens
   
    Dado que acesso o sistema
    E faço login com usuário "solicitante.110402"
    E acesso a lista de todas as solicitações de Adesão
    E clico no Consumo/Adesão da lista
    Então altero o valor de referência dos itens
    E vejo a Auditoria da ARP


CT04 - Incluir e assinar documentos
    
    Dado que acesso o sistema
    E faço login com usuário "solicitante.110402"
    E acesso a lista de todas as solicitações de Adesão
    E clico no Consumo/Adesão da lista
    Então incluo e Assino os Documentos na Adesão
    E vejo a Auditoria da ARP


 CT05 - Encaminhar Adesao
    
    Dado que acesso o sistema
    E faço login com usuário "solicitante.110402"
    E acesso a lista de todas as solicitações de Adesão
    E clico no Consumo/Adesão da lista
    Então encaminho a Solicitação de Adesão
    E vejo a Auditoria da ARP


CT06 - Concluir análise com Gestor de Ata
    
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de todas as solicitações de Adesão
    E clico no Consumo/Adesão da lista
    Então concluo a análise da Ata Externa


CT07 - Deliberar e Assianr Documento com Gestor de Ata
    
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de todas as solicitações de Adesão
    E clico no Consumo/Adesão da lista
    Então Delibero a Adesão e Assino o Documento
    E vejo a Auditoria da ARP


CT08 - Deliberar com Autoridade Competente
   
    Dado que acesso o sistema
    E faço login com usuário "autoridade.110402"
    E acesso a lista de todas as solicitações de Adesão
    E clico no Consumo/Adesão da lista
    Então Delibero a Adesão e Assino o Documento
    E vejo a Auditoria da ARP


CT09 - Deliberar com Orçamento
    
    Dado que acesso o sistema
    E faço login com usuário "orcamento.110402"
    E acesso a lista de todas as solicitações de Adesão
    E clico no Consumo/Adesão da lista
    Então Delibero a Solicitação de Adesão
    E vejo a Auditoria da ARP
    

CT10 - Deliberar com Ordenador
    
    Dado que acesso o sistema
    E faço login com usuário "ordenador.110402"
    E acesso a lista de todas as solicitações de Adesão
    E clico no Consumo/Adesão da lista
    Então Delibero a Solicitação de Adesão
    E vejo a Auditoria da ARP