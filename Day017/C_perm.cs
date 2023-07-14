using System;

class Program
{
    static long[] dp = new long[13];

    static void Main()
    {
        int n = int.Parse(Console.ReadLine());

        dp[0] = 0;
        dp[1] = 0;
        dp[2] = 1;

        for (int i = 3; i <= n; i++)
        {
            dp[i] = (i - 1) * (dp[i - 1] + dp[i - 2]);
        }

        Console.WriteLine(dp[n]);
    }
}
/*
풀 루프를 사용하여 구할 수 도 있지만 공식을 활용하는 다이나믹 알고리즘을 이용하면 훨씬 시간복잡도와 공간복잡도를 줄일 수 있습니다.

n = 0 이거나 n = 1 일 때 : 0
n = 2 일 때 : 1
n > 2 일 때 : (n - 1) * (D(n - 1) + D(n - 2)) 이며, 여기서 D(n) 은 n개의 요소에 대한 완전 순열의 수입니다.

그래서 사용자로부터 입력을 받아 해당 숫자에 대한 완전 순열의 수를 계산하고 출력하는데 동적프로그래밍(Dynamic Programming )기법을 사용하여 
이전의 계산 결과를 저장하고 재사용합니다.
*/
