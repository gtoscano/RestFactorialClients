/*
mcs Program.cs -r:System.Web.Extensions.dll -out:Program.exe
mono Program.exe
*/


using System;
using System.Collections.Generic;
using System.Net;
using System.Web.Script.Serialization;

class Program
{
    static bool GetFactorial()
    {
        using (WebClient webClient = new WebClient())
        {
            string content;
            try
            {
                content = webClient.DownloadString("http://localhost:8000/factorial/5");
            }
            catch (WebException ex)
            {
                Console.Error.WriteLine($"Error: {ex.Message}");
                return false;
            }

            var serializer = new JavaScriptSerializer();
            var json = serializer.Deserialize<Dictionary<string, object>>(content);

            if (Convert.ToInt32(json["factorial"]) != 120)
            {
                Console.Error.WriteLine($"Error: Expected factorial value 120, got {json["factorial"]}");
                return false;
            }
        }

        return true;
    }

    static int Main()
    {
        if (GetFactorial())
        {
            Console.WriteLine("Test passed.");
            return 0;
        }
        else
        {
            Console.WriteLine("Test failed.");
            return 1;
        }
    }
}

