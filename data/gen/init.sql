-- SELECT
--     inhrelid::regclass AS child_table
-- FROM
--     pg_inherits
-- WHERE
--     inhparent = 'public.transaction'::regclass;
CREATE TABLE IF NOT EXISTS public.transaction_p0 PARTITION OF public.transaction FOR
VALUES IN (0);
CREATE TABLE IF NOT EXISTS public.message_p0 PARTITION OF public.message FOR
VALUES IN (0);
-- Insert records into message_type table
INSERT INTO public.message_type ("type", "module", "label", height)
VALUES (
        'cosmos.bank.v1beta1.MsgSend',
        'bank',
        'MsgSend',
        6
    ),
    (
        'gea.rollapp.MsgCreateRollapp',
        'gea rollapp',
        'MsgCreateRollapp',
        20
    ),
    (
        'gea.sequencer.MsgCreateSequencer',
        'gea sequencer',
        'MsgCreateSequencer',
        23
    ),
    (
        'gea.rollapp.MsgUpdateState',
        'gea rollapp',
        'MsgUpdateState',
        28
    ),
    (
        'gea.dao.MsgUpdateDao',
        'gea dao',
        'MsgUpdateDao',
        231
    ),
    (
        'gea.staking.MsgDepositToSwapPool',
        'gea staking',
        'MsgDepositToSwapPool',
        239
    ),
    (
        'gea.staking.MsgSetSwapRate',
        'gea staking',
        'MsgSetSwapRate',
        240
    ),
    (
        'gea.staking.MsgCreateRegion',
        'gea staking',
        'MsgCreateRegion',
        237
    ),
    (
        'gea.kyc.MsgApprove',
        'gea kyc',
        'MsgApprove',
        235
    ),
    (
        'gea.nft.MsgNewClass',
        'gea nft',
        'MsgNewClass',
        11776
    ),
    (
        'gea.nft.MsgMintNFT',
        'gea nft',
        'MsgMintNFT',
        12053
    ),
    (
        'cosmos.nft.v1beta1.MsgSend',
        'nft',
        'MsgSend',
        12057
    ),
    (
        'gea.staking.MsgSwap',
        'gea staking',
        'MsgSwap',
        13210
    ),
    (
        'gea.staking.MsgWithdrawTreasury',
        'gea staking',
        'MsgWithdrawTreasury',
        13211
    ),
    (
        'gea.kyc.MsgCreateSBT',
        'gea kyc',
        'MsgCreateSBT',
        13266
    ),
    (
        'gea.kyc.MsgAddWhiteList',
        'gea kyc',
        'MsgAddWhiteList',
        13282
    ),
    (
        'gea.staking.MsgCreateDelegate',
        'gea staking',
        'MsgCreateDelegate',
        13611
    ),
    (
        'gea.staking.MsgCreateFixedDelegation',
        'gea staking',
        'MsgCreateFixedDelegation',
        13615
    ),
    (
        'gea.staking.MsgCreateLockUpDelegate',
        'gea staking',
        'MsgCreateLockUpDelegate',
        13633
    ),
    (
        'gea.staking.MsgDepositToInvitationRewardPool',
        'gea staking',
        'MsgDepositToInvitationRewardPool',
        13657
    ),
    (
        'gea.staking.MsgReduceLockUpDelegation',
        'gea staking',
        'MsgReduceLockUpDelegation',
        13715
    ),
    (
        'gea.staking.MsgKycUsersTransferToNewRegion',
        'gea staking',
        'MsgKycUsersTransferToNewRegion',
        13745
    ),
    (
        'gea.staking.MsgTransferRegion',
        'gea staking',
        'MsgTransferRegion',
        13793
    ),
    (
        'gea.kyc.MsgUpdate',
        'gea kyc',
        'MsgUpdate',
        13800
    ),
    (
        'gea.staking.MsgTreasuryToSwapPool',
        'gea staking',
        'MsgTreasuryToSwapPool',
        13852
    ),
    (
        'gea.staking.MsgUnDelegate',
        'gea staking',
        'MsgUnDelegate',
        13857
    ),
    (
        'gea.staking.MsgWithdrawFixedDelegation',
        'gea staking',
        'MsgWithdrawFixedDelegation',
        13883
    ),
    (
        'gea.staking.MsgUpdateDelegatorAddress',
        'gea staking',
        'MsgUpdateDelegatorAddress',
        13920
    ),
    (
        'gea.staking.MsgUpdateRegionOperator',
        'gea staking',
        'MsgUpdateRegionOperator',
        13975
    ),
    (
        'gea.staking.MsgWithdrawDelegationInterest',
        'gea staking',
        'MsgWithdrawDelegationInterest',
        13980
    ),
    (
        'gea.staking.MsgWithdrawLockUpReward',
        'gea staking',
        'MsgWithdrawLockUpReward',
        14013
    ),
    (
        'gea.dao.MsgUpdateGasFeeAccount',
        'gea dao',
        'MsgUpdateGasFeeAccount',
        14929
    ),
    (
        'gea.kyc.MsgRemove',
        'gea kyc',
        'MsgRemove',
        15079
    ),
    (
        'gea.kyc.MsgDeleteSBT',
        'gea kyc',
        'MsgDeleteSBT',
        15087
    ),
    (
        'gea.kyc.MsgRemoveWhiteList',
        'gea kyc',
        'MsgRemoveWhiteList',
        15108
    ),
    (
        'gea.kyc.MsgSharePhoto',
        'gea kyc',
        'MsgSharePhoto',
        15115
    ),
    ('gea.kyc.MsgStar', 'gea kyc', 'MsgStar', 15120),
    (
        'gea.staking.MsgWithdrawFromSwapPool',
        'gea staking',
        'MsgWithdrawFromSwapPool',
        17184
    ),
    (
        'gea.staking.MsgSetFixedDelegationInterestRate',
        'gea staking',
        'MsgSetFixedDelegationInterestRate',
        84818
    ),
    (
        'gea.staking.MsgWithdrawMintReward',
        'gea staking',
        'MsgWithdrawMintReward',
        101603
    ),
    (
        'gea.staking.MsgWithdrawFromInvitationRewardPool',
        'gea staking',
        'MsgWithdrawFromInvitationRewardPool',
        101850
    ),
    (
        'gea.bank.MsgModuleAccountSend',
        'gea bank',
        'MsgModuleAccountSend',
        102649
    ),
    (
        'cosmos.staking.v1beta1.MsgCreateValidator',
        'staking',
        'MsgCreateValidator',
        107035
    ),
    (
        'gea.staking.MsgUpdateRegion',
        'gea staking',
        'MsgUpdateRegion',
        110167
    );
-- Insert records into module_accounts table
INSERT INTO public.module_accounts (
        address,
        "name",
        account_type,
        description,
        region_id
    )
VALUES (
        'gea1x8wrky8f58m6nsd7twpywsegh58sh5j6gu7m3e',
        'region_gov_address',
        'region_gov_address',
        'region gov address for tha',
        'tha'
    ),
    (
        'gea1yjm4mzqv2xz66qezyerhqmkctszvjywrje6527',
        'region_gov_address',
        'region_gov_address',
        'region gov address for tha',
        'tha'
    ),
    (
        'gea156vz0pvt6qptzwygxwaw4jhugluzm9q57e4mgy',
        'whole_network_gov_address',
        'whole_network_gov_address',
        'whole network fifty gov addresses',
        ''
    ),
    (
        'gea143muq6z5j4whw0frpehg65c0fhqat2a2pp5nq0',
        'whole_network_gov_address',
        'whole_network_gov_address',
        'whole network fifty gov addresses',
        ''
    ),
    (
        'gea1gnhhrd2v0pq6e3utan6ltdydx87gyn33vqq0qx',
        'whole_network_gov_address',
        'whole_network_gov_address',
        'whole network fifty gov addresses',
        ''
    ),
    (
        'gea1nqpx3fqxyvc9h2prqnnnmggal783982ex4y4ff',
        'whole_network_gov_address',
        'whole_network_gov_address',
        'whole network fifty gov addresses',
        ''
    ),
    (
        'gea1f64wnfrlqx77qupf8995ev5wp9ymek5f8jplj3',
        'whole_network_gov_address',
        'whole_network_gov_address',
        'whole network fifty gov addresses',
        ''
    ),
    (
        'gea19l75jfv65uljmq99jvuls5th3kt688hytdh0ah',
        'whole_network_gov_address',
        'whole_network_gov_address',
        'whole network fifty gov addresses',
        ''
    ),
    (
        'gea1mlnpys7f86jtqystn50nc75anweykwdrh7rxa3',
        'whole_network_gov_address',
        'whole_network_gov_address',
        'whole network fifty gov addresses',
        ''
    ),
    (
        'gea1c7kahfgcxqjcl66d9ml9hr08pwlurnhzt2k5cm',
        'whole_network_gov_address',
        'whole_network_gov_address',
        'whole network fifty gov addresses',
        ''
    ),
    (
        'gea1v2rj9qj4ug24e0hrcelshr0g4kr5yfg54954et',
        'whole_network_gov_address',
        'whole_network_gov_address',
        'whole network fifty gov addresses',
        ''
    ),
    (
        'gea16ad7mtcvyduajnyu4uqlqcm4xhyzft2al77s2u',
        'whole_network_gov_address',
        'whole_network_gov_address',
        'whole network fifty gov addresses',
        ''
    ),
    (
        'gea1kk7p9l3qzyna9ccr2ht8266sa7q4cl3cru7593',
        'whole_network_gov_address',
        'whole_network_gov_address',
        'whole network fifty gov addresses',
        ''
    ),
    (
        'gea1le4n5ygy8kr2znh3nyve882yn0mflangdwy0pp',
        'whole_network_gov_address',
        'whole_network_gov_address',
        'whole network fifty gov addresses',
        ''
    ),
    (
        'gea103e0guzh3efxec67ssu3hg2y0m8wgrggn3wfl5',
        'whole_network_gov_address',
        'whole_network_gov_address',
        'whole network fifty gov addresses',
        ''
    ),
    (
        'gea1q7gcl4jm8nak0wkr3a2hwudnw8d0jy9g3aznsu',
        'whole_network_gov_address',
        'whole_network_gov_address',
        'whole network fifty gov addresses',
        ''
    ),
    (
        'gea1jf8rjpesjx2wnzx8lnf4875em93vx63ug4m90c',
        'whole_network_gov_address',
        'whole_network_gov_address',
        'whole network fifty gov addresses',
        ''
    ),
    (
        'gea1p29vps2ng9tjj3va4hmu8xv60hwe0hphumqevp',
        'region_kyc_invite_pool_address',
        'region_kyc_invite_pool_address',
        'region kyc invite pool address for chn',
        'chn'
    ),
    (
        'gea1v5xmg02fpplvfq6ylyz5yp89ckjuhj570xzkle',
        'whole_network_gov_address',
        'whole_network_gov_address',
        'whole network fifty gov addresses',
        ''
    ),
    (
        'gea1t9fwd4rh692zhqep3wpfmyxjgxm2dcylzz8z6n',
        'whole_network_gov_address',
        'whole_network_gov_address',
        'whole network fifty gov addresses',
        ''
    ),
    (
        'gea1tlr9kywmldt2gwhf7r909x9nhupsxe9rumu2lq',
        'whole_network_gov_address',
        'whole_network_gov_address',
        'whole network fifty gov addresses',
        ''
    ),
    (
        'gea1zhkajg6ps8lnc0lv422fyvsjvqkg4tvykjcu9q',
        'whole_network_gov_address',
        'whole_network_gov_address',
        'whole network fifty gov addresses',
        ''
    ),
    (
        'gea1c3ved0xmram45jpmpkjg4my99ytc3u5wjqmmqu',
        'whole_network_gov_address',
        'whole_network_gov_address',
        'whole network fifty gov addresses',
        ''
    ),
    (
        'gea1de928eeugjxy5gte8nqa5mgtku337fkjuqka33',
        'whole_network_gov_address',
        'whole_network_gov_address',
        'whole network fifty gov addresses',
        ''
    ),
    (
        'gea1tygms3xhhs3yv487phx3dw4a95jn7t7l09st6d',
        'not_bonded_tokens_pool',
        '/cosmos.auth.v1beta1.ModuleAccount',
        '',
        ''
    ),
    (
        'gea10d07y265gmmuvt4z0w9aw880jnsr700j5uksra',
        'gov',
        '/cosmos.auth.v1beta1.ModuleAccount',
        '',
        ''
    ),
    (
        'gea1gu5kqrz2yh4ngy7k6t8mmc368nhl967xzczpd0',
        'whole_network_gov_address',
        'whole_network_gov_address',
        'whole network fifty gov addresses',
        ''
    ),
    (
        'gea16qajykjpxm0tawtefntpzdkcqnjyvwt4cgwawq',
        'whole_network_gov_address',
        'whole_network_gov_address',
        'whole network fifty gov addresses',
        ''
    ),
    (
        'gea15yvkf9kx30gz0hvw52j8lmv9j07gy3m5paxa4d',
        'whole_network_gov_address',
        'whole_network_gov_address',
        'whole network fifty gov addresses',
        ''
    ),
    (
        'gea1k9f0tr647y0agx9yue65vkmqz24h0nj0acd0vn',
        'whole_network_gov_address',
        'whole_network_gov_address',
        'whole network fifty gov addresses',
        ''
    ),
    (
        'gea1nupjj56vpat7mymmnyzpjzvh208rvdc47euedh',
        'whole_network_gov_address',
        'whole_network_gov_address',
        'whole network fifty gov addresses',
        ''
    ),
    (
        'gea14rda5e4gfchx03lhvujh357zrj5264gjemr524',
        'whole_network_gov_address',
        'whole_network_gov_address',
        'whole network fifty gov addresses',
        ''
    ),
    (
        'gea1h3j5kq3efj96ga8gre6pxmp2qmfvs994ug7mh2',
        'txfees',
        '/cosmos.auth.v1beta1.ModuleAccount',
        '',
        ''
    ),
    (
        'gea1quarn305vjusjaqxzdm8du09w63gjx36j82g4w',
        'treasury_pool',
        '/cosmos.auth.v1beta1.ModuleAccount',
        '',
        ''
    ),
    (
        'gea13khtvp20yphkmc2uc43tmsngswh88al75sjen5',
        'sequencer',
        '/cosmos.auth.v1beta1.ModuleAccount',
        '',
        ''
    ),
    (
        'gea1vqu8rska6swzdmnhf90zuv0xmelej4lqrvqppx',
        'evm',
        '/cosmos.auth.v1beta1.ModuleAccount',
        '',
        ''
    ),
    (
        'gea1xds4f0m87ajl3a6az6s2enhxrd0wta487celx3',
        'wasm',
        '/cosmos.auth.v1beta1.ModuleAccount',
        '',
        ''
    ),
    (
        'gea17zes7y8jlc8estxjxn93m5a44es7qgtnx8dywk',
        'mint_reward_pool',
        '/cosmos.auth.v1beta1.ModuleAccount',
        '',
        ''
    ),
    (
        'gea1gmpxkchcdgfq995zye5efwzfw86zfa4v9tnvjx',
        'stake_tokens_pool',
        '/cosmos.auth.v1beta1.ModuleAccount',
        '',
        ''
    ),
    (
        'gea1m3h30wlvsf8llruxtpukdvsy0km2kum8x0zdjw',
        'mint',
        '/cosmos.auth.v1beta1.ModuleAccount',
        '',
        ''
    ),
    (
        'gea1g920yuxdmqtfxg4w8a0j9sgaazfryr2cg3gtp6',
        'bonded_stake_tokens_pool',
        '/cosmos.auth.v1beta1.ModuleAccount',
        '',
        ''
    ),
    (
        'gea14gcccn42ucahkf32nkug0t284y78hrmx5k8lga',
        'not_bonded_stake_tokens_pool',
        '/cosmos.auth.v1beta1.ModuleAccount',
        '',
        ''
    ),
    (
        'gea1yl6hdjhmkf37639730gffanpzndzdpmhqpnuzd',
        'transfer',
        '/cosmos.auth.v1beta1.ModuleAccount',
        '',
        ''
    ),
    (
        'gea17xpfvakm2amg962yls6f84z3kell8c5l78x47n',
        'fee_collector',
        '/cosmos.auth.v1beta1.ModuleAccount',
        '',
        ''
    ),
    (
        'gea1hr93qzcjspaa32px0qqywlh9hf9a8plgpxrrjf',
        'nft',
        '/cosmos.auth.v1beta1.ModuleAccount',
        '',
        ''
    ),
    (
        'gea1q3d2tp9rpjfmxdddq27newcrunfyfr6rpljhml',
        'whole_network_gov_address',
        'whole_network_gov_address',
        'whole network fifty gov addresses',
        ''
    ),
    (
        'gea12e7lguwsydcrk00a2mgyelgftgtp649gm3k2q5',
        'whole_network_gov_address',
        'whole_network_gov_address',
        'whole network fifty gov addresses',
        ''
    ),
    (
        'gea1c4k7f5p8y7aqvelz563ktkp0kmlvt6s8gzg7g2',
        'whole_network_gov_address',
        'whole_network_gov_address',
        'whole network fifty gov addresses',
        ''
    ),
    (
        'gea1rjetas2qxsa8hhj2zk27ljrcd8vchfr5eyrspv',
        'whole_network_gov_address',
        'whole_network_gov_address',
        'whole network fifty gov addresses',
        ''
    ),
    (
        'gea12g4dx5tjw9w4wxpnfjzhldmt42yhpdsqc9eh7n',
        'whole_network_gov_address',
        'whole_network_gov_address',
        'whole network fifty gov addresses',
        ''
    ),
    (
        'gea105k2uzfdwmyjyzgzsm87dv8tfhzghff8p0sxle',
        'whole_network_gov_address',
        'whole_network_gov_address',
        'whole network fifty gov addresses',
        ''
    ),
    (
        'gea1u5tugq32z0kwgnapk342thqjrwpk5ufzlwvc2u',
        'whole_network_gov_address',
        'whole_network_gov_address',
        'whole network fifty gov addresses',
        ''
    ),
    (
        'gea1ll59hsnmxtq23crnxx8jcxq23hxkrq3hnndlsn',
        'whole_network_gov_address',
        'whole_network_gov_address',
        'whole network fifty gov addresses',
        ''
    ),
    (
        'gea13qjyzfvz7gv4m4yz592rkpjmzh8yqgg6f6jvv8',
        'whole_network_gov_address',
        'whole_network_gov_address',
        'whole network fifty gov addresses',
        ''
    ),
    (
        'gea1fmeat58dczhpeyxfuxg2kprxx3wv2wyeyanull',
        'whole_network_gov_address',
        'whole_network_gov_address',
        'whole network fifty gov addresses',
        ''
    ),
    (
        'gea1rq6ppmr63tv94gwf0uzjdpgvr7h602tu0yr72s',
        'whole_network_gov_address',
        'whole_network_gov_address',
        'whole network fifty gov addresses',
        ''
    ),
    (
        'gea18xuaepav3yd7kc6ck8kq2fdwgjvxjmdnh4v7fk',
        'whole_network_gov_address',
        'whole_network_gov_address',
        'whole network fifty gov addresses',
        ''
    ),
    (
        'gea1hq3a35j8ywwf4czshlnejea0q7rcam4ych7lav',
        'whole_network_gov_address',
        'whole_network_gov_address',
        'whole network fifty gov addresses',
        ''
    ),
    (
        'gea16a6cr4wehek2hyfcq92l0hatythna542apws8g',
        'whole_network_gov_address',
        'whole_network_gov_address',
        'whole network fifty gov addresses',
        ''
    ),
    (
        'gea1mjul7aaqknxxmnz7gpfvex5qswfsrvhvggt9s9',
        'whole_network_gov_address',
        'whole_network_gov_address',
        'whole network fifty gov addresses',
        ''
    ),
    (
        'gea1a62auc54z0euqey3eaucw5e0zpngzzezhwxv6p',
        'whole_network_gov_address',
        'whole_network_gov_address',
        'whole network fifty gov addresses',
        ''
    ),
    (
        'gea104yscg2xnypj23yhs4w5wtt8y23ed4y42k4ftp',
        'whole_network_gov_address',
        'whole_network_gov_address',
        'whole network fifty gov addresses',
        ''
    ),
    (
        'gea1wwwp5mqrz48j8wvgu3r6rk9luq2rjasymvsn57',
        'whole_network_gov_address',
        'whole_network_gov_address',
        'whole network fifty gov addresses',
        ''
    ),
    (
        'gea19356tjkan2myzqt5zsj4y8ykyljjmk6q50uyc0',
        'whole_network_gov_address',
        'whole_network_gov_address',
        'whole network fifty gov addresses',
        ''
    ),
    (
        'gea1er0sfh35sfq5pn8n9umuhyxw2s5nzk09vl5ct5',
        'whole_network_gov_address',
        'whole_network_gov_address',
        'whole network fifty gov addresses',
        ''
    ),
    (
        'gea1a53udazy8ayufvy0s434pfwjcedzqv34cj8s7q',
        'ibc_transfer',
        'ibc_escrow_address',
        'IBC transfer  transfer_channel-0 escrow address',
        ''
    ),
    (
        'gea15z3t8u0jtquepws36zddpxpja4kl27kngwugnk',
        'region_base_address',
        'region_base_address',
        'region base address for tha',
        'tha'
    ),
    (
        'gea12vy2c22uggzk6n25u9nweze65s3220gl6r04z9',
        'region_delegation_address',
        'region_delegation_address',
        'region delegation address for tha',
        'tha'
    ),
    (
        'gea19t33q4fs0f4j2dn8kd5lnd2j82qy8weprv3xjm',
        'region_fixed_delegation_address',
        'region_fixed_delegation_address',
        'region fixed delegation address for tha',
        'tha'
    ),
    (
        'gea14qfdasvrv8v29fvg6qdf6lzhucjtkqzyhme6w2',
        'region_kyc_vault_address',
        'region_kyc_vault_address',
        'region kyc vault address for tha',
        'tha'
    ),
    (
        'gea19xczhpkj3rw2j30f4amx6vd6y4scxdky4d9x6y',
        'region_swap_pool_address',
        'region_swap_pool_address',
        'region swap pool address for tha',
        'tha'
    ),
    (
        'gea1nh5jn72vaxar56x2n5xqg75wate2wuhalemwud',
        'region_kyc_invite_pool_address',
        'region_kyc_invite_pool_address',
        'region kyc invite pool address for tha',
        'tha'
    ),
    (
        'gea185esw4jqrrnu3m9guacf240a947vs8h36qmpm5',
        'region_gov_address',
        'region_gov_address',
        'region gov address for tha',
        'tha'
    ),
    (
        'gea10apgxsxm7u9nxju7zxdd7lnakmzf970ujq3qas',
        'region_gov_address',
        'region_gov_address',
        'region gov address for tha',
        'tha'
    ),
    (
        'gea1zym5gc88sur4vavpzjtqw2kpealp664wrlp3yw',
        'region_gov_address',
        'region_gov_address',
        'region gov address for tha',
        'tha'
    ),
    (
        'gea1xsxe7c65yj20wsvsyjag5d7mqh6raezmzauadx',
        'whole_network_gov_address',
        'whole_network_gov_address',
        'whole network fifty gov addresses',
        ''
    ),
    (
        'gea1nf570yy6tam7c9m2w2huzvhcf339dvmscq0nvr',
        'whole_network_gov_address',
        'whole_network_gov_address',
        'whole network fifty gov addresses',
        ''
    ),
    (
        'gea16hxxh4ugtl7v6puz8vzcj0njc0wu7hadt56d38',
        'whole_network_gov_address',
        'whole_network_gov_address',
        'whole network fifty gov addresses',
        ''
    ),
    (
        'gea1v02eyh7c40kuca3xgqfckyc2rjqy62ll566t38',
        'region_kyc_vault_address',
        'region_kyc_vault_address',
        'region kyc vault address for global_village',
        'global_village'
    ),
    (
        'gea1fk7lsvktssz99ngd08w5j7audaklmw6mnzu824',
        'region_swap_pool_address',
        'region_swap_pool_address',
        'region swap pool address for global_village',
        'global_village'
    ),
    (
        'gea10v2m39wmarwh9xms4twjqzqxld8sk2hc98k38t',
        'region_gov_address',
        'region_gov_address',
        'region gov address for global_village',
        'global_village'
    ),
    (
        'gea17e3ddh5549gscvrkr5sw0c3f23p3ejwfxxlr9q',
        'invitation_reward_pool',
        '/cosmos.auth.v1beta1.ModuleAccount',
        '',
        ''
    ),
    (
        'gea1vjzw3u4zj2jnhwe7j972370w39xye3e3y3y6dy',
        'fixed_deposit_principal_pool',
        '/cosmos.auth.v1beta1.ModuleAccount',
        '',
        ''
    ),
    (
        'gea1hmmq6k63kpuy07pzws750gyq8kkrd893qgphfd',
        'evm_vfc_deployer',
        '/cosmos.auth.v1beta1.ModuleAccount',
        '',
        ''
    ),
    (
        'gea1fl48vsnmsdzcv85q5d2q4z5ajdha8yu3m9v6ve',
        'bonded_tokens_pool',
        '/cosmos.auth.v1beta1.ModuleAccount',
        '',
        ''
    ),
    (
        'gea1mk7pw34ypusacm29m92zshgxee3yreumvy5lvr',
        'rollapp',
        '/cosmos.auth.v1beta1.ModuleAccount',
        '',
        ''
    ),
    (
        'gea1hfsh9t5n7r4y390je7us9z9z39ypqswnk8t0fe',
        'region_base_address',
        'region_base_address',
        'region base address for chn',
        'chn'
    ),
    (
        'gea1aq0srphrzmctqvg9j87ffefz2gc46znujyyr7w',
        'region_delegation_address',
        'region_delegation_address',
        'region delegation address for chn',
        'chn'
    ),
    (
        'gea199kjuxd27adtu3yz8lmlzjcnx4htp9xgq5ttu3',
        'region_fixed_delegation_address',
        'region_fixed_delegation_address',
        'region fixed delegation address for chn',
        'chn'
    ),
    (
        'gea1r3mmlsnhtlpf68dnnmqt64zfh2dqs3wsnghxc9',
        'region_kyc_vault_address',
        'region_kyc_vault_address',
        'region kyc vault address for chn',
        'chn'
    ),
    (
        'gea1ln97waq8tsfajmv4zehtuuxjjeqzj9a0hghnjp',
        'region_base_address',
        'region_base_address',
        'region base address for isr',
        'isr'
    ),
    (
        'gea1jxr80e6dnjvf8529fjgem66zxr0xtd8rrjpq3r',
        'region_swap_pool_address',
        'region_swap_pool_address',
        'region swap pool address for chn',
        'chn'
    ),
    (
        'gea12pv47fl2q0ydwnyzqnz4kax55xaqs03ue4sgpe',
        'region_gov_address',
        'region_gov_address',
        'region gov address for chn',
        'chn'
    ),
    (
        'gea109rzcdwht0q5dhkrff4us250lfchw36hsdqr59',
        'region_gov_address',
        'region_gov_address',
        'region gov address for chn',
        'chn'
    ),
    (
        'gea17xxz6y3w6gnmceqr9mrqll5dpn385p5qldqjdc',
        'region_gov_address',
        'region_gov_address',
        'region gov address for chn',
        'chn'
    ),
    (
        'gea16mzzq3x9l2qy70mc38fyzxupj6h85nfw8hdpu3',
        'region_gov_address',
        'region_gov_address',
        'region gov address for chn',
        'chn'
    ),
    (
        'gea1d7j236aswq4s4flq9vcypust0ft6r4mkqxlujv',
        'region_gov_address',
        'region_gov_address',
        'region gov address for chn',
        'chn'
    ),
    (
        'gea1c4g5aekzjn8k4x9hhafhtxvaccc3c6flzmwv7h',
        'region_base_address',
        'region_base_address',
        'region base address for global_village',
        'global_village'
    ),
    (
        'gea19f8g2yh3lyk0zx4m8tkl8na2gwnhc89manegh0',
        'region_delegation_address',
        'region_delegation_address',
        'region delegation address for global_village',
        'global_village'
    ),
    (
        'gea1ar6wermx6zrq2tp250tks4dr0rvea5m0m2jj3v',
        'region_fixed_delegation_address',
        'region_fixed_delegation_address',
        'region fixed delegation address for global_village',
        'global_village'
    ),
    (
        'gea14cqcrgl9eeuaaxkpfhxsy5ee7xmf64w4a3ymee',
        'region_kyc_invite_pool_address',
        'region_kyc_invite_pool_address',
        'region kyc invite pool address for global_village',
        'global_village'
    ),
    (
        'gea1m0zj4kdn48v5cp9zf0tdlhw3z4u3uw2cnhqe2c',
        'region_gov_address',
        'region_gov_address',
        'region gov address for global_village',
        'global_village'
    ),
    (
        'gea1hq2hr6ax3ezpgf3q4pgxsrwvajk3qr7wq7wgnr',
        'region_gov_address',
        'region_gov_address',
        'region gov address for global_village',
        'global_village'
    ),
    (
        'gea12fpwkdvnpcz83gnntyggezszreuz4mj8uxnwh9',
        'region_gov_address',
        'region_gov_address',
        'region gov address for global_village',
        'global_village'
    ),
    (
        'gea15r23lzaw847tcq8xrlcaxcvrjrtw76pxrhdalf',
        'region_gov_address',
        'region_gov_address',
        'region gov address for global_village',
        'global_village'
    ),
    (
        'gea148wnh9ptl4et9cuc2u675tnd8h9htczzhawl65',
        'region_delegation_address',
        'region_delegation_address',
        'region delegation address for isr',
        'isr'
    ),
    (
        'gea13d5n7etnujvy9mqwp2j6a3h6dtut34jhuewvty',
        'region_fixed_delegation_address',
        'region_fixed_delegation_address',
        'region fixed delegation address for isr',
        'isr'
    ),
    (
        'gea17mxkuftam4mxgvjt3ka6hgkgcgjmxawj42ar7u',
        'region_kyc_vault_address',
        'region_kyc_vault_address',
        'region kyc vault address for isr',
        'isr'
    ),
    (
        'gea1d8gex4d7yyntnn6uz4h7050l53rcjteeh6whvm',
        'region_swap_pool_address',
        'region_swap_pool_address',
        'region swap pool address for isr',
        'isr'
    ),
    (
        'gea1a6nhqfurtxv9hcvru7x8pvssw86henylycdndx',
        'region_kyc_invite_pool_address',
        'region_kyc_invite_pool_address',
        'region kyc invite pool address for isr',
        'isr'
    ),
    (
        'gea1074jvvhwla3dk6ptpuxackajgn4mvhrugzju8n',
        'region_gov_address',
        'region_gov_address',
        'region gov address for isr',
        'isr'
    ),
    (
        'gea14a05l0txp0j8k9zr0e9avlckac4gtaqxgj8jj5',
        'region_gov_address',
        'region_gov_address',
        'region gov address for isr',
        'isr'
    ),
    (
        'gea18apex7py4tltnvat0l3hx8dz6qf6wqyktj5ezf',
        'region_gov_address',
        'region_gov_address',
        'region gov address for isr',
        'isr'
    ),
    (
        'gea1daj8z4p7rfqqyjpfjn750ae69sxd535dxjsn23',
        'region_gov_address',
        'region_gov_address',
        'region gov address for isr',
        'isr'
    ),
    (
        'gea1wzyvnvm8nsltqqw3wznusa7ht7aeglrclk2e45',
        'region_fixed_delegation_address',
        'region_fixed_delegation_address',
        'region fixed delegation address for mys',
        'mys'
    ),
    (
        'gea1fa7k76qrwgemkrmqq2j9xud4ljl0qjvl6uwjmu',
        'region_kyc_vault_address',
        'region_kyc_vault_address',
        'region kyc vault address for mys',
        'mys'
    ),
    (
        'gea1yhguyquy94ax7eqfqxptxkhwcesscapf8dxdxs',
        'region_gov_address',
        'region_gov_address',
        'region gov address for mys',
        'mys'
    ),
    (
        'gea16g4w2yx4vy0crv2dy493dgu9dmm6wg22d8hdcj',
        'region_gov_address',
        'region_gov_address',
        'region gov address for mys',
        'mys'
    ),
    (
        'gea1qg7d66kx4qxwtez63q26vhuetfh7qndrjmpvrh',
        'region_gov_address',
        'region_gov_address',
        'region gov address for mys',
        'mys'
    ),
    (
        'gea1g06qg2rz0uy7lfnjhm9unl8lqrer0c6ztz0ej4',
        'region_swap_pool_address',
        'region_swap_pool_address',
        'region swap pool address for nga',
        'nga'
    ),
    (
        'gea138e7gdy6wz80p8k32qk9sx2s7fzvrj8akyfc9l',
        'region_kyc_invite_pool_address',
        'region_kyc_invite_pool_address',
        'region kyc invite pool address for nga',
        'nga'
    ),
    (
        'gea18ase488nt5wfzv6mtyw43slj4gqrna8xc04jll',
        'region_gov_address',
        'region_gov_address',
        'region gov address for nga',
        'nga'
    ),
    (
        'gea16uys8vlv3h2lrar7wxpxpwelfclz20w75y8cr3',
        'region_gov_address',
        'region_gov_address',
        'region gov address for nga',
        'nga'
    ),
    (
        'gea15ed95adreyhpwleec8qvxx5lgcuktjnl5uuvcu',
        'region_gov_address',
        'region_gov_address',
        'region gov address for nga',
        'nga'
    ),
    (
        'gea14yvead2epq9guc9pg3gmgk3p226e6q6tk6xf7x',
        'region_gov_address',
        'region_gov_address',
        'region gov address for nga',
        'nga'
    ),
    (
        'gea1hhu3n3shjvdvdgegheretwaqwx0razm2lrqdd7',
        'region_base_address',
        'region_base_address',
        'region base address for vct',
        'vct'
    ),
    (
        'gea1ryrtgyg2smsqd5r5ddgh6g25adg4mu33hxkrmc',
        'region_delegation_address',
        'region_delegation_address',
        'region delegation address for vct',
        'vct'
    ),
    (
        'gea1yweu503qjah904p0kmx70wyjexlzud7xn5ry08',
        'region_fixed_delegation_address',
        'region_fixed_delegation_address',
        'region fixed delegation address for vct',
        'vct'
    ),
    (
        'gea1qnr7ww8hr5c7rj0rqpylpszm35lrq3j8qnxkq3',
        'region_kyc_vault_address',
        'region_kyc_vault_address',
        'region kyc vault address for vct',
        'vct'
    ),
    (
        'gea1tlf0k2tf7x97pcllx538plz3k84wfskllcp74y',
        'region_swap_pool_address',
        'region_swap_pool_address',
        'region swap pool address for vct',
        'vct'
    ),
    (
        'gea1y2g5m0qatjfwezx2x73953q8ycrpecr4av3zqy',
        'region_kyc_invite_pool_address',
        'region_kyc_invite_pool_address',
        'region kyc invite pool address for vct',
        'vct'
    ),
    (
        'gea1m8pt834k30dsqhthla5k0nsqedpecusawt3ny8',
        'region_gov_address',
        'region_gov_address',
        'region gov address for vct',
        'vct'
    ),
    (
        'gea1t3cpgl93jl8jg56fw04cj2f6t7he20p6wy6ptk',
        'region_gov_address',
        'region_gov_address',
        'region gov address for vct',
        'vct'
    ),
    (
        'gea1x5fw5jtt0t2tf30274s3u5akj5nap9wefa9dv4',
        'region_gov_address',
        'region_gov_address',
        'region gov address for vct',
        'vct'
    ),
    (
        'gea1w84t7ypz2x6ddnfcu07rydedg8jkpqcm09k459',
        'region_gov_address',
        'region_gov_address',
        'region gov address for vct',
        'vct'
    ),
    (
        'gea1rhcj87zl2gwgvhkjf70ch588nqj3jqzcp2t7ap',
        'region_gov_address',
        'region_gov_address',
        'region gov address for vct',
        'vct'
    ),
    (
        'gea14dskdc6h8he7p64y5eepzfcuh6zqqssuzne9fv',
        'region_base_address',
        'region_base_address',
        'region base address for ven',
        'ven'
    ),
    (
        'gea18xkk2hzn6g5dxssgphh09h7cps0tv3cfc3s5nn',
        'region_delegation_address',
        'region_delegation_address',
        'region delegation address for ven',
        'ven'
    ),
    (
        'gea1qsdzvhp2nldcauxtm9w55rez4t88axwxsqtf77',
        'region_fixed_delegation_address',
        'region_fixed_delegation_address',
        'region fixed delegation address for ven',
        'ven'
    ),
    (
        'gea1scmhsfnghzwlh9ttjh8u769a2zvm8c4ggxtrpe',
        'region_kyc_vault_address',
        'region_kyc_vault_address',
        'region kyc vault address for ven',
        'ven'
    ),
    (
        'gea1yauwsqjgngc3gze479ssygltcxjr5kt8x6f4t0',
        'region_kyc_invite_pool_address',
        'region_kyc_invite_pool_address',
        'region kyc invite pool address for ven',
        'ven'
    ),
    (
        'gea1zamypew3c76xkhfs7anmqrt2qfjq644uf3rfef',
        'region_gov_address',
        'region_gov_address',
        'region gov address for ven',
        'ven'
    ),
    (
        'gea1x4jyl9s7s4lv8ups8drs482c03fntstwz267mt',
        'region_gov_address',
        'region_gov_address',
        'region gov address for jpn',
        'jpn'
    ),
    (
        'gea1fr4ynvyuu5678ray4v6f2tpwmcju82d7juy7m4',
        'region_gov_address',
        'region_gov_address',
        'region gov address for jpn',
        'jpn'
    ),
    (
        'gea16ya4pa6ttncq7skggfr9pqtvrsmr336s6jm2x6',
        'region_gov_address',
        'region_gov_address',
        'region gov address for jpn',
        'jpn'
    ),
    (
        'gea17xqn3aja65pla6jk4kum02v3lmcwxwjglpv8q5',
        'region_gov_address',
        'region_gov_address',
        'region gov address for ven',
        'ven'
    ),
    (
        'gea1jrjphzwcwrn5ydkeuvlf37e4kaxtl6arhplj0g',
        'region_gov_address',
        'region_gov_address',
        'region gov address for ven',
        'ven'
    ),
    (
        'gea1dkkt87sj6re04tasjpjtagz2h3eegcjle7h2ve',
        'region_gov_address',
        'region_gov_address',
        'region gov address for ven',
        'ven'
    ),
    (
        'gea1k0y35gjusd4tkdsaphzww40ac8daj92mxmj4rf',
        'region_gov_address',
        'region_gov_address',
        'region gov address for ven',
        'ven'
    ),
    (
        'gea1gmr5ve4xa25jdkvnrywpp426n5cewc63ygwq53',
        'region_base_address',
        'region_base_address',
        'region base address for wlf',
        'wlf'
    ),
    (
        'gea1kv95tcs6uvv4azzsmtcs6mw022c7kukck9suj4',
        'region_delegation_address',
        'region_delegation_address',
        'region delegation address for wlf',
        'wlf'
    ),
    (
        'gea1s2rczvzfxvsutpq26w9skfcw28d5uc80460ch2',
        'region_fixed_delegation_address',
        'region_fixed_delegation_address',
        'region fixed delegation address for wlf',
        'wlf'
    ),
    (
        'gea1ccg8hmhuythpeapt07s0g99d3xehuavpknecel',
        'region_kyc_vault_address',
        'region_kyc_vault_address',
        'region kyc vault address for wlf',
        'wlf'
    ),
    (
        'gea1u8j4q8tcy6jjtepa2h9jlmvkuqk4g75u9y5s9g',
        'region_swap_pool_address',
        'region_swap_pool_address',
        'region swap pool address for wlf',
        'wlf'
    ),
    (
        'gea1j4x7ezj2wu0sjkvjrs655xh4g9j75k4k8j3dvn',
        'region_kyc_invite_pool_address',
        'region_kyc_invite_pool_address',
        'region kyc invite pool address for wlf',
        'wlf'
    ),
    (
        'gea1cc6k49l6j6ea3wanhe6mshl82yfw7dpunlvv8e',
        'region_gov_address',
        'region_gov_address',
        'region gov address for wlf',
        'wlf'
    ),
    (
        'gea15mn2q6es5cgc89lj25u4gf5hlgxjl4y8yk8yar',
        'region_gov_address',
        'region_gov_address',
        'region gov address for wlf',
        'wlf'
    ),
    (
        'gea1w4qxm856necnxlk6lyusswzfe9klzs2w5pydz8',
        'region_gov_address',
        'region_gov_address',
        'region gov address for wlf',
        'wlf'
    ),
    (
        'gea14qzc9gcztt6j4t0hwmc0yhj8yr7nenw3f0xt8n',
        'region_gov_address',
        'region_gov_address',
        'region gov address for wlf',
        'wlf'
    ),
    (
        'gea13tg4vp32md2l0uagj8qs5467wjrph78uy0fg7c',
        'region_gov_address',
        'region_gov_address',
        'region gov address for wlf',
        'wlf'
    ),
    (
        'gea19s0w29paw6lytj9920yv59gnelq73fpvmv2fru',
        'region_swap_pool_address',
        'region_swap_pool_address',
        'region swap pool address for ven',
        'ven'
    ),
    (
        'gea1fxh0j470h9m78zlv82v2ys8gz3saeral8x6xcu',
        'region_gov_address',
        'region_gov_address',
        'region gov address for isr',
        'isr'
    ),
    (
        'gea1quen36kk0ned9suefm2xp9jc6p62n3gghyapka',
        'region_base_address',
        'region_base_address',
        'region base address for jpn',
        'jpn'
    ),
    (
        'gea1vp6j00m20jy0l2e8w0z2fztu7t0atdmgvruk3a',
        'region_delegation_address',
        'region_delegation_address',
        'region delegation address for jpn',
        'jpn'
    ),
    (
        'gea18xjpyhqm67375hw986wkyp3hw8lxdc5ra4d2d8',
        'region_fixed_delegation_address',
        'region_fixed_delegation_address',
        'region fixed delegation address for jpn',
        'jpn'
    ),
    (
        'gea13ct3ja96qs3wx345wuv9mey7ccfjjer08w8krg',
        'region_kyc_vault_address',
        'region_kyc_vault_address',
        'region kyc vault address for jpn',
        'jpn'
    ),
    (
        'gea1z4ymp27w2fuxd624fw52g6q8736chks943h4jx',
        'region_swap_pool_address',
        'region_swap_pool_address',
        'region swap pool address for jpn',
        'jpn'
    ),
    (
        'gea1jjas0fd3c7fauyffn3aelzctlsk7ahs00eapx5',
        'region_kyc_invite_pool_address',
        'region_kyc_invite_pool_address',
        'region kyc invite pool address for jpn',
        'jpn'
    ),
    (
        'gea18204hvc8sqv9jx7m8pupm3s6qxx3673dc7hd4t',
        'region_gov_address',
        'region_gov_address',
        'region gov address for jpn',
        'jpn'
    ),
    (
        'gea17nggjxt97m8rmdad6a3wpz2wu68mk4hmxjvlzw',
        'region_gov_address',
        'region_gov_address',
        'region gov address for jpn',
        'jpn'
    ),
    (
        'gea1mm6qd2hr5ahqu3zpd6fnrwmehh2v9h0k44df5e',
        'region_base_address',
        'region_base_address',
        'region base address for mys',
        'mys'
    ),
    (
        'gea1tyw7mncld6dqj9f873zv8vftvmqmyqyfqwnqx6',
        'region_delegation_address',
        'region_delegation_address',
        'region delegation address for mys',
        'mys'
    ),
    (
        'gea10kfqahc3q9d0g8axk5zgvx5fredydyr3qkt7wc',
        'region_swap_pool_address',
        'region_swap_pool_address',
        'region swap pool address for mys',
        'mys'
    ),
    (
        'gea1arrs4d29x9c3kj8atttf228fp5xvwc2axn7fmn',
        'region_kyc_invite_pool_address',
        'region_kyc_invite_pool_address',
        'region kyc invite pool address for mys',
        'mys'
    ),
    (
        'gea19ctf9qcxjy52qvn7r5c3ge5m4ls9echpr37zcp',
        'region_gov_address',
        'region_gov_address',
        'region gov address for mys',
        'mys'
    ),
    (
        'gea1y4wrhvyps7jtkd3snr8j0zgkp6mukxg78pe7d6',
        'region_gov_address',
        'region_gov_address',
        'region gov address for mys',
        'mys'
    ),
    (
        'gea1d3e5zavq8x27zlz9egq00wqgmuv4w0cspmtezm',
        'region_base_address',
        'region_base_address',
        'region base address for nga',
        'nga'
    ),
    (
        'gea1evdp9llf0merghtfm7vgmjsqqsynqtckhvaw6z',
        'region_delegation_address',
        'region_delegation_address',
        'region delegation address for nga',
        'nga'
    ),
    (
        'gea1l8mtfe888nfv4dmqdaxffnymknn2z57mr9f593',
        'region_fixed_delegation_address',
        'region_fixed_delegation_address',
        'region fixed delegation address for nga',
        'nga'
    ),
    (
        'gea1mwa44nuwzkz8xjdzcv4vx7z0r06qh8kwa4v577',
        'region_kyc_vault_address',
        'region_kyc_vault_address',
        'region kyc vault address for nga',
        'nga'
    ),
    (
        'gea1rp3fljy76dc5uqp2q2r7eyw9vedac0txqrcugj',
        'region_gov_address',
        'region_gov_address',
        'region gov address for nga',
        'nga'
    );
-- Insert records into balance_states table
INSERT INTO public.balance_states (
        address,
        coins,
        ugea_amount,
        update_at_height,
        token_types,
        region_id,
        account_types
    )
SELECT address,
    '{"(ugea,100000000000000)"}',
    100000000000000,
    0,
    '{ugea}',
    region_id,
    1
FROM public.module_accounts;
-- Insert records into validator table
INSERT INTO public."validator" (consensus_address, consensus_pubkey)
VALUES (
        'geavalcons1vxd9un8hxhrd8r43ve00vs9n499ul6dqrkqpr7',
        'PubKeyEd25519{D5DA02F58029BE9C1E3A3108CC72BAB463DB74E9F0AF3FB404EC67F6EE7F2E53}'
    ),
    (
        'geavalcons190tudfavdm589n6t9fcmgnzw4n4ph3k6exhs5q',
        'geavalconspub19cpask5s5u0t7na3warn3hukgwuqazx8eghrwsy6mg4a0yjq8e8swznuu2'
    ),
    (
        'geavalcons1d2f25nyls0n9je3jv4s9wszeex9sjdua8g8pr3',
        'geavalconspub1t5zgxwmvmx9kmjfn4hnc0enzn8sf3vz9frwkqs6wnvxg5zzunxvqc4a4sg'
    ),
    (
        'geavalcons1jlmf3fxwqwexelhqzu9uv4x2z4c5jaahkae0ls',
        'geavalconspub1mqlj992xglqac42lajewhjt8jsj5ljkml9z4l3jkqc9zre9waueq8e7j8f'
    ),
    (
        'geavalcons1famrsmanfu7369gua50r6mnhz50z55fw2lnclj',
        'PubKeyEd25519{C05ACDB107D78F4EEB24B7E395015AA3849B3FDE10CADC90FD43CE6B917D07C6}'
    );
-- Insert records into account table
INSERT INTO public.account (address)
VALUES ('gea1zgyvn9wc26670n7ut4vsn9zk0xyx3j68mun9k0'),
    ('gea1ym84n7cqnphjr2sguyzujasxqptw8r2cj8q8yp'),
    ('gea1ddenrv4nxkgcydmml5fjqlt0j4fh7mxh575w6c'),
    ('gea1sh6dpzph34l76qe4zdjf6ana89n9snkl3feenw'),
    ('gea1htn8yeeshpxr5v8dvjslu3j9z9j2gsk8p679j4');
-- Insert records into validator_info table
INSERT INTO public.validator_info (
        consensus_address,
        operator_address,
        self_delegate_address,
        max_change_rate,
        max_rate,
        height
    )
VALUES (
        'geavalcons1d2f25nyls0n9je3jv4s9wszeex9sjdua8g8pr3',
        'geavaloper1zgyvn9wc26670n7ut4vsn9zk0xyx3j68w73qnn',
        'gea1zgyvn9wc26670n7ut4vsn9zk0xyx3j68mun9k0',
        '0.010000000000000000',
        '0.200000000000000000',
        291704
    ),
    (
        'geavalcons1famrsmanfu7369gua50r6mnhz50z55fw2lnclj',
        'geavaloper1ym84n7cqnphjr2sguyzujasxqptw8r2c89zzpa',
        'gea1ym84n7cqnphjr2sguyzujasxqptw8r2cj8q8yp',
        '0.010000000000000000',
        '0.200000000000000000',
        291704
    ),
    (
        'geavalcons1vxd9un8hxhrd8r43ve00vs9n499ul6dqrkqpr7',
        'geavaloper1ddenrv4nxkgcydmml5fjqlt0j4fh7mxhpuktly',
        'gea1ddenrv4nxkgcydmml5fjqlt0j4fh7mxh575w6c',
        '0.010000000000000000',
        '0.200000000000000000',
        291704
    ),
    (
        'geavalcons1jlmf3fxwqwexelhqzu9uv4x2z4c5jaahkae0ls',
        'geavaloper1sh6dpzph34l76qe4zdjf6ana89n9snklytmukj',
        'gea1sh6dpzph34l76qe4zdjf6ana89n9snkl3feenw',
        '0.010000000000000000',
        '0.200000000000000000',
        291704
    ),
    (
        'geavalcons190tudfavdm589n6t9fcmgnzw4n4ph3k6exhs5q',
        'geavaloper1htn8yeeshpxr5v8dvjslu3j9z9j2gsk85cuqhf',
        'gea1htn8yeeshpxr5v8dvjslu3j9z9j2gsk8p679j4',
        '0.010000000000000000',
        '0.200000000000000000',
        291704
    );
-- Insert records into region_states table
INSERT INTO public.region_states (
        created_at,
        updated_at,
        deleted_at,
        region_id,
        region_total_ans,
        region_total_kyc_amount_gea,
        region_ans_rate,
        user_min_delegate_gea,
        user_max_delegate_gea,
        region_fee_rate,
        operator_address,
        region_total_stake_allow_ans,
        delegation_address,
        base_account,
        fixed_delegation_account,
        fixed_delegation_annual_rate,
        region_gas_fee_account,
        swap_pool,
        lock_up_principal_term,
        lock_up_interest_term,
        lock_up_rate,
        kyc_vault_address,
        gov_addresses,
        current_occupy_ans,
        current_occupy_ans_rate,
        current_demand_total_ugea,
        current_kyc_amount,
        current_lock_up_total_ugea,
        current_fixed_delegation_total_ugea,
        current_normal_delegation_total_ugea,
        kyc_invite_pool
    )
VALUES (
        '2025-07-05 14:17:16.260541+08',
        '2025-07-05 16:18:46.285523+08',
        NULL,
        'chn',
        10.000000000000000000,
        2000,
        0.000000500000000000,
        '1gea',
        '4000gea',
        0.500000000000000000,
        'gea1jyqsz5d9tsxmca9r7qhtx65eqy47jlv84mgh8z',
        10.000000000000000000,
        'gea1aq0srphrzmctqvg9j87ffefz2gc46znujyyr7w',
        'gea1hfsh9t5n7r4y390je7us9z9z39ypqswnk8t0fe',
        'gea199kjuxd27adtu3yz8lmlzjcnx4htp9xgq5ttu3',
        '{"annualRate_1_months": "0.060000000000000000", "annualRate_2_months": "0.070000000000000000", "annualRate_3_months": "0.150000000000000000", "annualRate_4_months": "0.180000000000000000", "annualRate_5_months": "0.190000000000000000", "annualRate_6_months": "0.200000000000000000", "annualRate_7_months": "0.210000000000000000", "annualRate_8_months": "0.220000000000000000", "annualRate_9_months": "0.230000000000000000", "annualRate_10_months": "0.240000000000000000", "annualRate_11_months": "0.250000000000000000", "annualRate_12_months": "0.300000000000000000", "annualRate_24_months": "0.400000000000000000", "annualRate_36_months": "0.450000000000000000", "annualRate_48_months": "0.500000000000000000", "annualRate_60_months": "0.550000000000000000"}',
        'gea1l5s67sfr9rknvx49xpm4lghe795mp735w3he9y',
        'gea1jxr80e6dnjvf8529fjgem66zxr0xtd8rrjpq3r',
        1,
        2,
        0.100000000000000000,
        'gea1r3mmlsnhtlpf68dnnmqt64zfh2dqs3wsnghxc9',
        '{"gov_1": "gea12pv47fl2q0ydwnyzqnz4kax55xaqs03ue4sgpe", "gov_2": "gea109rzcdwht0q5dhkrff4us250lfchw36hsdqr59", "gov_3": "gea17xxz6y3w6gnmceqr9mrqll5dpn385p5qldqjdc", "gov_4": "gea16mzzq3x9l2qy70mc38fyzxupj6h85nfw8hdpu3", "gov_5": "gea1d7j236aswq4s4flq9vcypust0ft6r4mkqxlujv"}',
        2.222499997500000000,
        0.222249999750000000,
        88899999900,
        96,
        68700000000,
        5600000000,
        4999999900,
        'gea1p29vps2ng9tjj3va4hmu8xv60hwe0hphumqevp'
    ),
    (
        '2025-07-05 14:17:16.260541+08',
        '2025-07-05 16:18:46.285523+08',
        NULL,
        'global_village',
        17999976.000000000000000000,
        3599995200,
        0.899998800000000000,
        '1gea',
        '3200000000gea',
        0.500000000000000000,
        'gea1zn3rjevje84kmyj9rqpanc0ec0fjeg6wexymhc',
        16199978.400000000000000000,
        'gea19f8g2yh3lyk0zx4m8tkl8na2gwnhc89manegh0',
        'gea1c4g5aekzjn8k4x9hhafhtxvaccc3c6flzmwv7h',
        'gea1ar6wermx6zrq2tp250tks4dr0rvea5m0m2jj3v',
        '{"annualRate_1_months": "0.060000000000000000", "annualRate_2_months": "0.070000000000000000", "annualRate_3_months": "0.150000000000000000", "annualRate_4_months": "0.180000000000000000", "annualRate_5_months": "0.190000000000000000", "annualRate_6_months": "0.200000000000000000", "annualRate_7_months": "0.210000000000000000", "annualRate_8_months": "0.220000000000000000", "annualRate_9_months": "0.230000000000000000", "annualRate_10_months": "0.240000000000000000", "annualRate_11_months": "0.250000000000000000", "annualRate_12_months": "0.300000000000000000", "annualRate_24_months": "0.400000000000000000", "annualRate_36_months": "0.450000000000000000", "annualRate_48_months": "0.500000000000000000", "annualRate_60_months": "0.550000000000000000"}',
        'gea19e85p9sg5kcr0ae8fh8g98glycvs58cug3eyg5',
        'gea1fk7lsvktssz99ngd08w5j7audaklmw6mnzu824',
        1,
        2,
        0.020000000000000000,
        'gea1v02eyh7c40kuca3xgqfckyc2rjqy62ll566t38',
        '{"gov_1": "gea10v2m39wmarwh9xms4twjqzqxld8sk2hc98k38t", "gov_2": "gea1m0zj4kdn48v5cp9zf0tdlhw3z4u3uw2cnhqe2c", "gov_3": "gea1hq2hr6ax3ezpgf3q4pgxsrwvajk3qr7wq7wgnr", "gov_4": "gea12fpwkdvnpcz83gnntyggezszreuz4mj8uxnwh9", "gov_5": "gea15r23lzaw847tcq8xrlcaxcvrjrtw76pxrhdalf"}',
        125.412500000000000000,
        0.000006967370400938,
        5016500000000,
        49201,
        40500000000,
        31700000000,
        24200000000,
        'gea14cqcrgl9eeuaaxkpfhxsy5ee7xmf64w4a3ymee'
    ),
    (
        '2025-07-05 14:17:16.260541+08',
        '2025-07-05 16:18:46.285523+08',
        NULL,
        'isr',
        1.000000000000000000,
        200,
        0.000000050000000000,
        '1gea',
        '400gea',
        0.500000000000000000,
        'gea1sae8wz7340g4vct4e2zj4mcm0zs4y2mqdzjhes',
        1.000000000000000000,
        'gea148wnh9ptl4et9cuc2u675tnd8h9htczzhawl65',
        'gea1ln97waq8tsfajmv4zehtuuxjjeqzj9a0hghnjp',
        'gea13d5n7etnujvy9mqwp2j6a3h6dtut34jhuewvty',
        '{"annualRate_1_months": "0.060000000000000000", "annualRate_2_months": "0.070000000000000000", "annualRate_3_months": "0.150000000000000000", "annualRate_4_months": "0.180000000000000000", "annualRate_5_months": "0.190000000000000000", "annualRate_6_months": "0.200000000000000000", "annualRate_7_months": "0.210000000000000000", "annualRate_8_months": "0.220000000000000000", "annualRate_9_months": "0.230000000000000000", "annualRate_10_months": "0.240000000000000000", "annualRate_11_months": "0.250000000000000000", "annualRate_12_months": "0.300000000000000000", "annualRate_24_months": "0.400000000000000000", "annualRate_36_months": "0.450000000000000000", "annualRate_48_months": "0.500000000000000000", "annualRate_60_months": "0.550000000000000000"}',
        'gea1kkyh6c9wzfve8k4k38qm6mag8f8lrn4tcerqnf',
        'gea1d8gex4d7yyntnn6uz4h7050l53rcjteeh6whvm',
        1,
        2,
        0.100000000000000000,
        'gea17mxkuftam4mxgvjt3ka6hgkgcgjmxawj42ar7u',
        '{"gov_1": "gea1074jvvhwla3dk6ptpuxackajgn4mvhrugzju8n", "gov_2": "gea14a05l0txp0j8k9zr0e9avlckac4gtaqxgj8jj5", "gov_3": "gea18apex7py4tltnvat0l3hx8dz6qf6wqyktj5ezf", "gov_4": "gea1daj8z4p7rfqqyjpfjn750ae69sxd535dxjsn23", "gov_5": "gea1fxh0j470h9m78zlv82v2ys8gz3saeral8x6xcu"}',
        0.000000000000000000,
        0.000000000000000000,
        0,
        0,
        0,
        0,
        0,
        'gea1a6nhqfurtxv9hcvru7x8pvssw86henylycdndx'
    ),
    (
        '2025-07-05 14:17:16.260541+08',
        '2025-07-05 16:18:46.285523+08',
        NULL,
        'jpn',
        1000000.000000000000000000,
        200000000,
        0.050000000000000000,
        '1gea',
        '400000gea',
        0.500000000000000000,
        'gea1g3rg3jhxcm4t2rljzf6kf42fuqy8232wmqr0f4',
        100000.000000000000000000,
        'gea1vp6j00m20jy0l2e8w0z2fztu7t0atdmgvruk3a',
        'gea1quen36kk0ned9suefm2xp9jc6p62n3gghyapka',
        'gea18xjpyhqm67375hw986wkyp3hw8lxdc5ra4d2d8',
        '{"annualRate_1_months": "0.060000000000000000", "annualRate_2_months": "0.070000000000000000", "annualRate_3_months": "0.150000000000000000", "annualRate_4_months": "0.180000000000000000", "annualRate_5_months": "0.190000000000000000", "annualRate_6_months": "0.200000000000000000", "annualRate_7_months": "0.210000000000000000", "annualRate_8_months": "0.220000000000000000", "annualRate_9_months": "0.230000000000000000", "annualRate_10_months": "0.240000000000000000", "annualRate_11_months": "0.250000000000000000", "annualRate_12_months": "0.300000000000000000", "annualRate_24_months": "0.400000000000000000", "annualRate_36_months": "0.450000000000000000", "annualRate_48_months": "0.500000000000000000", "annualRate_60_months": "0.550000000000000000"}',
        'gea1g3rg3jhxcm4t2rljzf6kf42fuqy8232wmqr0f4',
        'gea1z4ymp27w2fuxd624fw52g6q8736chks943h4jx',
        1,
        1,
        0.100000000000000000,
        'gea13ct3ja96qs3wx345wuv9mey7ccfjjer08w8krg',
        '{"gov_1": "gea18204hvc8sqv9jx7m8pupm3s6qxx3673dc7hd4t", "gov_2": "gea17nggjxt97m8rmdad6a3wpz2wu68mk4hmxjvlzw", "gov_3": "gea1x4jyl9s7s4lv8ups8drs482c03fntstwz267mt", "gov_4": "gea1fr4ynvyuu5678ray4v6f2tpwmcju82d7juy7m4", "gov_5": "gea16ya4pa6ttncq7skggfr9pqtvrsmr336s6jm2x6"}',
        0.014999995000000000,
        0.000000014999995000,
        599999800,
        4,
        0,
        0,
        199999800,
        'gea1jjas0fd3c7fauyffn3aelzctlsk7ahs00eapx5'
    ),
    (
        '2025-07-05 14:17:16.260541+08',
        '2025-07-05 16:18:46.285523+08',
        NULL,
        'mys',
        1.000000000000000000,
        200,
        0.000000050000000000,
        '1gea',
        '400gea',
        0.500000000000000000,
        'gea1hgyna2ugp8vnx0edgk9fr3le00xnfnevg2uw7g',
        1.000000000000000000,
        'gea1tyw7mncld6dqj9f873zv8vftvmqmyqyfqwnqx6',
        'gea1mm6qd2hr5ahqu3zpd6fnrwmehh2v9h0k44df5e',
        'gea1wzyvnvm8nsltqqw3wznusa7ht7aeglrclk2e45',
        '{"annualRate_1_months": "0.060000000000000000", "annualRate_2_months": "0.070000000000000000", "annualRate_3_months": "0.150000000000000000", "annualRate_4_months": "0.180000000000000000", "annualRate_5_months": "0.190000000000000000", "annualRate_6_months": "0.200000000000000000", "annualRate_7_months": "0.210000000000000000", "annualRate_8_months": "0.220000000000000000", "annualRate_9_months": "0.230000000000000000", "annualRate_10_months": "0.240000000000000000", "annualRate_11_months": "0.250000000000000000", "annualRate_12_months": "0.300000000000000000", "annualRate_24_months": "0.400000000000000000", "annualRate_36_months": "0.450000000000000000", "annualRate_48_months": "0.500000000000000000", "annualRate_60_months": "0.550000000000000000"}',
        'gea1hgyna2ugp8vnx0edgk9fr3le00xnfnevg2uw7g',
        'gea10kfqahc3q9d0g8axk5zgvx5fredydyr3qkt7wc',
        1,
        2,
        0.100000000000000000,
        'gea1fa7k76qrwgemkrmqq2j9xud4ljl0qjvl6uwjmu',
        '{"gov_1": "gea1yhguyquy94ax7eqfqxptxkhwcesscapf8dxdxs", "gov_2": "gea16g4w2yx4vy0crv2dy493dgu9dmm6wg22d8hdcj", "gov_3": "gea1qg7d66kx4qxwtez63q26vhuetfh7qndrjmpvrh", "gov_4": "gea19ctf9qcxjy52qvn7r5c3ge5m4ls9echpr37zcp", "gov_5": "gea1y4wrhvyps7jtkd3snr8j0zgkp6mukxg78pe7d6"}',
        0.575000000000000000,
        0.575000000000000000,
        23000000000,
        7,
        21100000000,
        700000000,
        500000000,
        'gea1arrs4d29x9c3kj8atttf228fp5xvwc2axn7fmn'
    ),
    (
        '2025-07-05 14:17:16.260541+08',
        '2025-07-05 16:18:46.285523+08',
        NULL,
        'nga',
        1000000.000000000000000000,
        200000000,
        0.050000000000000000,
        '1gea',
        '3200000gea',
        0.200000000000000000,
        'gea14qjjl7p2qlqk5vkttxhqgad9tnx7jgecfd33ey',
        800000.000000000000000000,
        'gea1evdp9llf0merghtfm7vgmjsqqsynqtckhvaw6z',
        'gea1d3e5zavq8x27zlz9egq00wqgmuv4w0cspmtezm',
        'gea1l8mtfe888nfv4dmqdaxffnymknn2z57mr9f593',
        '{"annualRate_1_months": "0.060000000000000000", "annualRate_2_months": "0.070000000000000000", "annualRate_3_months": "0.150000000000000000", "annualRate_4_months": "0.180000000000000000", "annualRate_5_months": "0.190000000000000000", "annualRate_6_months": "0.200000000000000000", "annualRate_7_months": "0.210000000000000000", "annualRate_8_months": "0.220000000000000000", "annualRate_9_months": "0.230000000000000000", "annualRate_10_months": "0.240000000000000000", "annualRate_11_months": "0.250000000000000000", "annualRate_12_months": "0.300000000000000000", "annualRate_24_months": "0.400000000000000000", "annualRate_36_months": "0.450000000000000000", "annualRate_48_months": "0.500000000000000000", "annualRate_60_months": "0.550000000000000000"}',
        'gea14qjjl7p2qlqk5vkttxhqgad9tnx7jgecfd33ey',
        'gea1g06qg2rz0uy7lfnjhm9unl8lqrer0c6ztz0ej4',
        180,
        360,
        0.200000000000000000,
        'gea1mwa44nuwzkz8xjdzcv4vx7z0r06qh8kwa4v577',
        '{"gov_1": "gea1rp3fljy76dc5uqp2q2r7eyw9vedac0txqrcugj", "gov_2": "gea18ase488nt5wfzv6mtyw43slj4gqrna8xc04jll", "gov_3": "gea16uys8vlv3h2lrar7wxpxpwelfclz20w75y8cr3", "gov_4": "gea15ed95adreyhpwleec8qvxx5lgcuktjnl5uuvcu", "gov_5": "gea14yvead2epq9guc9pg3gmgk3p226e6q6tk6xf7x"}',
        0.000000000000000000,
        0.000000000000000000,
        0,
        0,
        0,
        0,
        0,
        'gea138e7gdy6wz80p8k32qk9sx2s7fzvrj8akyfc9l'
    ),
    (
        '2025-07-05 14:17:16.260541+08',
        '2025-07-05 16:18:46.285523+08',
        NULL,
        'vct',
        1.000000000000000000,
        200,
        0.000000050000000000,
        '1gea',
        '400gea',
        0.500000000000000000,
        'gea1ttf32qcwa6yvakcpd8774xayc33f5e2r58g68e',
        1.000000000000000000,
        'gea1ryrtgyg2smsqd5r5ddgh6g25adg4mu33hxkrmc',
        'gea1hhu3n3shjvdvdgegheretwaqwx0razm2lrqdd7',
        'gea1yweu503qjah904p0kmx70wyjexlzud7xn5ry08',
        '{"annualRate_1_months": "0.060000000000000000", "annualRate_2_months": "0.070000000000000000", "annualRate_3_months": "0.150000000000000000", "annualRate_4_months": "0.180000000000000000", "annualRate_5_months": "0.190000000000000000", "annualRate_6_months": "0.200000000000000000", "annualRate_7_months": "0.210000000000000000", "annualRate_8_months": "0.220000000000000000", "annualRate_9_months": "0.230000000000000000", "annualRate_10_months": "0.240000000000000000", "annualRate_11_months": "0.250000000000000000", "annualRate_12_months": "0.300000000000000000", "annualRate_24_months": "0.400000000000000000", "annualRate_36_months": "0.450000000000000000", "annualRate_48_months": "0.500000000000000000", "annualRate_60_months": "0.550000000000000000"}',
        'gea1ttf32qcwa6yvakcpd8774xayc33f5e2r58g68e',
        'gea1tlf0k2tf7x97pcllx538plz3k84wfskllcp74y',
        1,
        2,
        0.100000000000000000,
        'gea1qnr7ww8hr5c7rj0rqpylpszm35lrq3j8qnxkq3',
        '{"gov_1": "gea1m8pt834k30dsqhthla5k0nsqedpecusawt3ny8", "gov_2": "gea1t3cpgl93jl8jg56fw04cj2f6t7he20p6wy6ptk", "gov_3": "gea1x5fw5jtt0t2tf30274s3u5akj5nap9wefa9dv4", "gov_4": "gea1w84t7ypz2x6ddnfcu07rydedg8jkpqcm09k459", "gov_5": "gea1rhcj87zl2gwgvhkjf70ch588nqj3jqzcp2t7ap"}',
        0.547500000000000000,
        0.547500000000000000,
        21900000000,
        12,
        20700000000,
        0,
        0,
        'gea1y2g5m0qatjfwezx2x73953q8ycrpecr4av3zqy'
    ),
    (
        '2025-07-05 14:17:16.260541+08',
        '2025-07-05 16:18:46.285523+08',
        NULL,
        'ven',
        1.000000000000000000,
        200,
        0.000000050000000000,
        '1gea',
        '400gea',
        0.500000000000000000,
        'gea19cx9qckgp4yznc64augfhxx389yeztly96ssqp',
        1.000000000000000000,
        'gea18xkk2hzn6g5dxssgphh09h7cps0tv3cfc3s5nn',
        'gea14dskdc6h8he7p64y5eepzfcuh6zqqssuzne9fv',
        'gea1qsdzvhp2nldcauxtm9w55rez4t88axwxsqtf77',
        '{"annualRate_1_months": "0.060000000000000000", "annualRate_2_months": "0.070000000000000000", "annualRate_3_months": "0.150000000000000000", "annualRate_4_months": "0.180000000000000000", "annualRate_5_months": "0.190000000000000000", "annualRate_6_months": "0.200000000000000000", "annualRate_7_months": "0.210000000000000000", "annualRate_8_months": "0.220000000000000000", "annualRate_9_months": "0.230000000000000000", "annualRate_10_months": "0.240000000000000000", "annualRate_11_months": "0.250000000000000000", "annualRate_12_months": "0.300000000000000000", "annualRate_24_months": "0.400000000000000000", "annualRate_36_months": "0.450000000000000000", "annualRate_48_months": "0.500000000000000000", "annualRate_60_months": "0.550000000000000000"}',
        'gea19cx9qckgp4yznc64augfhxx389yeztly96ssqp',
        'gea19s0w29paw6lytj9920yv59gnelq73fpvmv2fru',
        1,
        2,
        0.100000000000000000,
        'gea1scmhsfnghzwlh9ttjh8u769a2zvm8c4ggxtrpe',
        '{"gov_1": "gea1zamypew3c76xkhfs7anmqrt2qfjq644uf3rfef", "gov_2": "gea17xqn3aja65pla6jk4kum02v3lmcwxwjglpv8q5", "gov_3": "gea1jrjphzwcwrn5ydkeuvlf37e4kaxtl6arhplj0g", "gov_4": "gea1dkkt87sj6re04tasjpjtagz2h3eegcjle7h2ve", "gov_5": "gea1k0y35gjusd4tkdsaphzww40ac8daj92mxmj4rf"}',
        0.000000000000000000,
        0.000000000000000000,
        0,
        0,
        0,
        0,
        0,
        'gea1yauwsqjgngc3gze479ssygltcxjr5kt8x6f4t0'
    ),
    (
        '2025-07-05 14:17:16.260541+08',
        '2025-07-05 16:18:46.285523+08',
        NULL,
        'wlf',
        10.000000000000000000,
        2000,
        0.000000500000000000,
        '1gea',
        '4000gea',
        0.500000000000000000,
        'gea10f6xg3y5zs3ylzgqhyyvk9kunytazeugcwuamf',
        10.000000000000000000,
        'gea1kv95tcs6uvv4azzsmtcs6mw022c7kukck9suj4',
        'gea1gmr5ve4xa25jdkvnrywpp426n5cewc63ygwq53',
        'gea1s2rczvzfxvsutpq26w9skfcw28d5uc80460ch2',
        '{"annualRate_1_months": "0.060000000000000000", "annualRate_2_months": "0.070000000000000000", "annualRate_3_months": "0.150000000000000000", "annualRate_4_months": "0.180000000000000000", "annualRate_5_months": "0.190000000000000000", "annualRate_6_months": "0.200000000000000000", "annualRate_7_months": "0.210000000000000000", "annualRate_8_months": "0.220000000000000000", "annualRate_9_months": "0.230000000000000000", "annualRate_10_months": "0.240000000000000000", "annualRate_11_months": "0.250000000000000000", "annualRate_12_months": "0.300000000000000000", "annualRate_24_months": "0.400000000000000000", "annualRate_36_months": "0.450000000000000000", "annualRate_48_months": "0.500000000000000000", "annualRate_60_months": "0.550000000000000000"}',
        'gea10f6xg3y5zs3ylzgqhyyvk9kunytazeugcwuamf',
        'gea1u8j4q8tcy6jjtepa2h9jlmvkuqk4g75u9y5s9g',
        1,
        2,
        0.100000000000000000,
        'gea1ccg8hmhuythpeapt07s0g99d3xehuavpknecel',
        '{"gov_1": "gea1cc6k49l6j6ea3wanhe6mshl82yfw7dpunlvv8e", "gov_2": "gea15mn2q6es5cgc89lj25u4gf5hlgxjl4y8yk8yar", "gov_3": "gea1w4qxm856necnxlk6lyusswzfe9klzs2w5pydz8", "gov_4": "gea14qzc9gcztt6j4t0hwmc0yhj8yr7nenw3f0xt8n", "gov_5": "gea13tg4vp32md2l0uagj8qs5467wjrph78uy0fg7c"}',
        0.010000000000000000,
        0.001000000000000000,
        400000000,
        2,
        200000000,
        0,
        0,
        'gea1j4x7ezj2wu0sjkvjrs655xh4g9j75k4k8j3dvn'
    );
-- Insert records into validator_description table
INSERT INTO public.validator_description (
        validator_address,
        moniker,
        "identity",
        avatar_url,
        website,
        security_contact,
        details,
        region_id,
        height
    )
VALUES (
        'geavalcons1vxd9un8hxhrd8r43ve00vs9n499ul6dqrkqpr7',
        'Global-node',
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        1
    ),
    (
        'geavalcons1jlmf3fxwqwexelhqzu9uv4x2z4c5jaahkae0ls',
        'CHN-node',
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        1
    ),
    (
        'geavalcons190tudfavdm589n6t9fcmgnzw4n4ph3k6exhs5q',
        'USA-node',
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        1
    ),
    (
        'geavalcons1d2f25nyls0n9je3jv4s9wszeex9sjdua8g8pr3',
        'IND-node',
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        1
    ),
    (
        'geavalcons1famrsmanfu7369gua50r6mnhz50z55fw2lnclj',
        'NGA-node',
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        122774
    );
INSERT INTO public.governance_community_accounts (
        "name",
        address,
        region_id,
        account_type,
        note,
        tag
    )
VALUES (
        'gov',
        'gea10d07y265gmmuvt4z0w9aw880jnsr700j5uksra',
        '',
        1,
        '治理地址',
        'system_address'
    ),
    (
        'transfer',
        'gea1yl6hdjhmkf37639730gffanpzndzdpmhqpnuzd',
        '',
        1,
        'ibc跨链转账锁币地址',
        'system_address'
    ),
    (
        'mint',
        'gea1m3h30wlvsf8llruxtpukdvsy0km2kum8x0zdjw',
        '',
        1,
        'mint模块铸币托管地址',
        'system_address'
    ),
    (
        'mint_reward_pool',
        'gea17zes7y8jlc8estxjxn93m5a44es7qgtnx8dywk',
        '',
        1,
        '区块奖励分给区金库后剩余的',
        'system_address'
    ),
    (
        'gov_1',
        'gea1k9f0tr647y0agx9yue65vkmqz24h0nj0acd0vn',
        '',
        1,
        '全网50个治理地址',
        'whole_network_governance_address'
    ),
    (
        'gov_2',
        'gea1nupjj56vpat7mymmnyzpjzvh208rvdc47euedh',
        '',
        1,
        '全网50个治理地址',
        'whole_network_governance_address'
    ),
    (
        'gov_3',
        'gea1v5xmg02fpplvfq6ylyz5yp89ckjuhj570xzkle',
        '',
        1,
        '全网50个治理地址',
        'whole_network_governance_address'
    ),
    (
        'gov_4',
        'gea1t9fwd4rh692zhqep3wpfmyxjgxm2dcylzz8z6n',
        '',
        1,
        '全网50个治理地址',
        'whole_network_governance_address'
    ),
    (
        'gov_5',
        'gea1tlr9kywmldt2gwhf7r909x9nhupsxe9rumu2lq',
        '',
        1,
        '全网50个治理地址',
        'whole_network_governance_address'
    ),
    (
        'gov_6',
        'gea1zhkajg6ps8lnc0lv422fyvsjvqkg4tvykjcu9q',
        '',
        1,
        '全网50个治理地址',
        'whole_network_governance_address'
    ),
    (
        'gov_7',
        'gea1c3ved0xmram45jpmpkjg4my99ytc3u5wjqmmqu',
        '',
        1,
        '全网50个治理地址',
        'whole_network_governance_address'
    ),
    (
        'gov_8',
        'gea1de928eeugjxy5gte8nqa5mgtku337fkjuqka33',
        '',
        1,
        '全网50个治理地址',
        'whole_network_governance_address'
    ),
    (
        'gov_9',
        'gea156vz0pvt6qptzwygxwaw4jhugluzm9q57e4mgy',
        '',
        1,
        '全网50个治理地址',
        'whole_network_governance_address'
    ),
    (
        'gov_10',
        'gea143muq6z5j4whw0frpehg65c0fhqat2a2pp5nq0',
        '',
        1,
        '全网50个治理地址',
        'whole_network_governance_address'
    ),
    (
        'gov_11',
        'gea1gnhhrd2v0pq6e3utan6ltdydx87gyn33vqq0qx',
        '',
        1,
        '全网50个治理地址',
        'whole_network_governance_address'
    ),
    (
        'gov_12',
        'gea1nqpx3fqxyvc9h2prqnnnmggal783982ex4y4ff',
        '',
        1,
        '全网50个治理地址',
        'whole_network_governance_address'
    ),
    (
        'gov_13',
        'gea1f64wnfrlqx77qupf8995ev5wp9ymek5f8jplj3',
        '',
        1,
        '全网50个治理地址',
        'whole_network_governance_address'
    ),
    (
        'gov_14',
        'gea19l75jfv65uljmq99jvuls5th3kt688hytdh0ah',
        '',
        1,
        '全网50个治理地址',
        'whole_network_governance_address'
    ),
    (
        'gov_15',
        'gea1mlnpys7f86jtqystn50nc75anweykwdrh7rxa3',
        '',
        1,
        '全网50个治理地址',
        'whole_network_governance_address'
    ),
    (
        'gov_16',
        'gea1c7kahfgcxqjcl66d9ml9hr08pwlurnhzt2k5cm',
        '',
        1,
        '全网50个治理地址',
        'whole_network_governance_address'
    ),
    (
        'gov_17',
        'gea1v2rj9qj4ug24e0hrcelshr0g4kr5yfg54954et',
        '',
        1,
        '全网50个治理地址',
        'whole_network_governance_address'
    ),
    (
        'gov_18',
        'gea16ad7mtcvyduajnyu4uqlqcm4xhyzft2al77s2u',
        '',
        1,
        '全网50个治理地址',
        'whole_network_governance_address'
    ),
    (
        'gov_19',
        'gea1kk7p9l3qzyna9ccr2ht8266sa7q4cl3cru7593',
        '',
        1,
        '全网50个治理地址',
        'whole_network_governance_address'
    ),
    (
        'gov_20',
        'gea1le4n5ygy8kr2znh3nyve882yn0mflangdwy0pp',
        '',
        1,
        '全网50个治理地址',
        'whole_network_governance_address'
    ),
    (
        'gov_21',
        'gea103e0guzh3efxec67ssu3hg2y0m8wgrggn3wfl5',
        '',
        1,
        '全网50个治理地址',
        'whole_network_governance_address'
    ),
    (
        'gov_22',
        'gea1q7gcl4jm8nak0wkr3a2hwudnw8d0jy9g3aznsu',
        '',
        1,
        '全网50个治理地址',
        'whole_network_governance_address'
    ),
    (
        'gov_23',
        'gea1jf8rjpesjx2wnzx8lnf4875em93vx63ug4m90c',
        '',
        1,
        '全网50个治理地址',
        'whole_network_governance_address'
    ),
    (
        'gov_24',
        'gea1gu5kqrz2yh4ngy7k6t8mmc368nhl967xzczpd0',
        '',
        1,
        '全网50个治理地址',
        'whole_network_governance_address'
    ),
    (
        'gov_25',
        'gea16qajykjpxm0tawtefntpzdkcqnjyvwt4cgwawq',
        '',
        1,
        '全网50个治理地址',
        'whole_network_governance_address'
    ),
    (
        'gov_26',
        'gea15yvkf9kx30gz0hvw52j8lmv9j07gy3m5paxa4d',
        '',
        1,
        '全网50个治理地址',
        'whole_network_governance_address'
    ),
    (
        'gov_27',
        'gea14rda5e4gfchx03lhvujh357zrj5264gjemr524',
        '',
        1,
        '全网50个治理地址',
        'whole_network_governance_address'
    ),
    (
        'gov_28',
        'gea1q3d2tp9rpjfmxdddq27newcrunfyfr6rpljhml',
        '',
        1,
        '全网50个治理地址',
        'whole_network_governance_address'
    ),
    (
        'gov_29',
        'gea12e7lguwsydcrk00a2mgyelgftgtp649gm3k2q5',
        '',
        1,
        '全网50个治理地址',
        'whole_network_governance_address'
    ),
    (
        'gov_30',
        'gea1c4k7f5p8y7aqvelz563ktkp0kmlvt6s8gzg7g2',
        '',
        1,
        '全网50个治理地址',
        'whole_network_governance_address'
    ),
    (
        'gov_31',
        'gea1rjetas2qxsa8hhj2zk27ljrcd8vchfr5eyrspv',
        '',
        1,
        '全网50个治理地址',
        'whole_network_governance_address'
    ),
    (
        'gov_32',
        'gea12g4dx5tjw9w4wxpnfjzhldmt42yhpdsqc9eh7n',
        '',
        1,
        '全网50个治理地址',
        'whole_network_governance_address'
    ),
    (
        'gov_33',
        'gea105k2uzfdwmyjyzgzsm87dv8tfhzghff8p0sxle',
        '',
        1,
        '全网50个治理地址',
        'whole_network_governance_address'
    ),
    (
        'gov_34',
        'gea1u5tugq32z0kwgnapk342thqjrwpk5ufzlwvc2u',
        '',
        1,
        '全网50个治理地址',
        'whole_network_governance_address'
    ),
    (
        'gov_35',
        'gea1ll59hsnmxtq23crnxx8jcxq23hxkrq3hnndlsn',
        '',
        1,
        '全网50个治理地址',
        'whole_network_governance_address'
    ),
    (
        'gov_36',
        'gea13qjyzfvz7gv4m4yz592rkpjmzh8yqgg6f6jvv8',
        '',
        1,
        '全网50个治理地址',
        'whole_network_governance_address'
    ),
    (
        'gov_37',
        'gea1fmeat58dczhpeyxfuxg2kprxx3wv2wyeyanull',
        '',
        1,
        '全网50个治理地址',
        'whole_network_governance_address'
    ),
    (
        'gov_38',
        'gea1rq6ppmr63tv94gwf0uzjdpgvr7h602tu0yr72s',
        '',
        1,
        '全网50个治理地址',
        'whole_network_governance_address'
    ),
    (
        'gov_39',
        'gea18xuaepav3yd7kc6ck8kq2fdwgjvxjmdnh4v7fk',
        '',
        1,
        '全网50个治理地址',
        'whole_network_governance_address'
    ),
    (
        'gov_40',
        'gea1hq3a35j8ywwf4czshlnejea0q7rcam4ych7lav',
        '',
        1,
        '全网50个治理地址',
        'whole_network_governance_address'
    ),
    (
        'gov_41',
        'gea16a6cr4wehek2hyfcq92l0hatythna542apws8g',
        '',
        1,
        '全网50个治理地址',
        'whole_network_governance_address'
    ),
    (
        'gov_42',
        'gea1mjul7aaqknxxmnz7gpfvex5qswfsrvhvggt9s9',
        '',
        1,
        '全网50个治理地址',
        'whole_network_governance_address'
    ),
    (
        'gov_43',
        'gea1a62auc54z0euqey3eaucw5e0zpngzzezhwxv6p',
        '',
        1,
        '全网50个治理地址',
        'whole_network_governance_address'
    ),
    (
        'gov_44',
        'gea104yscg2xnypj23yhs4w5wtt8y23ed4y42k4ftp',
        '',
        1,
        '全网50个治理地址',
        'whole_network_governance_address'
    ),
    (
        'gov_45',
        'gea1wwwp5mqrz48j8wvgu3r6rk9luq2rjasymvsn57',
        '',
        1,
        '全网50个治理地址',
        'whole_network_governance_address'
    ),
    (
        'gov_46',
        'gea19356tjkan2myzqt5zsj4y8ykyljjmk6q50uyc0',
        '',
        1,
        '全网50个治理地址',
        'whole_network_governance_address'
    ),
    (
        'gov_47',
        'gea1er0sfh35sfq5pn8n9umuhyxw2s5nzk09vl5ct5',
        '',
        1,
        '全网50个治理地址',
        'whole_network_governance_address'
    ),
    (
        'gov_48',
        'gea1xsxe7c65yj20wsvsyjag5d7mqh6raezmzauadx',
        '',
        1,
        '全网50个治理地址',
        'whole_network_governance_address'
    ),
    (
        'gov_49',
        'gea1nf570yy6tam7c9m2w2huzvhcf339dvmscq0nvr',
        '',
        1,
        '全网50个治理地址',
        'whole_network_governance_address'
    ),
    (
        'gov_50',
        'gea16hxxh4ugtl7v6puz8vzcj0njc0wu7hadt56d38',
        '',
        1,
        '全网50个治理地址',
        'whole_network_governance_address'
    );
INSERT INTO public.mint_records (
        start_height,
        end_height,
        mint
    )
VALUES (
        0,
        500000,
        '6300000000ugea,2536700000000ugag'
    ),
    (
        0,
        500000,
        '6400000000ugea,2538700000000ugag'
    );