-- deep merge two tables
local function deep_merge(dst, src)
    for k, v in pairs(src) do
        if type(v) == 'table' then
            if dst[k] == nil then 
                dst[k] = {}
            end
            deep_merge(dst[k], v)
        else
            dst[k] = v
        end
    end
    return dst
end

-- shallow merge two tables
local function merge(dst, src)
    for k, v in pairs(src) do
        dst[k] = v
    end
    return dst
end

local function is_buffer_empty()
    -- Check whether the current buffer is empty
    return vim.fn.empty(vim.fn.expand '%:t') == 1
end

local function has_width_gt(cols)
    -- Check if the windows width is greater than a given number of columns
    return vim.fn.winwidth(0) / 2 > cols
end

return {
    deep_merge = deep_merge,
    merge = merge,
    is_buffer_empty = is_buffer_empty,
    has_width_gt = has_width_gt,
}
