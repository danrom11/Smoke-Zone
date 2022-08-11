using System;
using System.Collections.Generic;
using System.Net;
using Newtonsoft.Json.Linq;

namespace Zona_Dыма_API.LastFMAPI
{
    public static class MusicCommunication
    {
        public static Music GetMusic(string term)
        {
            WebClient webClient = new WebClient();

            var load = webClient.DownloadString("http://ws.audioscrobbler.com/2.0/?method=track.search&track=" + term + "&api_key=c6cc0ff75b0eb1829a247430ed2509ed&format=json&limit=5");
            var result = JObject.Parse(load);
            string name = result["results"]["trackmatches"]["track"][1].Value<string>("name");
            string artist = result["results"]["trackmatches"]["track"][1].Value<string>("artist");

            Console.WriteLine(name + "     |    " + artist);
            return new Music(0, name, artist);
        }

        public static List<Music> GetMusics(string term, int limit)
        {
            List<Music> musics = new List<Music>();
            WebClient webClient = new WebClient();
            var load = webClient.DownloadString("http://ws.audioscrobbler.com/2.0/?method=track.search&track=" + term + "&api_key=c6cc0ff75b0eb1829a247430ed2509ed&format=json&limit=" + limit);
            var resultJson = JObject.Parse(load);

            Console.WriteLine(resultJson);
            try
            {
                int countMusic = resultJson["results"].Value<int>("opensearch:totalResults");
                Console.WriteLine("COUNT: " + countMusic);

                if (countMusic > 0)
                {
                    for (int i = 0; i < (limit > countMusic ? countMusic : limit); i++)
                    {
                        string name = resultJson["results"]["trackmatches"]["track"][i].Value<string>("name");
                        string artist = resultJson["results"]["trackmatches"]["track"][i].Value<string>("artist");
                        if(checkRepeatingElements(musics, name, artist))
                            musics.Add(new Music(i, name, artist));
                    }
                }
                else
                {
                    musics.Add(new Music(-1, "null", "null"));
                }
            }
            catch
            {
                musics.Add(new Music(-1, "null", "null"));
            }


            Console.WriteLine("ZAPROS: ");
            for (int i = 0; i < musics.Count; i++)
                Console.WriteLine(i + " - " + musics[i].name + "  |  " + musics[i].artist);
            return musics;
        }

        private static bool checkRepeatingElements(List<Music> musics, string name, string artist)
        {
            return! musics.Exists(item => item.name == name && item.artist == artist);
        }
    }
}

