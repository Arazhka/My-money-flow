-- Pembaruan: tabel pemasukan. Jalankan sekali di SQL Editor (untuk proyek yang sudah dibuat sebelumnya).
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
