using Microsoft.VisualBasic.Devices;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SomeApp
{
    class Program
    {
        static void OSInfo()
        {
            var os = System.Environment.OSVersion;
            Console.WriteLine("Platform ID: {0}", os.Platform == PlatformID.Win32NT ? "WinNT" : os.Platform.ToString());
            Console.WriteLine("Major version: {0}", os.Version.Major);
            Console.WriteLine("Minor version: {0}", os.Version.Minor);
            var ci = new ComputerInfo();
            string fullname = ci.OSFullName;
            Console.WriteLine("Name: {0}", fullname);
        }
        static string VBInfo()
        {
            try
            {
                var ci = new ComputerInfo();
                string fullname = ci.OSFullName;
                return fullname;
            }
            catch (Exception E)
            {
                var os = System.Environment.OSVersion;
                return os.Platform == PlatformID.Win32NT ? "WinNT" : os.Platform.ToString();
            }
        }
        static void Main(string[] args)
        {
            OSInfo();
        }
    }
}
