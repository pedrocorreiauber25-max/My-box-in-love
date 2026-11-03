# My Box in Love

Loja pública, painel privado e acompanhamento de encomendas da My Box in Love.

## Endereços
- Loja pública: https://myboxinlove.pages.dev/
- Painel privado: https://pedrocorreia25-max.github.io/My-box-in-love/
- Acompanhamento: https://myboxinlove.pages.dev/acompanhar.html?token=TOKEN_PRIVADO
- Página do motorista: https://myboxinlove.pages.dev/driver.html?token=TOKEN_PRIVADO

## Componentes
- `loja/index.html`: catálogo, formulário de pedido, adicionais, cálculo de entrega e envio ao backend.
- `loja/acompanhar.html`: acompanhamento privado da encomenda e instruções de pagamento autorizadas.
- `index.html`: painel privado de gestão, encomendas, operações e notificações.
- `driver.html`: página do motorista, navegação Waze e partilha temporária de localização.
- `assets/`: identidade visual e fotografias reais da loja.
- `backend/supabase/schema.sql`: estrutura inicial da base de dados.

## Backend Supabase
Projeto: `tlhcwzpyuhitjxymapbm`

Edge Functions ativas:
- `smart-action`: autenticação do painel, gestão operacional, encomendas, links de motorista e notificações.
- `super-handler`: receção e validação de pedidos públicos, preços oficiais, antecedência mínima, geocodificação, cálculo de rota, tracking e localização do motorista.

A loja envia os pedidos para `super-handler`. Os preços dos produtos e adicionais são validados no servidor; o preço enviado pelo navegador não é considerado autoridade. Os pedidos ficam guardados em `mbl_orders`. A leitura pública de uma encomenda exige o token privado de acompanhamento.

## Catálogo base
- Box Basic · Individual — 33 €
- Box Classic · Para dividir — 65 €
- Box Kids · Individual — 36 €
- Festa na Box — 75 €
- Caixa Presente — 40 € a 70 €
- Buquê de Doces — 45 € a 70 €
- Pedido personalizado — preço confirmado pela loja.

Adicionais com preço fixo: balão temático (4 €), placa de mensagem (3 €), quadro personalizado (15 €), trio de fotos Polaroid (5 €) e rosas (3 € por unidade, até 30).

## Regras de encomenda
- Boxes standard: pelo menos 24 horas de antecedência.
- Caixa Presente e Buquê de Doces: pelo menos 48 horas.
- Entrega ao domicílio: morada localizada e preço calculado por rota rodoviária antes do envio.
- Levantamento: a combinar com a loja.
- O pedido inicial não é confirmação final da encomenda; disponibilidade, total e pagamento são confirmados pela equipa.

## Segurança e operação
- Nunca colocar a chave `service_role`, segredos VAPID ou PIN no frontend/repositório.
- As ações administrativas usam sessão validada no servidor.
- O link de acompanhamento é privado e assinado; não deve ser partilhado.
- O link do motorista é temporário, assinado e limitado a entregas ao domicílio.
- A localização do motorista só é partilhada durante a entrega e é desligada ao terminar.
- Não criar encomendas de teste nem pagamentos fictícios em produção.

## Manutenção
Após alterar ficheiros estáticos, confirmar a publicação no respetivo alojamento. Após alterar Edge Functions, confirmar que a versão ativa corresponde ao código pretendido. Testes de encomenda em produção devem ser feitos apenas com autorização explícita da proprietária.
