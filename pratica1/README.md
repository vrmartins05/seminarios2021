# Aprendendo Docker em 25 passos


1. Criar conta no https://hub.docker.com

2. Com o comando `docker` é possível verificar todos os comandos do Docker.

        $ docker run hello-world

3. Vamos verificar se há algum container em execução

        $ docker ps

4. Vamos verificar se há alguma imagem no nosso repositório local

        $ docker images

5. Podemos inspecionar a imagem com:

	$ docker image inspect nomedaimagem

6. Agora vamos buscar uma imagem no repositório do docker (docker Hub)

        $ docker search ubuntu

7. Para executar um container: (onde `-i` (modo interativo. Mantém o `stdin` aberto mesmo sem o console anexado. o `-t` aloca um pseudo TTY, que nada mais é que uma sessão do terminal)). `bin/bash` (é o processo que eu quero que seja startado, que é o nosso shell)

        $ docker run -it ubuntu:20.04 /bin/bash

    A especificação -t é proibida quando o cliente está recebendo sua entrada padrão de um `pipe`, como em:
    
        $ echo test | docker run -i busybox cat
        
8. Então após fazer o download da imagem já é criado o container. E ele é uma máquina como qualquer outra como podemos ver com o comando abaixo, porém com uma diferença que não tem o kernel dela, nem as libs nem os binários, está utilizando os da máquina host.

    Ver os processos em execução:

        $ ps  -ef

9. Se eu quiser sair do bash do container não posso sair com `ctrl+d`, se não vou matar esse processo, para eu sair e ele continuar executando em background eu digito `ctr+p+q` no linux

10. Posso executar o container em background com: -d (detached)

        $ docker run -it -d ubuntu:20.04 /bin/bash

11. Anteriormente executamos sem o `-d` com isso ele executa em primeiro plano.
    Com `-a` é possível definir qual tipo de fluxo padrão, entrada, saída e saída de erro com `stdin`, `stdout`, `stderr`.

        $ docker run -it -a stdin ubuntu:20.04 /bin/bash

    Não definindo esse fluxo padrão e nem o `detached` (backgroud), o Docker se conectará a `stdout` e `stderr`.

12. Após sair do container e eu executar o comando abaixo veremos nosso container em execução.

        $ docker ps

13. Para acessar novamente o container posso digitar

        $ docker attach id

14. Também é possível acessar o container com o comando 

		$ docker exec -it id /bin/bash

15. Qual a diferença entre `attach` e `exec`?
    O docker exec é utilizado para enviar um comando para o container em questão, quando você executa:
    
        $ docker exec -it container /bin/bash 
        
       é enviada uma instrução para o container abrir um processo do bash e mantê-lo aberto até que feche. Olhando a documentação é possível entender melhor essa questão.

    Enquanto que o `docker attach` anexa o `stdio` do container ao seu terminal, é como se você usasse um ssh.

16. Entrando novamente no nosso container podemos executar

        $ apt update

17. Em seguida, vamos sair do container e executar.. Com esse comando podemos ver as modificações realizadas no nosso container desde o momento que foi criado. (mostra arquivos criados, modificados e deletados)

        $ docker diff id

18. Podemos também nomear nosso container com o comando

		$ docker run -it --name meucontainer ubuntu /bin/bash

19. Para realizar mapeamento de volumes

		$ docker container run -it --rm -v "<host>:<container>" ubuntu

20. Até aqui nós temos nenhuma novidade, vamos agora criar um novo diretório dentro do nosso contêiner sem precisarmos entrar nele.

        $ docker exec id mkdir /home/ubuntu

21. Para criar um arquivo dentro do nosso diretório temp que acabamos de criar dentro do nosso contêiner:

        $ docker exec id touch /home/ubuntu/teste.txt

22. Podemos parar e iniciar nosso container:

        $ docker stop id
        $ docker start id

23. Podemos mapear as portas do nosso container

        $ docker run -it -p 8080:80 ubuntu:20.04 /bin/bash
        $ apt-get install nginx
        $ ps -ef (somente o processo do bash)
        $ /etc/inid.d/nginx start
        $ ps -ef
        $ netstat -atunp
        $ ctrl+p+q
        $ docker stop id
        $ docker commit id usuariodockerhub/nginx-ubuntu:1.0
        $ docker run -it -p 8080:80 usuariodockerhub/nginx-ubuntu:1.0 /bin/bash
        $ tail -f /var/log/nginx/access.log

    OU

        $ docker run -it -d -p 8080:80 nginx /bin/bash

24. Podemos realizar também o gerenciamento de recursos dos containers como MEM e CPU:
    Para limitar o uso de memória RAM que pode ser utilizada por esse container, basta executar o comando abaixo:
    
        $ docker container run -it --rm -m 512M python
        
    Para balancear o uso da CPU pelos containers, utilizamos especificação de pesos para cada container, quanto menor o peso, menor sua prioridade no uso. Os pesos podem oscilar de 1 a 1024.
    Caso não seja especificado o peso do container, ele usará o maior peso possível, nesse caso 1024.
 
    Usaremos como exemplo o peso 512:
    
        $ docker container run -it --rm -c 512 python

    Para melhor compreendimento,, vamos imaginar que três containers foram colocados em execução. Um deles tem o peso padrão 1024 e dois têm o peso 512. Caso os três processos demandam toda CPU o tempo de uso deles será dividido da seguinte maneira:
    O processo com peso 1024 usará 50% do tempo de processamento
    Os dois processos com peso 512 usarão 25% do tempo de processamento, cada.

25. Agora podemos agora remover tudo o que foi feito com:

        $ docker stop id
        $ docker rm id
        $ docker rmi id
