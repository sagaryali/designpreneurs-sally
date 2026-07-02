-- Enable Row Level Security on the public read-only tables and add
-- SELECT-only policies for the anon role. Run the whole file at once:
--   supabase link --project-ref nqbudfddwzhtqebecmez && supabase db push
--   -- or --
--   psql "$SUPABASE_DB_URL" -f security.sql
--
-- Idempotent: safe to re-run.

alter table public.people  enable row level security;
alter table public.hackers enable row level security;
alter table public.events  enable row level security;

drop policy if exists "public read" on public.people;
drop policy if exists "public read" on public.hackers;
drop policy if exists "public read" on public.events;

create policy "public read" on public.people  for select to anon using (true);
create policy "public read" on public.hackers for select to anon using (true);
create policy "public read" on public.events  for select to anon using (true);
