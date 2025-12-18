-- Supabase schema for Greyway.Co intake (write-only table)
-- Run via: supabase db push (or run in SQL editor)

create table if not exists public.school_applications (
  id uuid primary key default gen_random_uuid(),
  school_name text not null,
  school_type text not null,
  student_count_range text not null,
  current_system text not null,
  requires_offline boolean not null default true,
  applicant_name text not null,
  applicant_role text not null,
  contact_email text not null,
  contact_phone text not null,
  authorized_submission boolean not null default false,
  eligibility_tier text not null,
  submitted_at timestamptz not null default now()
);

-- Enable RLS to enforce write-only semantics
alter table public.school_applications enable row level security;

-- Insert-only policy: allow authenticated/anon inserts, but no selects/updates/deletes without policies
create policy if not exists "Allow inserts from clients" on public.school_applications
  for insert
  to authenticated, anon
  using (true);

-- No select/update/delete policies defined => clients cannot read or modify once written

-- Helpful index for auditing by submission time
create index if not exists idx_school_applications_submitted_at on public.school_applications (submitted_at desc);
