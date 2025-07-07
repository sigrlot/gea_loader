import random
import logging

from locust import TaskSet, task, HttpUser, tag

MAX_OFFSET = 10000
MAX_LIMIT = 20
MAX_BLOCK_HEIGHT = 1000000

logging.getLogger("locust.stats_logger").setLevel(logging.WARNING)

def random_offset():    
    """获取随机偏移量"""
    return 0
    # return random.randint(0, MAX_OFFSET)

def random_limit():
    """获取随机限制"""
    return random.randint(1, MAX_LIMIT)

def random_block_height():
    """获取随机区块高度"""
    return random.randint(1, MAX_BLOCK_HEIGHT)

def random_datetime():
    """获取随机时间"""
    from datetime import datetime, timedelta
    base = datetime.now()
    random_days = random.randint(-365, 0)
    return (base + timedelta(days=random_days)).isoformat() + "+00:00"


class UserBehavior(TaskSet):

    # 账户地址列表
    addr_path = 'data/address.txt'
    with open(addr_path, 'r', encoding='utf-8') as file_data:
        addr_data = file_data.readlines()
        addresses = [s.strip() for s in addr_data]

    # 区块hash列表
    block_path = 'data/block_hash.txt'
    with open(block_path, 'r', encoding='utf-8') as file_data:
        block_data = file_data.readlines()
        block_hashes = [s.strip() for s in block_data]

    # 交易hash列表
    tx_path = './data/tx_hash.txt'
    with open(tx_path, 'r', encoding='utf-8') as file_data:
        tx_data = file_data.readlines()
        tx_hashes = [s.strip() for s in tx_data]
    
    # 验证人地址列表
    validator_path = './data/validator.txt'
    with open(validator_path, 'r', encoding='utf-8') as file_data:
        validator_data = file_data.readlines()
        validators = [s.strip() for s in validator_data]


    # 区域ID列表
    region_path = 'data/region_id.txt'
    with open(region_path, 'r', encoding='utf-8') as file_data:
        region_data = file_data.readlines()
        region_ids = [s.strip() for s in region_data]

    # 提案ID列表
    proposal_path = 'data/proposal_id.txt'
    with open(proposal_path, 'r', encoding='utf-8') as file_data:
        proposal_data = file_data.readlines()
        proposal_ids = [int(s.strip()) for s in proposal_data]

    # 选举ID列表
    election_path = 'data/election_id.txt'
    with open(election_path, 'r', encoding='utf-8') as file_data:
        election_data = file_data.readlines()
        election_ids = [int(s.strip()) for s in election_data]

    # rollapp ID列表
    rollapp_path = 'data/rollapp_id.txt'
    with open(rollapp_path, 'r', encoding='utf-8') as file_data:
        rollapp_data = file_data.readlines()
        rollapp_ids = [s.strip() for s in rollapp_data]

        
    # ===== Daily API =====

    @tag('daily_tx_list')
    @task(1)
    def daily_tx_list(self):
        """每日交易数量列表"""
        params = {
            "limit": random_limit(),
            "offset": random_offset()
        }
        url = f'{self.user.host}/api/rest/daily/tx-list'
        with self.client.get(url, params=params, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    # ===== Check-in API =====

    @tag('checkin_list')
    @task(1)
    def checkin_list(self):
        """签到列表"""
        params = {
            "limit": random_limit(),
            "offset": random_offset()
        }
        url = f'{self.user.host}/api/rest/checkin/list'
        with self.client.get(url, params=params, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    @tag('checkin_count')
    @task(1)
    def checkin_count(self):
        """签到统计"""
        data = {
            "start_time": random_datetime(),
            "end_time": random_datetime()
        }
        url = f'{self.user.host}/api/rest/checkin/count'
        with self.client.post(url, json=data, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    @tag('checkin_count_address')
    @task(1)
    def checkin_count_address(self):
        """地址签到总数"""
        address = random.choice(self.addresses)
        url = f'{self.user.host}/api/rest/checkin/count/{address}'
        with self.client.get(url, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    @tag('checkin_record_detail')
    @task(1)
    def checkin_record_detail(self):
        """签到交易详情"""
        params = {
            "hash": random.choice(self.tx_hashes) if self.tx_hashes else "test_hash"
        }
        url = f'{self.user.host}/api/rest/checkin/record/detail'
        with self.client.get(url, params=params, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    @tag('checkin_region_txs')
    @task(1)
    def checkin_region_txs(self):
        """行政区签到交易列表"""
        params = {
            "limit": random_limit(),
            "offset": random_offset(),
            "region_id": random_region_id()
        }
        url = f'{self.user.host}/api/rest/checkin/region/txs'
        with self.client.get(url, params=params, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    @tag('checkin_region_counts')
    @task(1)
    def checkin_region_counts(self):
        """区域签到统计"""
        url = f'{self.user.host}/api/rest/checkin/region/counts'
        with self.client.get(url, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    # ===== Transfer Region API =====

    @tag('transfer_region')
    @task(1)
    def transfer_region(self):
        """查询转区信息"""
        address = random.choice(self.addresses)
        url = f'{self.user.host}/api/rest/transfer-region/{address}'
        with self.client.get(url, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    # ===== User Total Balance API =====

    @tag('user_total_balance')
    @task(1)
    def user_total_balance(self):
        """用户总余额"""
        url = f'{self.user.host}/api/rest/user-total-balance'
        with self.client.get(url, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    # ===== Transaction Info API =====

    @tag('tx_info')
    @task(1)
    def tx_info(self):
        """交易信息"""
        url = f'{self.user.host}/api/rest/tx-info'
        with self.client.get(url, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    # ===== Wallet Swap API =====

    @tag('wallet_swap_list')
    @task(1)
    def wallet_swap_list(self):
        """用户置换交易列表"""
        params = {
            "address": random.choice(self.addresses),
            "limit": random_limit(),
            "offset": random_offset()
        }
        url = f'{self.user.host}/api/rest/wallet/swap/list'
        with self.client.get(url, params=params, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    # ===== RollApp API =====

    @tag('rollapp_detail')
    @task(1)
    def rollapp_detail(self):
        """RollApp详情"""
        params = {
            "rollapp_id": random_rollapp_id(),
            "limit": random_limit(),
            "offset": random_offset()
        }
        url = f'{self.user.host}/api/rest/rollapp/detail'
        with self.client.get(url, params=params, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    @tag('rollapp_list')
    @task(1)
    def rollapp_list(self):
        """RollApp列表"""
        params = {
            "limit": random_limit(),
            "offset": random_offset()
        }
        url = f'{self.user.host}/api/rest/rollapp/list'
        with self.client.get(url, params=params, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    @tag('rollapp_update_states')
    @task(1)
    def rollapp_update_states(self):
        """RollApp更新状态列表"""
        params = {
            "limit": random_limit(),
            "offset": random_offset()
        }
        url = f'{self.user.host}/api/rest/rollapp/update-states'
        with self.client.get(url, params=params, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    @tag('rollapp_update_states_by_id')
    @task(1)
    def rollapp_update_states_by_id(self):
        """根据ID查询RollApp更新状态"""
        rollapp_id = random_rollapp_id()
        params = {
            "limit": random_limit(),
            "offset": random_offset()
        }
        url = f'{self.user.host}/api/rest/rollapp/update_states/{rollapp_id}'
        with self.client.get(url, params=params, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    @tag('rollapp_sequencers')
    @task(1)
    def rollapp_sequencers(self):
        """RollApp排序器列表"""
        params = {
            "rollappID": random_rollapp_id(),
            "limit": random_limit(),
            "offset": random_offset()
        }
        url = f'{self.user.host}/api/rest/rollapp/sequencers'
        with self.client.get(url, params=params, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    # ===== Liquidity API =====

    @tag('liquidity')
    @task(1)
    def liquidity(self):
        """流通量信息"""
        params = {
            "limit": random_limit(),
            "offset": random_offset()
        }
        url = f'{self.user.host}/api/rest/liquidity'
        with self.client.get(url, params=params, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    # ===== Block API =====

    @tag('block_detail_get')
    @task(1)
    def block_detail_get(self):
        """区块详情 (GET)"""
        params = {"hash": random.choice(self.block_hashes)} if random.choice([True, False]) else {"height": random_block_height()}
        url = f'{self.user.host}/api/rest/block/detail'
        with self.client.get(url, params=params, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    @tag('block_detail_post')
    @task(1)
    def block_detail_post(self):
        """区块详情 (POST)"""
        data = {"hash": random.choice(self.block_hashes)} if random.choice([True, False]) else {"height": random_block_height()}
        url = f'{self.user.host}/api/rest/block/detail'
        with self.client.post(url, json=data, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    @tag('block_list')
    @task(1)
    def block_list(self):
        """区块列表"""
        params = {
            "limit": random_limit(),
            "offset": random_offset()
        }
        url = f'{self.user.host}/api/rest/block/list'
        with self.client.get(url, params=params, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    @tag('block_module_transfers')
    @task(1)
    def block_module_transfers(self):
        """区块模块转账"""
        params = {
            "height": random_block_height(),
            "limit": random_limit(),
            "offset": random_offset()
        }
        url = f'{self.user.host}/api/rest/block/module-transfers'
        with self.client.get(url, params=params, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    @tag('block_txs_get')
    @task(1)
    def block_txs_get(self):
        """区块交易列表 (GET)"""
        params = {
            "height": random_block_height(),
            "limit": random_limit(),
            "offset": random_offset()
        }
        url = f'{self.user.host}/api/rest/block/txs'
        with self.client.get(url, params=params, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    @tag('block_txs_post')
    @task(1)
    def block_txs_post(self):
        """区块交易列表 (POST)"""
        data = {
            "height": random_block_height(),
            "limit": random_limit(),
            "offset": random_offset()
        }
        url = f'{self.user.host}/api/rest/block/txs'
        with self.client.post(url, json=data, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    @tag('block_average_block_time')
    @task(1)
    def block_average_block_time(self):
        """平均出块时间"""
        url = f'{self.user.host}/api/rest/block/average-block-time'
        with self.client.get(url, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    # ===== Region API =====

    @tag('region_detail')
    @task(1)
    def region_detail(self):
        """区域详情"""
        params = {
            "region_id": random_region_id()
        }
        url = f'{self.user.host}/api/rest/region/detail'
        with self.client.get(url, params=params, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    @tag('region_list')
    @task(1)
    def region_list(self):
        """区域列表"""
        url = f'{self.user.host}/api/rest/region/list'
        with self.client.get(url, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    @tag('region_delegate_summary')
    @task(1)
    def region_delegate_summary(self):
        """区域质押统计"""
        params = {
            "region_id": random_region_id(),
            "sub_region_id": random_region_id()
        }
        url = f'{self.user.host}/api/rest/region/delegate_summary'
        with self.client.get(url, params=params, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    @tag('region_liquidity')
    @task(1)
    def region_liquidity(self):
        """区域流通量"""
        params = {
            "region_id": random_region_id()
        }
        url = f'{self.user.host}/api/rest/region/liquidity'
        with self.client.get(url, params=params, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    @tag('region_statistic')
    @task(1)
    def region_statistic(self):
        """区域统计"""
        url = f'{self.user.host}/api/rest/region/statistic'
        with self.client.get(url, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    @tag('region_info')
    @task(1)
    def region_info(self):
        """区域信息"""
        url = f'{self.user.host}/api/rest/region/info'
        with self.client.get(url, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    @tag('region_account_list')
    @task(1)
    def region_account_list(self):
        """区域账户列表"""
        url = f'{self.user.host}/api/rest/region/account-list'
        with self.client.get(url, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    @tag('region_staking_trends')
    @task(1)
    def region_staking_trends(self):
        """区域质押趋势"""
        data = {
            "region_id": random_region_id(),
            "before_time": random_datetime(),
            "after_time": random_datetime(),
            "limit": random_limit(),
            "offset": random_offset()
        }
        url = f'{self.user.host}/api/rest/region/staking-trends'
        with self.client.post(url, json=data, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    # ===== Transaction API =====

    @tag('tx_detail')
    @task(1)
    def tx_detail(self):
        """交易详情"""
        tx_hash = random.choice(self.tx_hashes) if self.tx_hashes else "test_hash"
        url = f'{self.user.host}/api/rest/tx/detail/{tx_hash}'
        with self.client.get(url, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    @tag('tx_list')
    @task(1)
    def tx_list(self):
        """交易列表"""
        params = {
            "limit": random_limit(),
            "offset": random_offset()
        }
        url = f'{self.user.host}/api/rest/tx/list'
        with self.client.get(url, params=params, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    @tag('tx_asset_change_log')
    @task(1)
    def tx_asset_change_log(self):
        """交易资产变化日志"""
        data = {
            "address": random.choice(self.addresses),
            "tx_hash": random.choice(self.tx_hashes) if self.tx_hashes else "test_hash"
        }
        url = f'{self.user.host}/api/rest/tx/asset_change_log'
        with self.client.post(url, json=data, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    @tag('tx_ibc_transfer_list')
    @task(1)
    def tx_ibc_transfer_list(self):
        """IBC转账列表"""
        params = {
            "limit": random_limit(),
            "offset": random_offset()
        }
        url = f'{self.user.host}/api/rest/tx/ibc/transfer/list'
        with self.client.get(url, params=params, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    @tag('tx_raw_log')
    @task(1)
    def tx_raw_log(self):
        """交易原始日志"""
        params = {
            "hash": random.choice(self.tx_hashes) if self.tx_hashes else "test_hash"
        }
        url = f'{self.user.host}/api/rest/tx/raw-log'
        with self.client.get(url, params=params, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    # ===== Committee API =====

    @tag('committee_election_vote_info')
    @task(1)
    def committee_election_vote_info(self):
        """竞选投票信息"""
        data = {
            "election_id": random_election_id(),
            "limit": random_limit(),
            "offset": random_offset()
        }
        url = f'{self.user.host}/api/rest/committee/election_vote_info'
        with self.client.get(url, json=data, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    @tag('committee_proposal_vote_result')
    @task(1)
    def committee_proposal_vote_result(self):
        """提案投票结果"""
        data = {
            "proposal_id": random_proposal_id()
        }
        url = f'{self.user.host}/api/rest/committee/proposal_vote_result'
        with self.client.get(url, json=data, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    @tag('committee_candidate_detail')
    @task(1)
    def committee_candidate_detail(self):
        """候选人详情"""
        data = {
            "election_id": random_election_id(),
            "address": random.choice(self.addresses)
        }
        url = f'{self.user.host}/api/rest/committee/candidate_detail'
        with self.client.get(url, json=data, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    @tag('committee_proposal_vote_info')
    @task(1)
    def committee_proposal_vote_info(self):
        """提案投票信息"""
        data = {
            "proposal_id": random_proposal_id(),
            "limit": random_limit(),
            "offset": random_offset()
        }
        url = f'{self.user.host}/api/rest/committee/proposal_vote_info'
        with self.client.get(url, json=data, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    @tag('committee_candidate_info')
    @task(1)
    def committee_candidate_info(self):
        """候选人信息"""
        data = {
            "election_id": random_election_id(),
            "limit": random_limit(),
            "offset": random_offset()
        }
        url = f'{self.user.host}/api/rest/committee/candidate_info'
        with self.client.get(url, json=data, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    @tag('committee_proposal_vote_address_count')
    @task(1)
    def committee_proposal_vote_address_count(self):
        """提案投票地址数统计"""
        data = {
            "proposal_id": random_proposal_id()
        }
        url = f'{self.user.host}/api/rest/committee/proposal_vote_address_count'
        with self.client.get(url, json=data, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    # ===== Query Exists API =====

    @tag('query_exists')
    @task(1)
    def query_exists(self):
        """查询key是否存在"""
        keys = [
            random.choice(self.addresses),
            random.choice(self.tx_hashes),
            random.choice(self.block_hashes),
            str(random_block_height()),
            random.choice(self.validators),
        ]
        params = {
            "key": random.choice(keys)
        }
        url = f'{self.user.host}/api/rest/query_exists'
        with self.client.get(url, params=params, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    # ===== Account API =====

    @tag('account_system_address')
    @task(1)
    def account_system_address(self):
        """系统地址"""
        params = {
            "limit": random_limit(),
            "offset": random_offset()
        }
        url = f'{self.user.host}/api/rest/account/system_address'
        with self.client.get(url, params=params, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    @tag('account_transfer_of_antes')
    @task(1)
    def account_transfer_of_antes(self):
        """账户前置转账信息"""
        params = {
            "address": random.choice(self.addresses),
            "limit": random_limit(),
            "offset": random_offset()
        }
        url = f'{self.user.host}/api/rest/account/transfer_of_antes'
        with self.client.get(url, params=params, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    @tag('account_delegate_amount')
    @task(1)
    def account_delegate_amount(self):
        """账户质押金额"""
        params = {
            "address": random.choice(self.addresses),
            "region_id": random_region_id()
        }
        url = f'{self.user.host}/api/rest/account/delegate_amount'
        with self.client.get(url, params=params, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    @tag('account_delegate_info')
    @task(1)
    def account_delegate_info(self):
        """账户质押信息"""
        params = {
            "address": random.choice(self.addresses)
        }
        url = f'{self.user.host}/api/rest/account/delegate_info'
        with self.client.get(url, params=params, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    @tag('account_transfer_of_msgs')
    @task(1)
    def account_transfer_of_msgs(self):
        """账户消息转账列表"""
        data = {
            "address": random.choice(self.addresses),
            "filter_type": random.choice(["transfer", "staking", "swap"]),
            "start_time": random_datetime(),
            "end_time": random_datetime(),
            "limit": random_limit(),
            "offset": random_offset()
        }
        url = f'{self.user.host}/api/rest/account/transfer_of_msgs'
        with self.client.post(url, json=data, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    @tag('account_kyc_invite_rewards')
    @task(1)
    def account_kyc_invite_rewards(self):
        """KYC邀请奖励"""
        address = random.choice(self.addresses)
        params = {
            "limit": random_limit(),
            "offset": random_offset()
        }
        url = f'{self.user.host}/api/rest/account/kyc_invite_rewards/{address}'
        with self.client.get(url, params=params, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    @tag('account_event_of_msgs')
    @task(1)
    def account_event_of_msgs(self):
        """账户事件消息列表"""
        data = {
            "address": random.choice(self.addresses),
            "filter_type": random.choice(["star", "event"]),
            "limit": random_limit(),
            "offset": random_offset()
        }
        url = f'{self.user.host}/api/rest/account/event_of_msgs'
        with self.client.post(url, json=data, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    @tag('account_txs')
    @task(1)
    def account_txs(self):
        """账户交易列表"""
        address = random.choice(self.addresses)
        params = {
            "limit": random_limit(),
            "offset": random_offset()
        }
        url = f'{self.user.host}/api/rest/account/txs/{address}'
        with self.client.get(url, params=params, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    @tag('account_governance_address')
    @task(1)
    def account_governance_address(self):
        """治理地址"""
        params = {
            "limit": random_limit(),
            "offset": random_offset()
        }
        url = f'{self.user.host}/api/rest/account/governance_address'
        with self.client.get(url, params=params, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    @tag('account_module_txs')
    @task(1)
    def account_module_txs(self):
        """账户模块交易列表"""
        address = random.choice(self.addresses)
        params = {
            "limit": random_limit(),
            "offset": random_offset()
        }
        url = f'{self.user.host}/api/rest/account/module_txs/{address}'
        with self.client.get(url, params=params, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    @tag('account_asset_change_log')
    @task(1)
    def account_asset_change_log(self):
        """账户资产变化日志"""
        params = {
            "address": random.choice(self.addresses),
            "tx_hash": random.choice(self.tx_hashes) if self.tx_hashes else "test_hash"
        }
        url = f'{self.user.host}/api/rest/account/asset-change-log'
        with self.client.get(url, params=params, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    @tag('account_transfers')
    @task(1)
    def account_transfers(self):
        """账户转账信息"""
        address = random.choice(self.addresses)
        params = {
            "limit": random_limit(),
            "offset": random_offset()
        }
        url = f'{self.user.host}/api/rest/account/transfers/{address}'
        with self.client.get(url, params=params, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    @tag('account_all_governance_address')
    @task(1)
    def account_all_governance_address(self):
        """所有治理地址"""
        params = {
            "limit": random_limit(),
            "offset": random_offset()
        }
        url = f'{self.user.host}/api/rest/account/all_governance_address'
        with self.client.get(url, params=params, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    # ===== KYC API =====

    @tag('kyc_cancel_info')
    @task(1)
    def kyc_cancel_info(self):
        """KYC取消信息"""
        params = {
            "address": random.choice(self.addresses),
            "limit": random_limit(),
            "offset": random_offset()
        }
        url = f'{self.user.host}/api/rest/kyc/cancel/info'
        with self.client.get(url, params=params, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    # ===== Validator API =====

    @tag('validator_list')
    @task(1)
    def validator_list(self):
        """验证节点列表"""
        url = f'{self.user.host}/api/rest/validator/list'
        with self.client.get(url, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    @tag('validator_blocks')
    @task(1)
    def validator_blocks(self):
        """验证节点区块列表"""
        params = {
            "consensus_address": random.choice(self.validators),
            "limit": random_limit(),
            "offset": random_offset()
        }
        url = f'{self.user.host}/api/rest/validator/blocks'
        with self.client.get(url, params=params, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    @tag('validator_detail')
    @task(1)
    def validator_detail(self):
        """验证节点详情"""
        operator_address = random.choice(self.validators)
        url = f'{self.user.host}/api/rest/validator/{operator_address}'
        with self.client.post(url, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    # ===== Government Proposal API =====

    @tag('gov_proposal_detail')
    @task(1)
    def gov_proposal_detail(self):
        """政府提案详情"""
        params = {
            "proposal_id": random_proposal_id()
        }
        url = f'{self.user.host}/api/rest/gov/proposal/detail'
        with self.client.get(url, params=params, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    @tag('gov_proposal_list')
    @task(1)
    def gov_proposal_list(self):
        """政府提案列表"""
        params = {
            "limit": random_limit(),
            "offset": random_offset()
        }
        url = f'{self.user.host}/api/rest/gov/proposal/list'
        with self.client.get(url, params=params, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    @tag('gov_proposal_vote_counts')
    @task(1)
    def gov_proposal_vote_counts(self):
        """政府提案投票统计"""
        params = {
            "proposal_id": random_proposal_id()
        }
        url = f'{self.user.host}/api/rest/gov/proposal/vote-counts'
        with self.client.get(url, params=params, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")

    @tag('gov_proposal_votes')
    @task(1)
    def gov_proposal_votes(self):
        """政府提案投票信息"""
        params = {
            "proposal_id": random_proposal_id(),
            "limit": random_limit(),
            "offset": random_offset()
        }
        url = f'{self.user.host}/api/rest/gov/proposal/votes'
        with self.client.get(url, params=params, catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure(f"Error {response.status_code}: {response.text}")


class WebsiteUser(HttpUser):
    host = "http://192.168.0.100:8000"
    tasks = [UserBehavior]