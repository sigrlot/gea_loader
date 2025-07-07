-- 删除触发器
DROP TRIGGER IF EXISTS trigger_update_staking_stats_by_region ON public.staking_counts;
DROP TRIGGER IF EXISTS trigger_update_staking_address_count ON public.staking_counts;

-- 删除触发器函数
DROP FUNCTION IF EXISTS update_staking_stats_by_region();
DROP FUNCTION IF EXISTS update_staking_address_count();

-- 删除表
DROP TABLE IF EXISTS public.staking_stats_by_region;
DROP TABLE IF EXISTS public.staking_address_count;