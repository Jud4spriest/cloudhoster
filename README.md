CloudHoster 🚀

O CloudHoster é um servidor containerizado ultraleve, altamente otimizado e projetado para rodar de forma eficiente em instâncias EC2 da AWS (ou outras plataformas cloud) mesmo com recursos de hardware extremamente limitados. Desenvolvido para hospedar aplicações web frontend/backend com máxima eficiência, cada componente do CloudHoster foi cuidadosamente ajustado para minimizar o uso de memória, CPU e disco, garantindo escalabilidade com o menor consumo possível. A solução combina Docker, automação e boas práticas de infraestrutura para entregar performance, segurança e estabilidade com foco em economia de recursos.

---

📌 Principais Recursos
✅ Servidor Web Nginx + PHP-FPM configurado com cache, compressão Gzip, HTTP/2 e FastCGI para desempenho superior.
✅ Postfix (SMTP) + Dovecot (IMAP/POP3) + Roundcube (Webmail) para serviços de e-mail seguros e acessíveis.
✅ FTP Seguro (vsftpd) para upload e gerenciamento de arquivos.
✅ WordPress otimizado para consumo mínimo, com cache de página, opcache e desativação de funcionalidades desnecessárias por script.
✅ MariaDB executando em container separado para isolação, segurança e melhor desempenho.
✅ Serviços isolados via Docker, garantindo encapsulamento e segurança operacional.


---

Arquitetura
🧩 1. Container - CloudHoster
O container é baseado em Debian 12 Slim, com um ambiente leve e robusto.

<img src="https://github.com/user-attachments/assets/eedd5ac5-2193-4498-9c1f-6a3169ae7497" alt="cloudhoster_container" style="max-width: 100%; height: auto;"/>

Ele inclui:
* Nginx + PHP-FPM com configurações finas para minimizar uso de workers, limitar conexões e ativar cache dinâmico.
* WordPress com instalação minimalista, plugins otimizados e arquivos cacheados.
* Postfix, Dovecot, Roundcube totalmente integrados e configurados para criptografia (TLS), autenticação segura e log rotativo.
* vsftpd configurado com SSL e isolamento de usuários.
* MariaDB-client apenas para comunicação com o banco remoto/container.

🏗️ 2. Arquitetura do Sistema - CloudHoster na AWS
A arquitetura de produção prioriza segurança, modularidade e escalabilidade. Abaixo, o fluxo principal baseado na imagem:

![Host_architecture](https://github.com/user-attachments/assets/99ee7b10-b10e-4dfe-95f2-decd906145f8)

* EC2 Instance (Amazon Linux ou Debian) com Docker e Docker Compose.
* CloudHoster Containers: 1 ou mais instâncias para sites diferentes.
* MariaDB Container: banco de dados isolado, com backup automatizado.
* Nginx (reverse proxy): roteamento de domínios, cache de páginas estáticas e SSL.
* UFW + ModSecurity + Fail2Ban: camada de segurança interna contra ataques.
* Certbot (Let's Encrypt): emissão e renovação automática de certificados.

🌐 Camada de Rede

* Amazon VPC + Security Groups: filtragem e controle de tráfego.
* Cloudflare: CDN, cache, SSL flexível, proteção DDoS.
* Locaweb DNS: apontamento de domínio para Cloudflare.

  
---

📦 Tecnologias Utilizadas

* AWS EC2 + EBS
* Docker + Docker Compose
* Nginx + PHP-FPM
* WordPress (otimizado)
* MariaDB
* Postfix + Dovecot + Roundcube
* UFW, Fail2Ban, Certbot, ModSecurity


🚀 Como Usar
1️⃣ Clone o repositório

> git clone https://github.com/seu-usuario/CloudHoster.git
> cd CloudHoster

2️⃣ Configure o arquivo .env com credenciais, nomes de bancos e domínio
3️⃣ Rode o script run.sh. Ele:
* Gera o init.sql com as estruturas do banco.
* Sobe o docker-compose com os containers.
* Aplica configurações de rede e ambiente.

> O Nginx realiza cache de páginas estáticas, compressão e controle de headers para reduzir latência e consumo de banda.


CloudHoster é ideal para quem deseja hospedar múltiplos sites com o máximo de eficiência, autonomia e controle. Indicado para freelancers, agências, devs ou startups que valorizam performance, segurança e baixo custo.
