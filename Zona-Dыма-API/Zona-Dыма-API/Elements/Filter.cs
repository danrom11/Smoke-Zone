using System;
namespace Zona_Dыма_API.Elements
{
    public class Filter
    {
        public int id { get; set; }
        public string title { get; set; }
        public Filter(int _id, string _title)
        {
            id = _id;
            title = _title;
        }
    }
}

