def solve_sudoku(sudoku)

  solve(sudoku)

end

def solve(sudoku)
  (0...sudoku.length).each do |row|
    (0...sudoku[row].length).each do |col|
      next unless sudoku[row][col] == 0

      1.upto(9).each do |elem|
        next unless is_valid?(sudoku, row, col, elem)

        sudoku[row][col] = elem

        return sudoku if solve(sudoku)

        sudoku[row][col] = 0
      end

      return false
    end
  end

  return true
end

def is_valid?(sudoku, row, col, elem)
  (0...9).each do |i|
    return false if sudoku[row][i] != 0 && sudoku[row][i] == elem

    return false if sudoku[i][col] != 0 && sudoku[i][col] == elem

    return false if sudoku[3 * (row / 3) + i / 3][3 * (col / 3) + i % 3] != 0 &&
      sudoku[3 * (row / 3) + i / 3][3 * (col / 3) + i % 3] == elem
  end
end

sudoku = [[5, 3, 0, 0, 7, 0, 0, 0, 0],
          [6, 0, 0, 1, 9, 5, 0, 0, 0],
          [0, 9, 8, 0, 0, 0, 0, 6, 0],
          [8, 0, 0, 0, 6, 0, 0, 0, 3],
          [4, 0, 0, 8, 0, 3, 0, 0, 1],
          [7, 0, 0, 0, 2, 0, 0, 0, 6],
          [0, 6, 0, 0, 0, 0, 2, 8, 0],
          [0, 0, 0, 4, 1, 9, 0, 0, 5],
          [0, 0, 0, 0, 8, 0, 0, 7, 9]]

result = solve_sudoku(sudoku)

puts("Result:\n")

width = result.flatten.max.to_s.size + 2
puts result.map { |a| a.map { |i| i.to_s.rjust(width) }.join }

