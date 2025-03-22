CloudHoster 🚀

O CloudHoster é uma solução ultraleve e altamente otimizada para hospedagem de sites e e-mails, projetada para rodar de forma eficiente em AWS EC2 e outras plataformas Cloud. Desenvolvido com foco em performance, escalabilidade, segurança e economia de recursos, o projeto combina Docker, automação e boas práticas de infraestrutura para entregar máximo desempenho com o menor consumo de hardware. Cada componente do CloudHoster foi cuidadosamente ajustado para reduzir uso de memória e CPU, garantindo alta escalabilidade sem desperdício de recursos.

📌 Principais Recursos
✅ Painel de Controle HestiaCP para gerenciamento de domínios, e-mails e aplicações.
✅ Servidor Web Nginx + PHP-FPM otimizado para WordPress e aplicações PHP.
✅ E-mail Seguro com Postfix (SMTP), Dovecot (IMAP/POP3) e Roundcube (Webmail).
✅ Banco de Dados MariaDB rodando em um container separado para melhor desempenho.
✅ FTP Seguro (vsftpd) para upload e gerenciamento de arquivos.
✅ Rede Interna Docker isolando serviços e garantindo segurança.
✅ Pronto para Certificados SSL com suporte para Certbot (Let's Encrypt).


📦 Tecnologias Utilizadas
Docker + Docker Compose
HestiaCP (painel de controle)
Nginx + PHP-FPM
Postfix + Dovecot + Roundcube
MariaDB (em container separado)
vsftpd (FTP seguro)


🚀 Como Usar
1️⃣ Clone o repositório

> git clone https://github.com/seu-usuario/CloudHoster.git
> cd CloudHoster

2️⃣ Configure o arquivo .env (variáveis de ambiente para banco de dados, SMTP, etc.).
3️⃣ Inicie os containers


docker-compose up --build -d
4️⃣ Acesse o HestiaCP


https://localhost:8083
📌 Usuário: admin
📌 Senha: definida na instalação

5️⃣ Configure domínios, e-mails e aplicações diretamente pelo HestiaCP.


🛠️ Configuração
Web: Nginx serve páginas com cache otimizado.
E-mail: Postfix + Dovecot para envio e recebimento seguro.
Banco: MariaDB rodando isolado.
Segurança: Apenas portas essenciais expostas, criptografia TLS ativa.


📌 Contribuição
💡 Pull requests e sugestões são bem-vindos!