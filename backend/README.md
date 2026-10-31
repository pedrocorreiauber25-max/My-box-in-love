# Backend — My Box in Love

Esta pasta prepara a futura ligação da loja pública ao painel privado.

## Estado
- `schema.sql`: tabelas iniciais de produtos e encomendas, índices e RLS.
- A loja estática ainda envia pedidos por WhatsApp; ainda não grava encomendas nesta base de dados.
- O painel atual continua independente e não foi alterado.
- Não existe ainda autenticação PIN, Edge Function, ligação Supabase no frontend ou cálculo rodoviário de entrega.

## Configuração necessária
1. Criar um projeto Supabase em https://supabase.com/.
2. Abrir **SQL Editor** e executar o ficheiro `backend/supabase/schema.sql`.
3. Guardar o Project URL e a chave pública (anon/publishable). Nunca colocar a chave `service_role` no site.
4. Antes de ligar a loja, implementar Edge Functions para:
   - receber pedidos e validar os campos;
   - aplicar limites anti-spam;
   - gerar e devolver a referência do pedido;
   - validar a sessão administrativa;
   - listar/alterar pedidos apenas para a Raquel.
5. Implementar o acesso da Raquel por PIN de 4 dígitos no servidor, com hash forte, limitação de tentativas, bloqueio temporário e sessão segura. O PIN não pode ficar no HTML, JavaScript, repositório ou localStorage.
6. Só depois ligar o frontend da loja e o painel às funções.

## Segurança
As políticas RLS deixam a leitura pública limitada ao catálogo ativo. Não existe política pública de leitura ou alteração de encomendas. A criação pública também não está aberta diretamente à tabela: deverá passar por uma Edge Function com validação e proteção anti-abuso.

A morada de origem da Raquel e quaisquer segredos de routing devem permanecer no servidor. Não publicar esses valores no frontend nem enviá-los a serviços de rotas a partir do browser.

## Próximo passo
Criar o projeto Supabase e fornecer apenas o Project URL e a chave pública (anon/publishable) para preparar a integração do frontend. Nunca enviar palavras-passe, PIN, chave service_role ou outros segredos por aqui.
