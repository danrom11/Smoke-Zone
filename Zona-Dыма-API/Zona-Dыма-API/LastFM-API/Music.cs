using System;

namespace Zona_Dыма_API.LastFMAPI
{
    public class Music
    {
        public int id { get; set; }
        public string name { get; set; }
        public string artist { get; set; }
        public Music(int _id, string _name, string _artist)
        {
            id = _id;
            name = _name;
            artist = _artist;
        }
    }
}

