CloudHoster 🚀

O CloudHoster é um servidor containerizado ultraleve e altamente otimizado projetado para rodar de forma eficiente em AWS EC2 (e outras plataformas Cloud) com recursos de hardware extremamente limitados. Criado com o objetivo de servir como host para aplicações web frontend/backend, cada componente do CloudHoster foi cuidadosamente ajustado para reduzir uso de memória, CPU e espaço de armazenamento garantindo alta escalabilidade sem desperdício de recursos. O projeto combina Docker, automação e boas práticas de infraestrutura para entregar máximo desempenho, com foco em performance, escalabilidade, segurança e economia de recursos. 

📌 Principais Recursos
✅ Servidor Web Nginx + PHP-FPM otimizado para WordPress e aplicações PHP.
✅ E-mail Seguro com Postfix (SMTP), Dovecot (IMAP/POP3) e Roundcube (Webmail).
✅ FTP Seguro (vsftpd) para upload e gerenciamento de arquivos.
✅ Banco de Dados MariaDB rodando em um container separado para melhor desempenho e segurança.
✅ serviços isolados em containers com docker, garantindo segurança.
✅ wordpress para construção de sites.


Arquitetura
🧩 1. Container - CloudHoster
O CloudHoster é um container Docker baseado na imagem Debian 12 Slim, contendo múltiplos serviços integrados para hospedagem de sites e e-mails.

![cloudhoster_container](https://github.com/user-attachments/assets/eedd5ac5-2193-4498-9c1f-6a3169ae7497)

🏗️ 2. Arquitetura do Sistema - CloudHoster na AWS
A arquitetura do CloudHoster em produção foi desenhada para ser modular, escalável e segura. Abaixo, o fluxo principal baseado na imagem:

![Host_architecture](https://github.com/user-attachments/assets/99ee7b10-b10e-4dfe-95f2-decd906145f8)

☁️ Infraestrutura geral (EC2 + Docker)
Amazon EC2: Instância principal onde o Docker está instalado.
Containers cloudhoster: múltiplas instâncias para hospedagem.
MariaDB: banco de dados rodando em container separado.
EBS: Volume de armazenamento persistente conectado à instância EC2.

Dentro do EC2:
Nginx (reverse proxy): expõe os serviços via porta 80/443 e distribui tráfego interno.
UFW: Firewall no nível da instância (controle de portas internas).
ModSecurity: WAF para proteger contra ataques na camada HTTP.
Fail2Ban: Proteção contra brute-force e tentativas de login suspeitas.
Certbot (Let's Encrypt): Certificados SSL automáticos e renováveis.

🌐 Rede e acesso externo
Amazon VPC + Security Groups: Controlam tráfego de entrada/saída da EC2.

### Cloudflare:
Camada de cache, proteção DDoS e CDN.
Redireciona DNS e tráfego para a instância EC2.
Locaweb (DNS): Gerencia o domínio, apontando para o Cloudflare.


---

📦 Tecnologias Utilizadas
AWS EC2 e EBS
Docker + Docker Compose
Nginx + PHP-FPM
Postfix + Dovecot + Roundcube
MariaDB


🚀 Como Usar
1️⃣ Clone o repositório

> git clone https://github.com/seu-usuario/CloudHoster.git
> cd CloudHoster

2️⃣ Configure o arquivo .env (variáveis de ambiente para credenciais do banco de dados, e demais informações sensíveis).
3️⃣ Para iniciar os containers:

Rode o script run.sh. Este script gera o init.sql que será carregado para o container e executado para adicionar os bancos de dados e usuários ao SGDB. (só precisa ser executado na primeira vez, ou quando os valores das variáveis de ambiente sofrerem alteração no arquivo .env. Este script já inicia o docker compose automaticamente.

O Nginx foi configurado para realizar o cache das páginas para otimizar a performance de carregamento e reduzir o tráfego de saída do container.
