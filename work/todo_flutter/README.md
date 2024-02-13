# todo_flutter

# DOMAIN
    --DATASOURCE (interface e Implementação)--
Composto por uma classe "abstrata", que, assim como no princípio *OCP*, permite a implementação dessa mesma classe em outro lugar, podendo assim, caso necessário, aplicá-la em outro contexto, desde que não viole o princípio *SRP*.    

### IMPLEMENTAÇÂO
    



    --ENTITIES--
Contem a regra de negocio 


    --USECASES (interface)--
Composto por uma classe "abstrata", que, assim como no princípio *OCP*, permite a implementação dessa mesma classe em outro lugar, podendo assim, caso necessário, aplicá-la em outro contexto, desde que não viole o princípio *SRP*.

### Exemplo de interface 
        abstract class IGetSearchsUsecase {
         // RETORNO  ESPERADO                     //// DADOS A SEREM BUSCADOS // 
            AsyncResult<List<SearchEntity>, BaseError> call(SearchDTO dto);
        }


<!-- OPENCLOSE (PRINCIPIO DE ABERTO FECHADO) =>
    Nesse principio descreve que a aplicação esteja aberta para abstração e fechada para implementação
SINGLE RESPONSIBILITY (RESPONSABILIDADE UNICA) => 
    Cada classe tem um caso de uso claramente definido.        -->

# DATA
# UI


# S.O.L.I.D

    # Princípio da Responsabilidade Única (Single Responsibility Principle - SRP):

Este princípio afirma que uma classe deve ter apenas uma razão para mudar. No código fornecido, cada classe tem uma responsabilidade claramente definida:
IGetSearchsUsecase: Define apenas a estrutura de um caso de uso para buscar informações de pesquisa.
GetSearchsUsecase: Implementa o caso de uso definido na interface IGetSearchsUsecase, sendo responsável apenas por delegar a chamada para a fonte de dados.

    # Princípio do Aberto/Fechado (Open/Closed Principle - OCP):

Este princípio diz que as entidades de software devem estar abertas para extensão, mas fechadas para modificação. No código fornecido, a classe GetSearchsUsecase é uma implementação concreta da interface IGetSearchsUsecase. Se precisarmos adicionar novos comportamentos de busca, podemos fazer isso criando novas classes que implementam IGetSearchsUsecase, sem modificar a implementação existente.

    # Princípio da Substituição de Liskov (Liskov Substitution Principle - LSP):

Este princípio afirma que os objetos de um programa devem ser substituíveis por instâncias de seus subtipos sem afetar a integridade do programa. Embora não seja explicitamente demonstrado no código fornecido, a aplicação desse princípio dependeria das implementações de ISearchDatasource. Se todas as implementações de ISearchDatasource puderem ser substituídas por outras sem quebrar a funcionalidade de GetSearchsUsecase, então o princípio de Liskov estaria sendo seguido.

    # Princípio da Segregação de Interface (Interface Segregation Principle - ISP):

Este princípio afirma que nenhuma classe deve ser forçada a depender de métodos que não usa. No código fornecido, IGetSearchsUsecase define apenas um método (call). As classes que implementam IGetSearchsUsecase só precisam implementar esse método. Isso ajuda a evitar a criação de interfaces "gordas" que têm muitos métodos, alguns dos quais podem não ser necessários para todas as implementações.

    # Princípio da Inversão de Dependência (Dependency Inversion Principle - DIP):

Este princípio afirma que os módulos de alto nível não devem depender de módulos de baixo nível, ambos devem depender de abstrações. No código fornecido, GetSearchsUsecase depende de uma abstração (IGetSearchsUsecase) em vez de depender diretamente de uma implementação concreta de ISearchDatasource. Isso permite que diferentes implementações de ISearchDatasource sejam facilmente trocadas sem modificar GetSearchsUsecase, promovendo a flexibilidade e a extensibilidade do sistema.