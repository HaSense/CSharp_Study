using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StarApp
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //5
            for(int i=0; i<5; i++)
            {
                for(int j=0; j<=i; j++)
                {
                    Console.Write("*");
                }
                Console.WriteLine();
            }

            Console.WriteLine();


            for(int i=5; i>0; i--)
            {
                for(int j=i; j>0; j--)
                {
                    Console.Write("*");
                }
                //for()
                Console.WriteLine();
            }
            
            Console.WriteLine();
            
            for(int i=0; i<5; i++)
            {
                for(int j=(5-i-1); j>0; j--)
                {
                    Console.Write(" ");
                }
                for(int k=0; k<=i; k++)
                {
                    Console.Write("*");
                }
                Console.WriteLine();
            }

            Console.WriteLine();

            for (int i = 0; i < 5; i++)
            {
                for (int k = 0; k < i; k++)
                {
                    Console.Write(" ");
                }

                for (int j = (5 - i - 1); j >=0; j--)
                {
                    Console.Write("*");
                }
                
                Console.WriteLine();
            }
        }
    }
}
