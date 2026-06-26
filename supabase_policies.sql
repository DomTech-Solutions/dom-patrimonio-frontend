-- =========================================================================
-- SUPABASE SECURITY & RLS POLICIES FOR DOM PATRIMÓNIO
-- Execute este script no SQL Editor do seu painel do Supabase.
-- =========================================================================

-- 1. CRIAÇÃO OU AJUSTE DA TABELA DE PERFIS (PROFILES)
-- Garante que o esquema é compatível com o UUID do Supabase Auth.
CREATE TABLE IF NOT EXISTS public.profiles (
    id UUID REFERENCES auth.users(id) ON DELETE CASCADE PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT,
    role TEXT DEFAULT 'manager',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- Ativar RLS (Row Level Security) em todas as tabelas utilizadas
ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.rules ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.transactions ENABLE ROW LEVEL SECURITY;

-- 2. POLÍTICAS DE SEGURANÇA PARA A TABELA 'PROFILES'
-- Permite que o utilizador autenticado leia qualquer perfil (necessário para buscas de perfil)
CREATE POLICY "Permitir leitura de perfis a utilizadores autenticados" 
ON public.profiles FOR SELECT 
TO authenticated 
USING (true);

-- Permite que o utilizador insira o seu próprio perfil logo após o login
CREATE POLICY "Permitir inserção do próprio perfil" 
ON public.profiles FOR INSERT 
TO authenticated 
WITH CHECK (auth.uid() = id);

-- Permite que o utilizador atualize o seu próprio perfil
CREATE POLICY "Permitir atualização do próprio perfil" 
ON public.profiles FOR UPDATE 
TO authenticated 
USING (auth.uid() = id)
WITH CHECK (auth.uid() = id);


-- 3. POLÍTICAS DE SEGURANÇA PARA A TABELA 'CATEGORIES'
-- Permite todas as operações se o profile_id for igual ao UID do utilizador autenticado
CREATE POLICY "Controlo total de categorias do próprio utilizador" 
ON public.categories FOR ALL 
TO authenticated 
USING (auth.uid() = profile_id)
WITH CHECK (auth.uid() = profile_id);


-- 4. POLÍTICAS DE SEGURANÇA PARA A TABELA 'RULES'
-- Permite todas as operações se o profile_id for igual ao UID do utilizador autenticado
CREATE POLICY "Controlo total de regras do próprio utilizador" 
ON public.rules FOR ALL 
TO authenticated 
USING (auth.uid() = profile_id)
WITH CHECK (auth.uid() = profile_id);


-- 5. POLÍTICAS DE SEGURANÇA PARA A TABELA 'TRANSACTIONS'
-- Permite todas as operações se o profile_id for igual ao UID do utilizador autenticado
CREATE POLICY "Controlo total de lançamentos do próprio utilizador" 
ON public.transactions FOR ALL 
TO authenticated 
USING (auth.uid() = profile_id)
WITH CHECK (auth.uid() = profile_id);
