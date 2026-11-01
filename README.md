# transaction-monitoring
API dedicada à segurança da informação e conformidade cadastral, projetada para simular o monitoramento e a detecção de transações ou acessos suspeitos.

## **REQUISITOS FUNCIONAIS**

**RF001:** Receber os dados da transação: CPF e valor monetário.

**RF002:** Identificar o IP e registrar o timestamp UTC no exato momento da requisição.

**RF003:**  Identificar a geolocalização (Cidade/Estado/UF/País) com base no IP extraído.

**RF004:** Verificar a transação atual com a última transação aprovada no CPF.

**RF005:** Calcular a viabilidade física de deslocamento entre as duas localidades no intervalo de tempo decorrido.
 
**RF006:** Verificar o valor da transação atual com o histórico de gastos do cliente.

**RF007:** Aprovar se todos os critérios forem atendidos ou bloquear/suspender se houver qualquer suspeita de fraude.

**RN008:** Gravar no banco de dados os dados completos da operação (CPF, valor, IP, cidade, data/hora, status final e motivo). 


## **REGRAS DE NEGÓCIO**

**RN001:** O sistema deve validar os CPFs matematicamente, calcular dígitos verificadores e higienizados, CPFs não válidos devem retornar “400 Bad Request”.

**RN002:** O sistema deve considerar fraude se a distância atual e a cidade da última transação for maior que 30 km e o intervalo de tempo for inferior à 20 min.

**RN003:** O sistema deve verificar se o cliente possui histórico, caso não possua, o valor permitido para primeira transação é de R$ 1.000,00. Acima disso rejeitar como suspeita.

**RN004:** O sistema deve verificar se a transação atual excede 2 vezes a média das transações anteriores do mesmo CPF. 


## **REQUISITOS NÃO FUNCIONAIS**

**RNF001:** O sistema será acessado por um navegador Web.

**RNF002:** O sistema será desenvolvido em Python.

**RNF003:** O sistema armazenará seus dados em um banco de dados PostgreMySQL.

**RNF004:** O sistema será hospedado no GitHub.


## **FLUXOGRAMA**

<img width="3378" height="1836" alt="FLUXOGRAMA - Monitoramento" src="https://github.com/user-attachments/assets/4fa663dd-b638-4761-a7e2-a15de00fd68d" />

## **Modelagem do Banco de Dados**

Modelagem relacional desenvolvida para armazenar dados de usuários e registrar o histórico de transações processadas pelo sistema antifraude.

<img width="643" height="408" alt="image" src="https://github.com/user-attachments/assets/6af522d1-bb54-4218-a47a-3905a2effc95" />
