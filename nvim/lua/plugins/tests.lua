-------------------------------------------------------------
-- 单元测试集成
-- https://github.com/nvim-neotest/neotest
-- https://github.com/nvim-neotest/neotest-jest
-- https://github.com/nvim-neotest/neotest-jest
-------------------------------------------------------------
return {
    {
        -- https://vitest.dev/
        'marilari88/neotest-vitest'
    },
    {
        -- rust
        'rouge8/neotest-rust'
    },
    {
        "nvim-neotest/neotest",
        opts = {
            adapters = {
                'neotest-vitest',
                'neotest-rust',
            }
        }
    }
}
