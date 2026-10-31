# My Box in Love — ficheiros iniciais

Esta pasta contém a pré-versão visual e funcional local da aplicação, com o logótipo e os ficheiros necessários para a instalação PWA.

## Publicar no GitHub Pages
1. Abrir o repositório `My-box-in-love` no GitHub.
2. Escolher **Add file → Upload files**.
3. Enviar todos os ficheiros desta pasta (incluindo `assets/`), mantendo a estrutura.
4. Carregar em **Commit changes**.
5. Ir a **Settings → Pages**.
6. Em **Build and deployment**, escolher **Deploy from a branch**, branch `main`, pasta `/ (root)` e guardar.
7. Aguardar a publicação. O endereço será `https://pedrocorreiauber25-max.github.io/My-box-in-love/` se o repositório continuar com este nome e a conta mantiver este endereço.

## Estado e segurança — ler antes de usar
- Esta é uma pré-versão de demonstração. Os registos ficam apenas no armazenamento local do navegador/dispositivo.
- O botão de entrada não valida credenciais. Não é uma autenticação real.
- Não introduzir nomes, contactos, moradas ou outros dados reais de clientes nesta versão.
- Não existe ainda sincronização entre dispositivos, cópia de segurança na nuvem nem controlo de acesso privado.
- A próxima etapa é configurar Supabase Auth + base de dados + políticas RLS e ligar a aplicação a esses serviços. Nunca colocar a chave `service_role` no código público.

## Conteúdo
- `index.html` — interface e funcionalidades de demonstração.
- `assets/logo-my-box-in-love.jpg` — logótipo fornecido.
- `manifest.webmanifest` e `sw.js` — instalação e cache PWA.
