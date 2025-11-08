return function(colors)
  return {
    -- TypeScript & TSX keywords in teal
    ['@keyword.typescript'] = { fg = colors.teal },
    ['@keyword.tsx'] = { fg = colors.teal },

    -- (optional) more granular keyword kinds, keep or trim as you like
    ['@keyword.function.typescript'] = { fg = colors.teal },
    ['@keyword.operator.typescript'] = { fg = colors.teal },
    ['@keyword.return.typescript'] = { fg = colors.teal },
    ['@keyword.function.tsx'] = { fg = colors.teal },
    ['@keyword.operator.tsx'] = { fg = colors.teal },
    ['@keyword.return.tsx'] = { fg = colors.teal },
  }
end
