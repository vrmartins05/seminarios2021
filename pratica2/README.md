# Contruindo uma imagem com Dockerfile

``` Dockerfile
FROM debian:latest

LABEL maintainer="Vinicius R. Martins"

RUN apt-get update && apt-get upgrade -y

RUN apt-get install nginx -y

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
```

### Dockerfile

* **FROM**:  O primeiro argumento do Dockerfile deve ser sempre o **FROM**, seguido da imagem e versão que será utilizada. Caso não seja informada a versão, o Docker vai procurar a mais atual do seu repositório oficial.

* **LABEL**: coloca um metadado para o container;

* **RUN**:  executa os comandos dentro do container;

* **EXPOSE**: expõe a porta informada do container;

* **CMD**: Informa o comando que será executado após a criação do container, e também pode ser usado para definir os parâmetros que serão usados no comando ENTRYPOINT.

#### Além das instruções acima temos também:

* **ENTRYPOINT**: Define o aplicativo padrão usado toda vez que um contêiner é criado a partir da imagem. Se usado em conjunto com o CMD, você pode remover o aplicativo e apenas definir os argumentos no CMD. 

* **ENV**: Define/modifica as variáveis de ambiente dentro dos Containers criados a partir da imagem.

* **COPY**: Copia arquivos do seu ambiente para o contâiner. 
    ***Ex:***  
        **COPY** *origem* *destino*


### Comandos  

1. construir imagem passando uma tag com o parâmetro `-t` e informando o contexto do arquivo Dockerfile com `. (ponto)`

        $ docker build -t mysql-image .
        
    Caso for necessário informar o local do arquivo devido estar em outro diretório, passar o parãmetro `-f` e o path.
    
        $ docker build -t minhaimagem -f /doc/local/Dockerfile .
        
2. Após isso é só criar o container informando a imagem criada.

        $ docker run idimagem
        
3. Para enviar sua imagem ao https://hub.docker.com vamos realizar o login, informando o `user` e `password` com o seguinte comando:

         $ docker login 

4. Após realizar o login envie sua imagem com o comando:

         $ docker push seuuserdockerhub/nomeimagem:tag

5. Caso sua imagem não está nomeada com seu user do docker hub, realize a atribuição com o comando abaixo e em seguida execute o passo 4 `docker push`

         $ docker tag idimagem seuuserdockerhub/nomeimagem:tag
