using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VariableLifeCycleEx01
{
    class Person
    {
        public int id { set; get; }
    }
    internal class Program
    {
        public static void ValueReturn(Person p)
        {
            p = new Person();
            p.id = 200;
        }
        static void Main(string[] args)
        {
            Person person = new Person();
            person.id = 100;

            ValueReturn(person);

            Console.WriteLine(person.id);
        }
    }
}
