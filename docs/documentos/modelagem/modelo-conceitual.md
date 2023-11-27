<center>

# <a>Modelo Conceitual</a>
</center>

## <a>Introdução</a>
O modelo conceitual é uma representação abstrata dos objetos e suas relações em um domínio de negócios. Ele é composto por entidades, atributos e relacionamentos. 

As entidades representam objetos no domínio de negócios, como clientes, produtos, pedidos, etc. Os atributos são as características que descrevem as entidades. Os relacionamentos representam as associações entre as entidades.

## <a>Descrição Conceitual</a>
A descrição conceitual é uma etapa importante da modelagem de dados que envolve a análise dos elementos e fenômenos relevantes de uma realidade observada ou imaginada e a posterior formação de um modelo abstrato do corpo de conhecimento adquirido. 

O modelo conceitual concentra-se no mais alto nível de abstração e não leva em conta o banco de dados em si, mas a forma como as estruturas serão criadas para armazenar os dados.

### <a>Entidades e Atributos</a>
- <a>**Personagem**</a>
    - id
    - Nome
    - Tipo
- <a>**Personagem NPC**</a>
    - Descrição
    - IsWorldMachine
- <a>**Personagem PC**</a>
    - Objetivo
    - ConhceceDeus
- <a>**Deus**</a>
    - id Deus
    - Nome
- <a>**Comandos**</a>
    - id função    
    - função
    - mensagem de erro
- <a>**Inventario**</a>
    - N max de item
    - nome do item
- <a>**Itens**</a>
    - id Item
    - Nome
    - Descrição
    - Tipo
- <a>**Itens Equipamento**</a>
    - Função
    - usado em craft
- <a>**Itens Item**</a>
    - Combina com
    - Gera
- <a>**Dialogo**</a>
    - Id Dialogo
    - Texto
    - Alternativas
    - Nome dos participantes
- <a>**Objeto**</a>
    - Id Objeto
    - Nome
    - Descrição
    - Tipo
- <a>**Objeto Interativo**</a>
    - Item requisito
    - Tranca
- <a>**Evento**</a>
    - id evento
    - já disparado
    - Descrição
    - Resultado
    - Tipo Gatilho
- <a>**Evento Conversar**</a>
    - Participantes
    - Local
    - unica
- <a>**Evento Entrar Sala**</a>
    - localização
    - Pre requisito
- <a>**Evento Interagir**</a>
    - precisa de item
    - Consome item
- <a>**Localização**</a>
    - id localização
- <a>**Fase**</a>
    - id Fase
    - Descrição
- <a>**Região**</a>
    - id Região
    - descrição
    - nome
- <a>**Estrutura**</a>
    - id estrutura
    - nome
    - sala inicial
- <a>**Sala**</a>
    - id sala
    - descrição
    - is visited
- <a>**Regiões Visitadas**</a>
    - nome das regiões

### <a>Relacionamentos</a>
- Relacionamento entre Entidade 1 e Entidade 2


## <a>Modelo Entidade Relacionamento</a>
O modelo Entidade-Relacionamento (ER) é um modelo conceitual utilizado na Engenharia de Software para descrever objetos envolvidos no domínio de um sistema de bancos de dados a ser construído, incluindo seus atributos e relacionamentos. 


### <a>Diagrama Entidade Relacionamento</a>
O diagrama Entidade-Relacionamento (ER) é uma representação gráfica do modelo ER. Ele é composto por entidades, relacionamentos e atributos. As entidades são representadas por retângulos, os atributos são representados por como linhas do retangulo e os relacionamentos são representados por losangos.Na figura a seguir está representado o diagrama do projeto

<br>

<center>

![Diagrama Entidade Relacionamento](../../images/modelagem/DER-1.0.png)
**Figura 1** : Diagrama Entidade Relacionamento
</center>

<br>

Clique [aqui](../../images/modelagem/DER-1.0.png) para ver a imagem em tela cheia.<br>
Ou clique [aqui](../../arquivos/DER-1.0.drawio) para baixar o arquivo do draw.io.

## <a>Histórico de Versão</a>
|   Data   | Versão |      Descrição       |                   Autor                    |
| :------: | :----: | :------------------: | :----------------------------------------: |
| 25/11/23 |  1.0   | Criação do documento | [João Lucas](https://github.com/HacKairos) |

## <a>Bilbiografia</a>
    AVI SILBERSCHATZ, HENRY F. KORTH, S. SUDARSHAN. Database System Concepts. [s.l: s.n.].
    CHEN, Peter. Entity-relationship modeling. 1st ed. New York: ACM Press, 1976. 176 p.