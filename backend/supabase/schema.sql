-- My Box in Love: schema inicial para encomendas e catálogo
-- Executar no SQL Editor do projeto Supabase depois de o criar.
create extension if not exists pgcrypto;

create table if not exists public.mbl_products (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  description text not null default '',
  price_cents integer,
  active boolean not null default true,
  sort_order integer not null default 0,
  created_at timestamptz not null default now(),
  constraint mbl_products_price_nonnegative check (price_cents is null or price_cents >= 0)
);

create table if not exists public.mbl_orders (
  id uuid primary key default gen_random_uuid(),
  reference text not null unique default ('MBL-' || upper(substr(encode(gen_random_bytes(5),'hex'),1,8))),
  customer_name text not null,
  customer_phone text not null,
  product_name text not null,
  delivery_method text not null check (delivery_method in ('Entrega ao domicílio','Levantamento a combinar','Ainda não sei')),
  requested_date date,
  requested_time time,
  destination_address text not null default '',
  customer_notes text not null default '',
  status text not null default 'Novo' check (status in ('Novo','Em contacto','Confirmado','Em preparação','Pronto','Entregue','Cancelado')),
  delivery_km numeric(8,2),
  delivery_rate_cents integer,
  delivery_fee_cents integer,
  product_total_cents integer,
  admin_notes text not null default '',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists mbl_orders_created_at_idx on public.mbl_orders(created_at desc);
create index if not exists mbl_orders_status_idx on public.mbl_orders(status);

alter table public.mbl_products enable row level security;
alter table public.mbl_orders enable row level security;

-- Catálogo público: apenas produtos ativos e campos não sensíveis.
drop policy if exists "Public can read active products" on public.mbl_products;
create policy "Public can read active products"
on public.mbl_products for select
to anon, authenticated
using (active = true);

-- NÃO criar políticas públicas para ler, atualizar ou apagar encomendas.
-- A criação de encomendas públicas deve ser feita por Edge Function,
-- com validação dos campos e limitação de pedidos (rate limit).
-- O painel só deve consultar/alterar encomendas após autenticação
-- validada no servidor e autorização de administrador.

insert into public.mbl_products (name, description, active, sort_order)
select v.name, v.description, true, v.sort_order
from (values
 ('Box Pequeno-Almoço','Box para 1 ou 2 pessoas',1),
 ('Box Kids / Doces','Box personalizável',2),
 ('Box Festa','Presente para celebrações',3),
 ('Buquê de Doces','Buquê preparado por encomenda',4)
) as v(name,description,sort_order)
where not exists (
 select 1 from public.mbl_products p where p.name = v.name
);
