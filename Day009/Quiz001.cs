using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Quiz001
{
    internal class Program
    {
        static void ValueCheking(int n)
        {
            if (n < 0)
            {
                Console.WriteLine("값이 존재하지 않습니다. 프로그램을 종료합니다.");
                Environment.Exit(0);
            }
        }
        static void Main(string[] args)
        {
            Random random = new Random();
            int[] arr = new int[80];
            for(int i=0; i<80; i++)
            {
                arr[i] = random.Next(1, 101);
            }
            foreach(int i in arr) Console.Write(i + " ");
            Console.WriteLine();

            int n = Array.IndexOf(arr, 80);
            ValueCheking(n);
            Console.WriteLine("처음 등장한 값의 위치는 " + n);
            Array.Sort(arr);
            n = Array.IndexOf(arr, 80);
            ValueCheking(n);
            Console.WriteLine("정렬 후 등장한 값의 위치는 " + n);
        }
    }
}
