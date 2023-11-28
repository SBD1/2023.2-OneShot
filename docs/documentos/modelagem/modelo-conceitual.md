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

<details>
<summary><strong>Entidades e Atributos</strong></summary>
<a><strong>Personagem</strong></a>
    <li>id</li>
    <li>Nome</li>
    <li>Tipo</li>
<a><strong>Personagem NPC</strong></a>
    <li>Descrição</li>
    <li>IsWorldMachine</li>
<a><strong>Personagem PC</strong></a>
    <li>Objetivo</li>
    <li>ConhceceDeus</li>
<a><strong>Deus</strong></a>
    <li>id Deus</li>
    <li>Nome</li>
<a><strong>Comandos</strong></a>
    <li>id função    </li>
    <li>função</li>
    <li>mensagem de erro</li>
<a><strong>Inventario</strong></a>
    <li>N max de item</li>
    <li>nome do item</li>
<a><strong>Itens</strong></a>
    <li>id Item</li>
    <li>Nome</li>
    <li>Descrição</li>
    <li>Tipo</li>
<a><strong>Itens Equipamento</strong></a>
    <li>Função</li>
    <li>usado em craft</li>
<a><strong>Itens Item</strong></a>
    <li>Combina com</li>
    <li>Gera</li>
<a><strong>Dialogo</strong></a>
    <li>Id Dialogo</li>
    <li>Texto</li>
    <li>Alternativas</li>
    <li>Nome dos participantes</li>
<a><strong>Objeto</strong></a>
    <li>Id Objeto</li>
    <li>Nome</li>
    <li>Descrição</li>
    <li>Tipo</li>
<a><strong>Objeto Interativo</strong></a>
    <li>Item requisito</li>
    <li>Tranca</li>
<a><strong>Evento</strong></a>
    <li>id evento</li>
    <li>já disparado</li>
    <li>Descrição</li>
    <li>Resultado</li>
    <li>Tipo Gatilho</li>
<a><strong>Evento Conversar</strong></a>
    <li>Participantes</li>
    <li>Local</li>
    <li>unica</li>
<a><strong>Evento Entrar Sala</strong></a>
    <li>localização</li>
    <li>Pre requisito</li>
<a><strong>Evento Interagir</strong></a>
    <li>precisa de item</li>
    <li>Consome item</li>
<a><strong>Localização</strong></a>
    <li>id localização</li>
<a><strong>Fase</strong></a>
    <li>id Fase</li>
    <li>Descrição</li>
<a><strong>Região</strong></a>
    <li>id Região</li>
    <li>descrição</li>
    <li>nome</li>
<a><strong>Estrutura</strong></a>
    <li>id estrutura</li>
    <li>nome</li>
    <li>sala inicial</li>
<a><strong>Sala</strong></a>
    <li>id sala</li>
    <li>descrição</li>
    <li>is visited</li>
<a><strong>Regiões Visitadas</strong></a>
    <li>nome das regiões</li> 
</details>

### <a>Relacionamentos</a>

<details>
<summary><strong>Relacionamentos</strong></summary>
<a><strong>Personagem está em localização</strong></a>
    <li>Todo Personagem está em uma localização (1,1)</li>
    <li>Toda Localização pode possuir um ou mais Personagems (O,N)</li>
<a><strong>Deus Controla Personagem PC com Comando</strong></a>
    <li>Deus Controla um Personagem PC com um Comando (1,1)</li>
    <li>O Personagem PC é controlado por um comando de Deus (1,1)</li>
    <li>Comando feito por Deus Controla Personagem PC (0,1)</li>
<a><strong>Regiões visitadas são geradas quando o Personagem PC visita outra região</strong></a>
    <li>Um Personagem PC ao visitar uma regão adiciona a mesma na lista de Regiões visitadas (1,1)</li>
    <li>Uma Região visitada por um Personagem PC entra para lista de Regiões visitadas (1,1)</li>
<a><strong>Personagem PC viaja rapidamente para Localização de regiões ja visitadas</strong></a>
    <li>Um Personagem PC pode viajar rapidamente para uma localização que aponta para uma Região visitada (1,1)</li>
    <li>Um localização pode ser alvo da viagem rapida do Personagem PC se a mesma apontar para uma Região visitada  (0,1)</li>
    <li>Uma região visitada pode ser o destino da viagem rapida que altera a localização do Personagem PC (0,1)</li>
<a><strong>Personagem PC Tem Inventario</a></strong>
<li>Um Personagem PC Possui um Inventario (1,1)</li>
<li>um Invetario é possuido por um Personagem PC (1,1)</li>
<a><strong>Personagem Pc conversa com Personagem NPC e gera Evento Conversar</strong></a>
    <li>Um Personagem PC conversa com um personagem NPC e gera um Evento Conversar (1,1)</li>
    <li>Um Personagem NPC conversa com um personagem PC e gera um Evento Conversar (1,1)</li>
    <li>Um Evento Conversar é gerado sempre que um Personagem PC conversa com um Personagem NPC (1,1)</li>
<a><strong>Personagem PC Interage com Objeto Interativo usando ou não Item Material e pode gerar um Evento Interagir</a></strong>
<li>Um Personagem PC Interagem com um objeto usando ou não um Item Material e pode gerar um Evento Interagir (1,1)</li>
<li>Um Objeto Interativo pode ser interagido por um Personagem PC utilizando ou não um Item Material e pode gerar um Evento Interagir (0,1)</li>
<li>Um Item Material Pode ser utilizado na interação entre um Objeto Interativo e um Objeto Interativo e pode gerar um Evento Interagir (0,1)</li>
<li>Um Evento Interagir é gerado sempre que um Personagem Pc Interage com um Objeto Interativo usando ou não um Item Material (1,1)</li>
</details>







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