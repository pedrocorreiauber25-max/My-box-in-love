# My Box in Love

Aplicação de gestão privada e loja online da My Box in Love.

## Endereços

- **Loja online:** https://myboxinlove.pages.dev/
- **Painel privado da Raquel:** https://pedrocorreiauber25-max.github.io/My-box-in-love/
- **Acompanhamento de encomenda:** https://myboxinlove.pages.dev/acompanhar.html?token=TOKEN_PRIVADO
- **Página de entrega do motorista:** https://myboxinlove.pages.dev/loja/driver.html?token=TOKEN_PRIVADO

Os dois últimos endereços precisam do token privado criado para cada encomenda. Não remover o token nem partilhar publicamente estes links.

## Estrutura

- `index.html` — painel privado, gestão, financeiro, stock, compras, clientes, encomendas e cópias de segurança.
- `loja/index.html` — loja online e formulário de encomenda.
- `loja/acompanhar.html` — estado, pagamento e localização em direto quando o motorista ativa a partilha.
- `acompanhar.html` — endereço antigo compatível; mantém o mesmo acompanhamento atualizado.
- `loja/driver.html` — partilha temporária da localização durante a entrega.
- `manifest.json` e `sw.js` — instalação PWA e cache do painel.
- `assets/` — logótipo e recursos visuais.
- `backend/` — recursos do servidor, quando aplicável.

## Dados e segurança

- O acesso ao painel é protegido por PIN validado no servidor. **Não alterar o PIN nem colocar segredos no código público.**
- As encomendas online, respetivos estados e a lista partilhada de materiais usam o Supabase.
- Os registos internos do painel (por exemplo, compras, stock, despesas e encomendas manuais) são guardados no armazenamento local do navegador deste dispositivo.
- Usa regularmente **Definições → Cópia de segurança → Exportar cópia de segurança** e guarda o ficheiro JSON num local seguro.
- A localização do motorista só é partilhada durante a entrega e deve ser terminada ao marcar a encomenda como entregue.
- Nunca publicar tokens de acompanhamento, tokens de motorista ou chaves privadas.

## Publicação

O painel está preparado para GitHub Pages na raiz do repositório, branch `main`. A loja pública e as páginas de acompanhamento/entrega estão alojadas em `myboxinlove.pages.dev`.

Depois de alterações ao `sw.js`, o número da cache deve ser incrementado para os dispositivos receberem a nova versão.
