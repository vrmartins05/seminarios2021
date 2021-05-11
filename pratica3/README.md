# Compondo uma aplicação Nodejs com Banco de Dados MySQL + Instalando o Portainer

### O que é docker-compose?

> Docker Compose é uma ferramenta desenvolvida para ajudar a definir e compartilhar aplicativos com vários contêineres. Com o Compose, você pode criar um arquivo `YAML` para definir os serviços e com um único comando, pode contruir tudo ou desmontar tudo.
    A grande vantagem de usar o Compose é que você pode definir a pilha de aplicativos em um arquivo e contruí-la com um único comando.

### Instruções


1. Antes de iniciar verifique se o docker-compose está instalado.

        $ docker-compose -v

2. Caso não tenha o docker-compose instalado, acesse: 

    https://vrmartins05.github.io/seminarios2021/

3. Instruções para Docker-compose:

* **version**: serve apenas para dizermos qual a versão do Docker Compose estamos utilizando.

* **services**: são os nossos contêineres, app é nossa aplicação em NodeJS e temos mais um chamado db que é o nosso banco de dados mysql.

* **container_name**: atribuimos um nome ao nosso contêiner, um alias.

* **restart**: dizemos quando queremos reiniciar nossa aplicação, com o always dizemos que sempre, o padrão é o que faz com que o contêiner não reinicie em nenhuma circunstância.

* **build**: definimos onde se encontra o Dockerfile para gerar a imagem para criar o container.

* **enviroment**: é onde listamos as variáveis de ambiente do contêiner.

* **ports**: colocamos as portas que queremos expor do nosso contêiner, primeiro vem a porta do nosso contêiner e depois a do host, nesse caso nossa própria máquina, dessa forma a nossa app estará acessível pela porta 9001.

* **volume**: mapeamos o diretório da máquina local o qual queremos que compartilhe arquivos com o container que será criado.

* **links**: definimos a quais serviços nosso contêiner estará ligado.

* **depends_on**: dizemos que o nosso contêiner depende de outro, assim quando subirmos ele suas dependências serão levantadas primeiro.

* **image**: podemos definir qual imagem vamos utilizar no serviço, para o nosso serviço mongo vamos utilizar a imagem também chama mongo.

4. Para contruir nossa aplicação acessamos o diretório que se encontra o docker-compose e executamos o seguinte comando:

        $ docker-compose up
        
    A stack da nossa aplicação será contruída e será possível acessar por `localhost:9001/cursos`
    
5. Para parar a aplicação execute:

        $ docker-compose stop

6. Para destruir a aplicação execute:

        $ docker-compose rm
        
        
### Portainer

> **Portainer** é uma solução para gerenciamento de recursos como imagens e containers Docker, networks e volumes, o Portainer conta com uma Community Edition open source e facilmente instalável (utilizando Docker, claro!).

#### Instalando o Portainer

        $ docker run -d -p 9000:9000 --name portainer --restart always -v /var/run/docker.sock:/var/run/docker.sock -v /home/vinicius/Desenvolvimento/Portainer/data:/data portainer/portainer

#### Entendendo o comando

1. O parâmetro `-d`determina que o container em questão será executado como um serviço em background;

2. O parâmetro `-p` indica a porta (9000) através da qual acontecerá a comunicação com a aplicação Web correspondente ao Portainer, tendo neste caso se mapeado para o mesmo número da porta default (9000) deste gerenciador;

3. Já o atributo `--name` especifica o nome do container a ser gerado (portainer);

4. A instrução `--restart always` permite reiniciar o container do Portainer automaticamente;

5. A configuração `-v /var/run/docker.sock:/var/run/docker.sock` permitirá que se gerencie um ambiente Docker local;

6. Foi criado também um volume por meio do parâmetro `-v`, especificando assim o diretório no seu sistema em que serão gravados os dados do Portainer.

        /home/usuario/Desenvolvimento/Portainer/data

7. E por fim, indicamos a imagem utilizada como base para a geração do container `portainer/portainer`.

8. Após executar, confirme se o container do ***Portainer*** está em execução:

        $ docker ps
        
9. Acesse a URL http://localhost:9000 a partir do browser e defina uma senha para o usuário `Administrador`
