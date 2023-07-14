using System;
using System.Linq;
using System.Collections.Generic;

internal class Program
{
    static void Main(string[] args)
    {
        int N = int.Parse(Console.ReadLine());
        List<int> digits = Console.ReadLine().Split().Select(int.Parse).ToList();
        int count = 0;

        for (int i = 100; i < 1000; i++)
        {
            for (int j = 10; j < 100; j++)
            {
                if (IsProductValid(i, j, digits))
                {
                    count++;
                }
            }
        }

        Console.WriteLine(count);
    }

    static bool IsProductValid(int x, int y, List<int> digits)
    {
        int product1 = x * (y % 10);
        int product2 = x * (y / 10);
        int product = x * y;

        if (product1 < 100 || product1 > 999 ||
            product2 < 100 || product2 > 999 ||
            product < 1000 || product > 9999)
        {
            return false;
        }

        return IsDigitsInNumber(x, digits) &&
               IsDigitsInNumber(y, digits) &&
               IsDigitsInNumber(product1, digits) &&
               IsDigitsInNumber(product2, digits) &&
               IsDigitsInNumber(product, digits);
    }

    static bool IsDigitsInNumber(int number, List<int> digits)
    {
        while (number > 0)
        {
            if (!digits.Contains(number % 10))
            {
                return false;
            }
            number /= 10;
        }

        return true;
    }
}
