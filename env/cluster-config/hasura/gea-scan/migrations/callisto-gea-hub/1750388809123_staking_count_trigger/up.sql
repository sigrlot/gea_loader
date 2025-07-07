-- 创建staking_stats_by_region表
CREATE TABLE IF NOT EXISTS public.staking_stats_by_region (
    region_id text NOT NULL,
    has_delegation_count bigint DEFAULT 0,
    has_fixed_deposit_count bigint DEFAULT 0,
    has_lock_up_deposit_count bigint DEFAULT 0,
    has_kyc_count bigint DEFAULT 0,
    total_delegation_amount numeric DEFAULT 0,
    total_kyc_amount numeric DEFAULT 0,
    total_fixed_deposit_amount numeric DEFAULT 0,
    total_lock_up_deposit_amount numeric DEFAULT 0,
    updated_at timestamp DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT staking_stats_by_region_pkey PRIMARY KEY (region_id)
);

-- 创建staking_address_count表
CREATE TABLE IF NOT EXISTS public.staking_address_count (
    region_id text NOT NULL,
    address_count bigint DEFAULT 0,
    updated_at timestamp DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT staking_address_count_pkey PRIMARY KEY (region_id)
);

-- 创建索引
CREATE INDEX IF NOT EXISTS idx_staking_stats_by_region_updated_at ON public.staking_stats_by_region USING btree (updated_at);
CREATE INDEX IF NOT EXISTS idx_staking_address_count_updated_at ON public.staking_address_count USING btree (updated_at);

-- 创建触发器函数：更新staking_stats_by_region表
CREATE OR REPLACE FUNCTION update_staking_stats_by_region()
RETURNS TRIGGER AS $$
DECLARE
    old_region_id text;
    new_region_id text;
BEGIN
    -- 获取旧数据和新数据的region_id
    IF TG_OP = 'DELETE' THEN
        old_region_id := OLD.region_id;
    ELSIF TG_OP = 'INSERT' THEN
        new_region_id := NEW.region_id;
    ELSIF TG_OP = 'UPDATE' THEN
        old_region_id := OLD.region_id;
        new_region_id := NEW.region_id;
    END IF;

    -- 处理删除操作或更新操作的旧数据
    IF TG_OP = 'DELETE' OR (TG_OP = 'UPDATE' AND old_region_id != new_region_id) THEN
        INSERT INTO public.staking_stats_by_region (
            region_id,
            has_delegation_count,
            has_fixed_deposit_count,
            has_lock_up_deposit_count,
            has_kyc_count,
            total_delegation_amount,
            total_kyc_amount,
            total_fixed_deposit_amount,
            total_lock_up_deposit_amount
        )
        VALUES (old_region_id, 0, 0, 0, 0, 0, 0, 0, 0)
        ON CONFLICT (region_id) DO UPDATE SET
            has_delegation_count = staking_stats_by_region.has_delegation_count - 
                CASE WHEN OLD.has_delegation THEN 1 ELSE 0 END,
            has_fixed_deposit_count = staking_stats_by_region.has_fixed_deposit_count - 
                CASE WHEN OLD.has_fixed_deposit THEN 1 ELSE 0 END,
            has_lock_up_deposit_count = staking_stats_by_region.has_lock_up_deposit_count - 
                CASE WHEN OLD.has_lock_up_deposit THEN 1 ELSE 0 END,
            has_kyc_count = staking_stats_by_region.has_kyc_count - 
                CASE WHEN OLD.has_kyc THEN 1 ELSE 0 END,
            total_delegation_amount = staking_stats_by_region.total_delegation_amount - 
                COALESCE(OLD.delegation_amount, 0),
            total_kyc_amount = staking_stats_by_region.total_kyc_amount - 
                COALESCE(OLD.kyc_amount, 0),
            total_fixed_deposit_amount = staking_stats_by_region.total_fixed_deposit_amount - 
                COALESCE(OLD.fixed_deposit_amount, 0),
            total_lock_up_deposit_amount = staking_stats_by_region.total_lock_up_deposit_amount - 
                COALESCE(OLD.lock_up_deposit_amount, 0),
            updated_at = CURRENT_TIMESTAMP;
    END IF;

    -- 处理插入操作或更新操作的新数据
    IF TG_OP = 'INSERT' OR TG_OP = 'UPDATE' THEN
        INSERT INTO public.staking_stats_by_region (
            region_id,
            has_delegation_count,
            has_fixed_deposit_count,
            has_lock_up_deposit_count,
            has_kyc_count,
            total_delegation_amount,
            total_kyc_amount,
            total_fixed_deposit_amount,
            total_lock_up_deposit_amount
        )
        VALUES (
            new_region_id,
            CASE WHEN NEW.has_delegation THEN 1 ELSE 0 END,
            CASE WHEN NEW.has_fixed_deposit THEN 1 ELSE 0 END,
            CASE WHEN NEW.has_lock_up_deposit THEN 1 ELSE 0 END,
            CASE WHEN NEW.has_kyc THEN 1 ELSE 0 END,
            COALESCE(NEW.delegation_amount, 0),
            COALESCE(NEW.kyc_amount, 0),
            COALESCE(NEW.fixed_deposit_amount, 0),
            COALESCE(NEW.lock_up_deposit_amount, 0)
        )
        ON CONFLICT (region_id) DO UPDATE SET
            has_delegation_count = staking_stats_by_region.has_delegation_count + 
                CASE WHEN NEW.has_delegation THEN 1 ELSE 0 END - 
                CASE WHEN TG_OP = 'UPDATE' AND OLD.has_delegation THEN 1 ELSE 0 END,
            has_fixed_deposit_count = staking_stats_by_region.has_fixed_deposit_count + 
                CASE WHEN NEW.has_fixed_deposit THEN 1 ELSE 0 END - 
                CASE WHEN TG_OP = 'UPDATE' AND OLD.has_fixed_deposit THEN 1 ELSE 0 END,
            has_lock_up_deposit_count = staking_stats_by_region.has_lock_up_deposit_count + 
                CASE WHEN NEW.has_lock_up_deposit THEN 1 ELSE 0 END - 
                CASE WHEN TG_OP = 'UPDATE' AND OLD.has_lock_up_deposit THEN 1 ELSE 0 END,
            has_kyc_count = staking_stats_by_region.has_kyc_count + 
                CASE WHEN NEW.has_kyc THEN 1 ELSE 0 END - 
                CASE WHEN TG_OP = 'UPDATE' AND OLD.has_kyc THEN 1 ELSE 0 END,
            total_delegation_amount = staking_stats_by_region.total_delegation_amount + 
                COALESCE(NEW.delegation_amount, 0) - 
                CASE WHEN TG_OP = 'UPDATE' THEN COALESCE(OLD.delegation_amount, 0) ELSE 0 END,
            total_kyc_amount = staking_stats_by_region.total_kyc_amount + 
                COALESCE(NEW.kyc_amount, 0) - 
                CASE WHEN TG_OP = 'UPDATE' THEN COALESCE(OLD.kyc_amount, 0) ELSE 0 END,
            total_fixed_deposit_amount = staking_stats_by_region.total_fixed_deposit_amount + 
                COALESCE(NEW.fixed_deposit_amount, 0) - 
                CASE WHEN TG_OP = 'UPDATE' THEN COALESCE(OLD.fixed_deposit_amount, 0) ELSE 0 END,
            total_lock_up_deposit_amount = staking_stats_by_region.total_lock_up_deposit_amount + 
                COALESCE(NEW.lock_up_deposit_amount, 0) - 
                CASE WHEN TG_OP = 'UPDATE' THEN COALESCE(OLD.lock_up_deposit_amount, 0) ELSE 0 END,
            updated_at = CURRENT_TIMESTAMP;
    END IF;

    -- 返回适当的记录
    IF TG_OP = 'DELETE' THEN
        RETURN OLD;
    ELSE
        RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;

-- 创建触发器函数：更新staking_address_count表
CREATE OR REPLACE FUNCTION update_staking_address_count()
RETURNS TRIGGER AS $$
DECLARE
    old_region_id text;
    new_region_id text;
BEGIN
    -- 获取旧数据和新数据的region_id
    IF TG_OP = 'DELETE' THEN
        old_region_id := OLD.region_id;
    ELSIF TG_OP = 'INSERT' THEN
        new_region_id := NEW.region_id;
    ELSIF TG_OP = 'UPDATE' THEN
        old_region_id := OLD.region_id;
        new_region_id := NEW.region_id;
    END IF;

    -- 处理删除操作或region_id变更的情况
    IF TG_OP = 'DELETE' OR (TG_OP = 'UPDATE' AND old_region_id != new_region_id) THEN
        -- 减少旧region的地址计数
        INSERT INTO public.staking_address_count (region_id, address_count)
        VALUES (old_region_id, 0)
        ON CONFLICT (region_id) DO UPDATE SET
            address_count = GREATEST(0, staking_address_count.address_count - 1),
            updated_at = CURRENT_TIMESTAMP;
    END IF;

    -- 处理插入操作或region_id变更的情况
    IF TG_OP = 'INSERT' OR (TG_OP = 'UPDATE' AND old_region_id != new_region_id) THEN
        -- 增加新region的地址计数
        INSERT INTO public.staking_address_count (region_id, address_count)
        VALUES (new_region_id, 1)
        ON CONFLICT (region_id) DO UPDATE SET
            address_count = staking_address_count.address_count + 1,
            updated_at = CURRENT_TIMESTAMP;
    END IF;

    -- 返回适当的记录
    IF TG_OP = 'DELETE' THEN
        RETURN OLD;
    ELSE
        RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;

-- 创建触发器
CREATE TRIGGER trigger_update_staking_stats_by_region
    AFTER INSERT OR UPDATE OR DELETE ON public.staking_counts
    FOR EACH ROW EXECUTE FUNCTION update_staking_stats_by_region();

CREATE TRIGGER trigger_update_staking_address_count
    AFTER INSERT OR UPDATE OR DELETE ON public.staking_counts
    FOR EACH ROW EXECUTE FUNCTION update_staking_address_count();

-- 初始化现有数据的统计
INSERT INTO public.staking_stats_by_region (
    region_id,
    has_delegation_count,
    has_fixed_deposit_count,
    has_lock_up_deposit_count,
    has_kyc_count,
    total_delegation_amount,
    total_kyc_amount,
    total_fixed_deposit_amount,
    total_lock_up_deposit_amount
)
SELECT 
    region_id,
    COUNT(CASE WHEN has_delegation THEN 1 END) as has_delegation_count,
    COUNT(CASE WHEN has_fixed_deposit THEN 1 END) as has_fixed_deposit_count,
    COUNT(CASE WHEN has_lock_up_deposit THEN 1 END) as has_lock_up_deposit_count,
    COUNT(CASE WHEN has_kyc THEN 1 END) as has_kyc_count,
    COALESCE(SUM(delegation_amount), 0) as total_delegation_amount,
    COALESCE(SUM(kyc_amount), 0) as total_kyc_amount,
    COALESCE(SUM(fixed_deposit_amount), 0) as total_fixed_deposit_amount,
    COALESCE(SUM(lock_up_deposit_amount), 0) as total_lock_up_deposit_amount
FROM public.staking_counts
GROUP BY region_id
ON CONFLICT (region_id) DO UPDATE SET
    has_delegation_count = EXCLUDED.has_delegation_count,
    has_fixed_deposit_count = EXCLUDED.has_fixed_deposit_count,
    has_lock_up_deposit_count = EXCLUDED.has_lock_up_deposit_count,
    has_kyc_count = EXCLUDED.has_kyc_count,
    total_delegation_amount = EXCLUDED.total_delegation_amount,
    total_kyc_amount = EXCLUDED.total_kyc_amount,
    total_fixed_deposit_amount = EXCLUDED.total_fixed_deposit_amount,
    total_lock_up_deposit_amount = EXCLUDED.total_lock_up_deposit_amount,
    updated_at = CURRENT_TIMESTAMP;

-- 初始化现有数据的地址计数
INSERT INTO public.staking_address_count (region_id, address_count)
SELECT 
    region_id,
    COUNT(DISTINCT address) as address_count
FROM public.staking_counts
GROUP BY region_id
ON CONFLICT (region_id) DO UPDATE SET
    address_count = EXCLUDED.address_count,
    updated_at = CURRENT_TIMESTAMP;


