-- Jalankan sekali di Supabase: SQL Editor > New query > tempel > Run
create table if not exists public.modal (
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  month   text not null,
  amount  bigint not null check (amount >= 0),
  primary key (user_id, month)
);
create table if not exists public.expense (
  id         bigint generated always as identity primary key,
  user_id    uuid not null default auth.uid() references auth.users(id) on delete cascade,
  month      text not null,
  t          date not null,
  c          text not null,
  k          text not null,
  j          bigint not null check (j > 0),
  created_at timestamptz not null default now()
);
create index if not exists expense_user_month_idx on public.expense (user_id, month);

alter table public.modal   enable row level security;
alter table public.expense enable row level security;

create policy "modal milik sendiri" on public.modal
  for all to authenticated
  using (user_id = (select auth.uid())) with check (user_id = (select auth.uid()));
create policy "pengeluaran milik sendiri" on public.expense
  for all to authenticated
  using (user_id = (select auth.uid())) with check (user_id = (select auth.uid()));

-- aktifkan realtime
alter publication supabase_realtime add table public.modal, public.expense;

-- pemasukan dan tambahan modal
create table if not exists public.income (
  id         bigint generated always as identity primary key,
  user_id    uuid not null default auth.uid() references auth.users(id) on delete cascade,
  month      text not null,
  t          date not null,
  k          text not null,
  j          bigint not null check (j > 0),
  kind       text not null default 'pemasukan' check (kind in ('pemasukan','modal')),
  created_at timestamptz not null default now()
);
create index if not exists income_user_month_idx on public.income (user_id, month);
alter table public.income enable row level security;
drop policy if exists "pemasukan milik sendiri" on public.income;
create policy "pemasukan milik sendiri" on public.income
  for all to authenticated
  using (user_id = (select auth.uid())) with check (user_id = (select auth.uid()));
alter publication supabase_realtime add table public.income;
